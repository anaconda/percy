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
import yaml

from pathlib import PurePath
from typing import Final

# Base types that can store value
Primitives = str | int | float | bool | None

# Type that represents a JSON-like type
JsonType = (
    dict[str, "JsonType"] | list["JsonType"] | Primitives
)

# Indicates how many spaces are in a level of indentation
TAB_SPACE_COUNT: Final[str] = 2
TAB_AS_SPACES: Final[str] = " " * TAB_SPACE_COUNT

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

    def _num_tab_spaces(s: str) -> int:
        """
        Counts the number of spaces at the start of the string. Used to indicate
        depth of a field in a YAML file (the YAML specification dictates only
        spaces can be used for indenting).
        :param s:   Target string
        :return: Number of preceding spaces in a string
        """
        cntr: int = 0
        for c in s:
            if c == " ":
                cntr += 1
            else:
                break
        return cntr

    def _parse_line(s: str) -> _Node:
        """
        Parses a line of conda-formatted YAML into a Node.
        TODO: handle multi-line strings

        Latest YAML spec can be found here: https://yaml.org/spec/1.2.2/

        :param s:   Pre-stripped (no leading/trailing spaces), non-Jinja line of
                    a recipe file
        :return: A Node representing a line of the conda-formatted YAML.
        """
        # Use PyYaml to safely/easily/correctly parse single lines of YAML.
        # There is an open issue to PyYaml to support comment parsing:
        #   - https://github.com/yaml/pyyaml/issues/90
        output: JsonType = None
        try:
            output = yaml.load(s, yaml.SafeLoader)
        except Exception:
            # TODO this is a bit hacky and an area for improvement
            # If a construction exception is thrown, attempt to re-parse by
            # replacing Jinja macros (substrings in `{{}}`) with friendly string
            # substitution markers, then re-inject the substitutions back in.
            # We classify all Jinja substitutions as string values, so we don't
            # have to worry about the type of the actual substitution.
            jinja_sub_re = re.compile("{{.*}}")
            sub_list = jinja_sub_re.findall(s)
            s = jinja_sub_re.sub("__PERCY_SUBSTITUTION_MARKER__", s)
            output = yaml.load(s, yaml.SafeLoader)
            # TODO re-sub back in, post-YAML parse

        # Attempt to parse-out comments. Fully commented lines are not ignored
        # to preserve context when the text is rendered. Their order in the list
        # of child nodes will preserve their location. Fully commented lines
        # just have a value of "None".
        comment = ""
        # The full line is a comment
        if s.startswith("#"):
            return _Node(comment=s)
        # There is a comment at the end of the line
        comment_start = s.rfind("#")
        if comment_start > 0:
            comment = s[comment_start:]

        # If a dictionary is returned, we have a line containing a key and
        # potentially a value. There should only be 1 key/value pairing in 1
        # line.
        if isinstance(output, dict):
            children: list[_Node] = []
            key = list(output.keys())[0]
            # If the value returned is None, there is no leaf node to set
            if output[key] is not None:
                # As the line is shared by both parent and child, the comment
                # gets tagged to both.
                children.append(_Node(output[key], comment))
            return _Node(key, comment, children)
        # If a list is returned, then this line is a member of another Node
        if isinstance(output, list):
            return _Node(output[0], comment)
        # Other types are just leaf nodes. This is scenario should likely not
        # be triggered given our recipe files don't have single valid lines of
        # YAML, but we cover this case for the sake of correctness.
        return _Node(output, comment)

    """
    Class that parses a recipe file string. Provides many useful mechanisms for
    changing values in the document.

    A quick search for Jinja statements in YAML files shows that the vast
    majority of statements are in the form of initializing variables with `set`.

    The next few prevalent kinds of statements are:
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
        for line in set_line_re.findall(self._init_content):
            key = line[line.find("set")+len("set"):line.find("=")].strip()
            value = line[line.find("=")+len("="):line.find("%}")].strip()
            self._vars[key] = ast.literal_eval(value)

        # Root of the parse tree
        self._root = _Node("")
        # Start by removing all Jinja lines. Then traverse line-by-line
        jinja_line_re = re.compile(r"({%.*%}|{#.*#})\n")
        sanitized_yaml = jinja_line_re.sub("", self._init_content)

        # Read the YAML line-by-line, maintaining a stack to manage the last
        # owning node in the tree.
        node_stack: list[_Node] = [self._root]
        # Relative depth is determined by the increase/decrease of indentation
        # marks (spaces)
        cur_indent = 0
        last_node = node_stack[-1]
        for line in sanitized_yaml.splitlines():
            # Ignore empty lines
            clean_line = line.strip()
            if clean_line == "":
                continue

            new_indent = RecipeParser._num_tab_spaces(line)
            new_node = RecipeParser._parse_line(clean_line)
            # Skip fully commented lines
            if new_node is None:
                continue
            if new_indent > cur_indent:
                node_stack.append(last_node)
            elif new_indent < cur_indent:
                node_stack.pop()
            cur_indent = new_indent
            # Look at the stack to determine the parent Node and then append
            # the current node to the new parent.
            parent = node_stack[-1]
            parent.children.append(new_node)
            # Update the last node for the next line interpretation
            last_node = new_node

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

    def has_unsupported_statements(self) -> bool:
        """
        Runs a series of checks against the original recipe file.
        """
        # TODO complete
        return False

    def _render(node: _Node, depth: int, lines: list[str]) -> None:
        """
        Recursive helper function that traverses the parse tree to generate
        a file.
        :param node:    Current node in the tree
        :param depth:   Current depth of the recursion
        :param lines:   Accumulated list of lines in the recipe file
        """
        spaces = TAB_AS_SPACES * depth
        # Detect same-line printing
        if len(node.children) == 1 and len(node.children[0].children) == 0:
            lines.append(f"{spaces}{node.value}: {node.children[0].value} {node.comment}")
        else:
            lines.append(f"{spaces}{node.value}: {node.comment}")
            for child in node.children:
                # Leaf nodes are rendered as members in a list
                if len(child.children) == 0:
                    lines.append(f"{spaces}  - {child.value} {node.comment}")
                else:
                    RecipeParser._render(child, depth + 1, lines)
                # By tradition, recipes have a blank line after every top-level
                # section.
                if depth < 0:
                    lines.append("")

    def render(self) -> str:
        """
        Takes the current state of the parse tree and returns the recipe file
        as a string.
        :return: String representation of the recipe file
        """
        # TODO complete
        # TODO ensure that there is 1 blank line after every top-level section
        # (1 after all variables, 1 after each top-level object)
        lines = []
        # -1 is passed in as the "root-level" is not directly rendered in a YAML
        # file; it is merely implied.
        RecipeParser._render(self._root, -1, lines)
        return "\n".join(lines)

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