"""
File:           recipe_parser.py
Description:    Provides a class that takes text from a Jinja-formatted recipe
                file and parses it. This allows for easy semantic understanding
                and manipulation of the file.

                Patching these files is done using a JSON-patch like syntax.
                This project closely conforms to the RFC 6902 spec, but deviates
                in some specific ways to handle the Jinja variables and
                comments found in conda recipe files.

                Links:
                - https://jsonpatch.com/
                - https://datatracker.ietf.org/doc/html/rfc6902/
"""

import ast
import difflib
import re

from pathlib import PurePath
from typing import Final

# Base types that can store value
Primitives = str | int | float | bool | None

# Type that represents a JSON-like type
JsonType = (
    dict[str, "JsonType"] | list["JsonType"] | Primitives
)

class _Node():
    """
    Private class representing a node in a recipe parse tree.

    Each level of a path consists of a list of child nodes. Child nodes can
    recursively store more child nodes until a final value is found, indicated
    by having an empty list of children.

    Remember that YAML keys must be strings, but the `value` can another
    primitive type for leaf nodes.

    Comments on a recipe line are stored separately from the value.

    Variable names are not substituted. In other words, the raw strings from
    the file are stored as text.
    """
    def __init__(self, value: Primitives=None, comment="", children=None):
        """
        Constructs a node
        """
        self.value = value
        self.comment = comment
        self.children: list[_Node] = children if children else []

class RecipeParser():
    """
    Class that parses a recipe file string. Provides many useful mechanisms for
    changing values in the document.

    A quick search for Jinja statements in YAML files shows that the vast
    majority of statements are in the form of initializing variables with `set`.

    The next few prevelant kinds of statements are:
      - Conditional macros (i.e. if/endif)
      - for loops
    And even those only show up in a handful out of thousands of recipes. There
    are also no current examples of Jinja style comments.

    So that being said, the initial parser will not support these more edge-case
    recipes as they don't pass the 80/20 rule.
    """
    def __init__(self, content: str):
        # The initial, raw, text is preserved for diffing and debugging purposes
        self._init_content: Final[str] = content
        # Indicates if the original content has changed
        self._is_modified = False

        # TODO parse the text
        # Tracks Jinja variables set by the file
        self._vars: dict[str, JsonType] = {}
        # Find all the set statements and record the values
        set_line_re = re.compile(r"{%\s*set.*=.*%}\s*\n")
        for line in set_line_re.findall(content):
            key = line[line.find("set")+len("set"):line.find("=")].strip()
            value = line[line.find("=")+len("="):line.find("%}")].strip()
            # From the docs: `literal_eval()` does not suffer from a code
            # execution risk but potentially can overflow stack-space/memory,
            # if someone abuses a recipe file. Alternatives could be considered
            # in the future.
            self._vars[key] = ast.literal_eval(value)

        # Root of the parse tree
        self._root = _Node("")

    def __str__(self) -> str:
        """
        Casts the parser into a string.
        :return: String representation of the recipe file
        """
        return self.render()

    def __eq__(self, other: object) -> bool:
        """
        Checks if two recipe representations match entirely
        :param other:   Other recipe parser instance to check against.
        :return: True if both recipes contain the same current state. False
                 otherwise.
        """
        if not isinstance(other, RecipeParser):
            return NotImplemented
        return self.render() == other.render()

    def is_modified(self) -> bool:
        """
        Indicates if the recipe has been changed since construction.
        :return: True if the recipe has changed. False otherwise.
        """
        return self.is_modified

    def render(self) -> str:
        """
        Takes the current state of the parse tree and returns the recipe file
        as a string.
        :return: String representation of the recipe file
        """
        # TODO complete
        return ""

    def contains_value(self, path: str | PurePath) -> bool:
        path = PurePath(path)
        # TODO complete
        return False

    def get_value(self, path: str | PurePath, default=None) -> tuple[Primitives, str]:
        """
        Retrieves a value at a given path. If the value is not found, return a
        specified default value or throw.
        :param path:    JSON patch (RFC 6902)-style path to a value
        :param default: (Optional)
        :return: If found, the value in the recipe at that path. Otherwise, the
                 caller-specified default value.
        """
        path = PurePath(path)
        # TODO complete
        return ""

    def list_vars(self) -> list[str]:
        # TODO complete
        return []

    def contains_var(self) -> bool:
        # TODO complete
        return False

    def get_var(self) -> Primitives:
        # TODO complete
        return ""

    def patch(self, patch) -> bool:
        """
        Given a JSON-patch object, perform a patch operation.
        For full examples,

        Modifications from RFC 6902
          - We're using a Jinja-formatted YAML file, not JSON
          - To modify variables, specify the variable name using `variable` not
            `path`. `path` implies lines in the file.
          - To modify comments, specify the `path` AND `comment`

        Operations not currently supported:
          - add
          - remove
          - replace
          - move
          - copy
          - test

        :param patch: TODO
        :return: True if the operation was successful. False otherwise. For
                 the `test` operation, this indicates the return value of the
                 `test` request. In other words, if `value` matches the target
                 variable, return True. False otherwise.
        """
        unsupported_ops = {
            "add",
            "remove",
            "replace",
            "move",
            "copy",
            "test",
        }
        # TODO validate input
        # TODO throw on unsupported op
        # TODO complete
        return True

    def diff(self) -> str:
        """
        Returns a diff of the current recipe state with original state of the
        recipe.
        :return: User-friendly displayable string that represents modifications
                 made to the recipe.
        """
        if not self.is_modified:
            return "No diff"
        # TODO complete
        return ""