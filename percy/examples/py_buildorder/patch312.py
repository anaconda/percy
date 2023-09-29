""" Patch a recipe

"""

import copy
import logging
import re
from pathlib import Path
from typing import Any

from ruamel.yaml import YAML

yaml = YAML(typ="jinja2")
yaml.indent(mapping=2, sequence=4, offset=2)
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
        self._set_original()

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

    def _set_original(self) -> None:
        """Store the current state of the recipe as "original" version"""
        self.orig = copy.deepcopy(self)

    def is_modified(self) -> bool:
        """Has recipe been modified.

        Returns:
            bool: True if recipe has been modified.
        """
        return self.meta_yaml != self.orig.meta_yaml

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

    def patch(self, operations, increment_build_number=False):
        for op in operations:
            if "@output" not in op["path"]:
                # apply global operation once only
                self._patch(op)
                self.save()
                self.reload()
            else:
                # apply package specific operation for all packages
                for package_path in self.packages.values():
                    opcopy = copy.deepcopy(op)
                    opcopy["path"] = opcopy["path"].replace("@output/", package_path)
                    self._patch(opcopy)
                    self.save()
                    self.reload()
        if self.is_modified():
            if increment_build_number:
                self._increment_build_number()
                self.save()
                self.render()
            logging.info(f"Patch applied: {self.path}")
            return True
        return False

    def _patch(self, operation):
        # read operation parameters
        op = operation["op"]
        path = operation["path"]
        match = operation.get("match", ".*")
        expanded_match = re.compile(f"\s+(?P<pattern>{match}[^#]*)(?P<selector>\s*#.*)?")
        value = operation.get("value", [""])
        if value == []:
            value = [""]
        opop = copy.deepcopy(operation)
        opop["path"] = path

        # infer data type
        in_list = False
        raw_value = self.get(path, "NOPE")
        if op == "remove":
            if raw_value == "NOPE":
                return
        elif op == "replace":
            if raw_value == "NOPE":
                return
            else:
                if not isinstance(raw_value, list):
                    if re.search(match, str(raw_value)):
                        parent_path, parent_name = path.rsplit("/", 1)
                        path = parent_path
                        expanded_match = re.compile(
                            f"\s+{parent_name}:\s+(?P<pattern>{match}[^#]*)(?P<selector>\s*#.*)?"
                        )
                else:
                    in_list = True
        elif op == "add":
            parent_path, parent_name = path.rsplit("/", 1)
            if raw_value == "NOPE":
                # path not found - add section and return

                # finding range of direct parent
                # (not doing the leg work of going up the tree if parent is not found)
                try:
                    (start_row, start_col, end_row, _) = self.get_raw_range(parent_path)
                except KeyError:
                    logging.warning(f"Path not found while applying op:{opop}")
                else:
                    # adding value to end of parent
                    # if value is a list, adding as a list to parent
                    # if value is a string, adding as parent: value
                    parent_range = copy.deepcopy(self.meta_yaml[start_row:end_row])
                    parent_insert_index = 0
                    for i, e in reversed(list(enumerate(parent_range))):
                        if e.strip():
                            parent_insert_index = i + 1
                            break
                    if isinstance(value, list):
                        parent_range.insert(
                            parent_insert_index,
                            " " * start_col + f"{parent_name}:",
                        )
                        for val in value:
                            parent_range.insert(
                                parent_insert_index + 1,
                                " " * start_col + f"  - {val}",
                            )
                    else:
                        parent_range.insert(
                            parent_insert_index,
                            " " * start_col + f"{parent_name}: {value}",
                        )
                    self.meta_yaml[start_row:end_row] = parent_range
                    return
            else:
                # path found - store value to add
                if not isinstance(raw_value, list):
                    if re.search(match, str(raw_value)):
                        path = parent_path
                        expanded_match = re.compile("NOPE")
                        if isinstance(value, list):
                            value = [parent_name + ": " + val for val in value]
                        else:
                            value = [f"{parent_name}: {value}"]
                else:
                    in_list = True

        # get initial section range
        try:
            (start_row, start_col, end_row, _) = self.get_raw_range(path)
        except KeyError:
            logging.warning(f"Path not found while applying op:{opop}")
            return
        range = copy.deepcopy(self.meta_yaml[start_row:end_row])

        # find matching elements
        match_lines = {}
        for i, line in enumerate(range):
            if not line.lstrip().startswith("#"):
                m = expanded_match.search(line)
                if m:
                    match_lines[i] = m
        match_lines = dict(sorted(match_lines.items(), reverse=True))

        # remove elements and find insert position
        new_range = copy.deepcopy(range)
        insert_index = 0
        index_set = False
        for i, m in match_lines.items():
            new_range.pop(i)
            insert_index = i
            index_set = True
        range = new_range
        if not index_set:
            for i, e in reversed(list(enumerate(range))):
                if e.strip():
                    insert_index = i + 1
                    break

        # add elements
        if op == "add" or (op == "replace" and match_lines):
            to_insert = set()
            for new_val in value:
                for i, m in match_lines.items():
                    to_insert.add(m.string.replace(m.groupdict()["pattern"], new_val).replace("#", "  #", 1))
            if not to_insert:
                to_insert = set(value)
            for new_val in to_insert:
                if in_list:
                    range.insert(
                        insert_index,
                        " " * start_col + f"- {new_val.strip(' -')}",
                    )
                else:
                    range.insert(insert_index, " " * start_col + f"{new_val.strip()}")

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


if __name__ == "__main__":
    operations = [
        {
            "op": "replace",
            "path": "@output/requirements/host",
            "match": "cython\\s+0.29.\\d+",
            "value": ["cython 0.29"],
        },
        {
            "op": "replace",
            "path": "@output/requirements/host",
            "match": "packaging\\s+2\\d.\\d",
            "value": ["packaging 23"],
        },
        {
            "op": "replace",
            "path": "@output/requirements/host",
            "match": "flit-core\\s+3.\\d.\\d",
            "value": ["flit-core 3"],
        },
        {
            "op": "replace",
            "path": "@output/requirements/host",
            "match": "poetry-core\\s+1.5.\\d",
            "value": ["poetry-core 1.5"],
        },
        {
            "op": "replace",
            "path": "@output/requirements/host",
            "match": "hatchling\\s+1.\\d+.\\d",
            "value": ["hatchling 1.18"],
        },
        {
            "op": "replace",
            "path": "@output/requirements/host",
            "match": "setuptools\\s+6\\d.\\d",
            "value": ["setuptools"],
        },
        {
            "op": "replace",
            "path": "@output/requirements/host",
            "match": "setuptools_scm\\s+[\\d\\.]+",
            "value": ["setuptools_scm"],
        },
    ]

    p = Path(".")
    for recipe_path in p.glob("**/recipe/meta.yaml"):
        try:
            recipe = Recipe(str(recipe_path))
            recipe.patch(operations, False)
        except:
            logging.error(f"Failed {recipe_path}")
