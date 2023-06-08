""" Patch a recipe

"""

import argparse
from pathlib import Path
import logging
import re
import copy

from ruamel.yaml import YAML

yaml = YAML(typ="jinja2")
yaml.indent(mapping=2, sequence=2, offset=2)
yaml.preserve_quotes = True
yaml.allow_duplicate_keys = True
yaml.width = 1000


logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)


class Recipe:
    def __init__(self, recipe_path):
        self.load(recipe_path)

    def load(self, recipe_path):
        self.path = recipe_path
        with open(recipe_path) as text:
            self.meta_yaml = text.read().splitlines()
        with open(recipe_path) as fp:
            self.meta = yaml.load(fp)
            self.packages = {}
            if not self.meta.get("outputs", []):
                name = self.meta.get("package", {}).get("name", "unknown").strip()
                self.packages[name] = ""
            else:
                outputs = self.meta.get("outputs", [])
                for n, output in enumerate(outputs):
                    name = output.get("name", "")
                    self.packages[name] = f"outputs/{n}/"

    def reload(self):
        self.load(self.path)

    def dump(self):
        """Dump recipe content"""
        return "\n".join(self.meta_yaml) + "\n"

    def save(self):
        """Save recipe dump to file"""
        with open(self.path, "w", encoding="utf-8") as fdes:
            fdes.write(self.dump())

    def _walk(self, path, noraise=False):
        nodes = [self.meta]
        keys = []
        for key in path.split("/"):
            last = nodes[-1]
            if key.isdigit():
                number = int(key)
                if isinstance(last, list):
                    if noraise and len(last) < number:
                        break
                    nodes.append(last[number])
                    keys.append(number)
                    continue
                if isinstance(last, dict) and number == 0:
                    continue
            if noraise and key not in last:
                break
            nodes.append(last[key])
            keys.append(key)
        return nodes, keys

    def get_raw_range(self, path):
        """Locate the position of a node in the YAML within the raw text

        See also `get_raw()` if you want to get the content of the unparsed
        meta.yaml at a specific key.

        Args:
          path: The "path" to the node. Use numbers for lists ('source/1/url')

        Returns:
          a tuple of first_row, first_column, last_row, last_column
        """
        if not path:
            if self.meta_yaml:
                return 0, 0, len(self.meta_yaml), len(self.meta_yaml[-1])
            else:
                return 0, 0, 0, 0

        nodes, keys = self._walk(path)
        nodes.pop()  # pop parsed value

        # get the start row/col for the value
        if isinstance(keys[-1], int):
            start_row, start_col = nodes[-1].lc.key(keys[-1])
        else:
            start_row, start_col = nodes[-1].lc.value(keys[-1])

        # getting the end is more complicated, we need to move
        # up the tree to the next item in order until one is not the last
        # item in its collection
        while nodes:
            node = nodes.pop()
            key = keys.pop()
            if isinstance(key, int):
                if key + 1 < len(node):
                    end_row, end_col = node.lc.key(key + 1)
                    break
            else:
                node_keys = list(node.keys())
                if key != node_keys[-1]:
                    next_key = node_keys[node_keys.index(key) + 1]
                    end_row, end_col = node.lc.key(next_key)
                    break
        else:  # reached end of file
            end_row = len(self.meta_yaml) - 1
            end_col = len(self.meta_yaml[end_row])

        # now go backward
        return (start_row, start_col, end_row, end_col)

    def patch(self, operations):
        package_names = self.packages.keys()
        for op in operations:
            for package_name in package_names:
                self._patch(op, package_name)
                self.save()
                self.reload()
        self._increment_build_number()
        self.save()
        self.reload()

    def _patch(self, operation, package_name):
        section = operation["section"]
        pkg = operation["package"]
        section = operation["section"]
        constraints = operation["constraint"]
        type = operation["op"]

        # get initial section range
        (start_row, start_col, end_row, end_col) = self.get_raw_range(
            f"{self.packages[package_name]}requirements/{section}"
        )
        range = copy.deepcopy(self.meta_yaml[start_row:end_row])

        # does section has dep?
        has_dep = False
        for raw_dep in range:
            splits = re.split(r"[\s<=>]", str(raw_dep).strip(" -"), 1)
            if splits[0].strip().lower() == pkg.strip().lower() or re.match(
                f".*['\"]{pkg.strip()}['\"].*", raw_dep
            ):
                has_dep = True
                break

        # remove elements
        new_range = []
        if type in ["remove", "replace", "add_or_replace"]:
            for raw_dep in range:
                splits = re.split(r"[\s<=>]", str(raw_dep).strip(" -"), 1)
                if splits[0].strip().lower() != pkg.strip().lower() and not re.match(
                    f".*['\"]{pkg.strip()}['\"].*", raw_dep
                ):
                    new_range.append(raw_dep)
            range = new_range

        # add elements
        if type in ["add", "replace", "add_or_replace"]:
            if type != "replace" or has_dep:
                for constraint in constraints:
                    range.insert(end_row, " " * start_col + f"- {pkg} {constraint}")

        # apply change
        self.meta_yaml[start_row:end_row] = range

    def _increment_build_number(self):
        build_number = int(self.meta["build"]["number"]) + 1
        patterns = (
            ("(?=\s*?)number:\s*([0-9]+)", "number: {}".format(build_number)),
            (
                '(?=\s*?){%\s*set build_number\s*=\s*"?([0-9]+)"?\s*%}',
                "{{% set build_number = {} %}}".format(build_number),
            ),
            (
                '(?=\s*?){%\s*set build\s*=\s*"?([0-9]+)"?\s*%}',
                "{{% set build = {} %}}".format(build_number),
            ),
        )
        text = "\n".join(self.meta_yaml)
        for pattern, replacement in patterns:
            text = re.sub(pattern, replacement, text)
        self.meta_yaml = text.split("\n")


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="aggregate_issue_finder",
        description="Find issues in aggregate pinned feedstocks.",
    )
    parser.add_argument(
        "-r",
        "--recipe_path",
        type=Path,
        help="recipe path",
        default="/Users/cbousseau/work/recipes/aggregate2/cartopy-feedstock/recipe/meta.yaml",
    )
    return parser


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()

    # update pin and increment build number
    """
        Patch operations:
            replace : if package is found in section, replace by "- package constraint"
            add: add "- package constraint" to section
            add_or_replace : add or replace by "- package constraint"
            remove: remove "- package" from section
    """
    operations = [
        {
            "op": "add_or_replace",
            "section": "host",
            "package": "openssl",
            "constraint": ["{{ openssl }}"],
        },
        {
            "op": "add_or_replace",
            "section": "run",
            "package": "openssl",
            "constraint": ["3.*"],
        },
        {
            "op": "replace",
            "section": "host",
            "package": "numpy",
            "constraint": ["1.21  # [py<311]", "1.23  # [py>=311]"],
        },
        {
            "op": "replace",
            "section": "run",
            "package": "numpy",
            "constraint": [">=1.21,<=2.0a0  # [py<311]", ">=1.23,<=2.0a0  # [py>=311]"],
        },
        {"op": "remove", "section": "host", "package": "geos", "constraint": []},
        {"op": "remove", "section": "run", "package": "geos", "constraint": []},
        {"op": "add", "section": "host", "package": "geos2", "constraint": ["1.2.3"]},
        {
            "op": "add",
            "section": "run",
            "package": "{{ pin_compatible('geos2') }}",
            "constraint": [""],
        },
    ]
    recipe = Recipe(args.recipe_path)
    recipe.patch(operations)
