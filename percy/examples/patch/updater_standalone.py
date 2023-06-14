""" Patch a recipe

"""

import argparse
from pathlib import Path
import logging
import re
import copy
import json
from typing import Any
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

    def get(self, path: str, default: Any = KeyError) -> Any:
        """Get a value or section from the recipe

        >>> recipe.get('requirements/build')
        ['setuptools]
        >>> recipe.get('source/0/url')
        'https://somewhere'

        The **path** is a ``/`` separated list of dictionary keys to
        be walked in the recipe meta data. Numeric sections in the path
        access list elements. Using ``0`` in the path will get the first
        element in a list or the contents directly if there is no list.
        I.e., `source/0/url` will always get the first url, whether or
        not the source section is a list.

        Args:
          path: Path through YAML
          default: If not KeyError, this value will be returned
                   if the path does not exist in the recipe
        Raises:
          KeyError if no default given and the path does not exist.
        """
        try:
            nodes, keys = self._walk(path)
        except (KeyError, TypeError):
            if default is not KeyError:
                return default
            raise KeyError(f"No '{path}' in Recipe {self}") from None
        res = nodes[-1]
        if default is not KeyError and res is None:
            return default
        return res

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
        # read operation parameters
        op = operation["op"]
        path = operation["path"].replace("@output/", self.packages[package_name])
        match = operation.get("match", ".*")
        value = operation.get("value", [""])
        if isinstance(value, str):
            value = [value]
        if value == []:
            value = [""]

        # infer data type
        has_match = False
        in_list = False
        if op == "remove":
            raw_value = self.get(path, "NOPE")
            if raw_value == "NOPE":
                return
        if op in ["add", "replace"]:
            parent_path, parent_name = path.rsplit("/")
            if op == "add":
                raw_value = self.get(path, "NOPE")
                if raw_value == "NOPE":
                    match = "NOPE"
            else:
                raw_value = self.get(path)
            if isinstance(raw_value, str):
                if re.search(match, raw_value):
                    has_match = True
                    path = parent_path
                    value = [parent_name + ": " + val for val in value]
            else:
                in_list = True
                for el in raw_value:
                    if re.search(match, el):
                        has_match = True

        # get initial section range
        (start_row, start_col, end_row, end_col) = self.get_raw_range(path)
        range = copy.deepcopy(self.meta_yaml[start_row:end_row])

        # remove elements
        new_range = []
        insert_index = 0
        index_set = False
        for i, raw_value in enumerate(range):
            if not re.search(match, raw_value):
                new_range.append(raw_value)
                if not index_set:
                    if raw_value.strip():
                        insert_index = i + 1
            else:
                insert_index = i
                index_set = True
        range = new_range

        # add elements
        if op == "add" or (op == "replace" and has_match):
            for new_val in value:
                if in_list:
                    range.insert(insert_index, " " * start_col + f"- {new_val}")
                else:
                    range.insert(insert_index, " " * start_col + f"{new_val}")

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
        default="test_recipe.yaml",
    )
    parser.add_argument(
        "-p",
        "--patch_file",
        type=Path,
        help="patch_file path",
        default="test_patch",
    )
    return parser


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()

    """
        Patch operations:
            remove: remove a value
            add: add or replace  a value
            replace: replace a value
    """
    recipe = Recipe(args.recipe_path)
    with open(args.patch_file) as p:
        recipe.patch(json.load(p))
