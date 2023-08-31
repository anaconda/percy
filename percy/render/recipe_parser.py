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
# Marker used to temporarily work around some Jinja-template parsing issues
_PERCY_SUB_MARKER: Final[str] = "__PERCY_SUBSTITUTION_MARKER__"

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
    def __init__(
        self,
        value: Primitives=None,
        comment="",
        children=None,
        is_list_member=False,
        is_multiline=False,
    ):
        """
        Constructs a node
        :param value:           Value of the current node
        :param comment:         Comment on the line this node was found on
        :param children:        List of children nodes, descendants of this node
        :param is_list_member:  Indicates if this node is part of a list
        :param is_multiline:    Indicates if the node represents a multiline
                                value.
        """
        self.value = value
        self.comment = comment
        self.children: list[_Node] = children if children else []
        self.is_list_member = is_list_member
        self.is_multiline = is_multiline

    def __eq__(self, other: object) -> bool:
        """
        Determine if two nodes are equal. Useful for `assert` statements in
        tests.
        :param other:   Other object to check against
        :return: True if the two nodes are identical. False otherwise.
        """
        if not isinstance(other, _Node):
            return False
        return (
            self.value == other.value
            and self.comment == other.comment
            and self.is_list_member == other.is_list_member
            and self.is_multiline == other.is_multiline
            # Save recursive (most expensive) check for last
            and self.children == other.children
        )

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

    def _substitute_markers(s: str, subs: list[str]) -> str:
        """
        Given a string, replace subsitution markers with the original Jinja
        template from a list of options.
        :param s:       String to replace substitution markers with
        :param subs:    List of substitutions to make, in order of appearance
        :return: New string, with substitutions removed
        """
        for sub in subs:
            s = s.replace(_PERCY_SUB_MARKER, sub, 1)
        return s

    def _stringify_yaml(val: Primitives) -> Primitives:
        """
        Special function for handling edge cases when converting values back
        to YAML.
        :param val: Value to check
        :return: YAML version of a value, as a string.
        """
        # None -> null
        if val is None:
            return "null"
        # True -> true
        if isinstance(val, bool):
            if val:
                return "true"
            return "false"
        return val

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
            s = jinja_sub_re.sub(_PERCY_SUB_MARKER, s)
            output = yaml.load(s, yaml.SafeLoader)
            # Add the substitutions back in
            if isinstance(output, str):
                output = RecipeParser._substitute_markers(output, sub_list)
            if isinstance(output, dict):
                key = list(output.keys())[0]
                output[key] = RecipeParser._substitute_markers(output[key], sub_list)
            elif isinstance(output, list):
                output[0] = RecipeParser._substitute_markers(output[0], sub_list)
            elif not isinstance(output, str):
                # TODO throw
                pass

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
        # If a list is returned, then this line is a listed member of the parent
        # Node
        if isinstance(output, list):
            return _Node(output[0], comment, is_list_member=True)
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
        # Regex for detecting the start of a multiline node
        multiline_re = re.compile(r"^\s*.*:\s+\|(\s*|\s+#.*)")

        # Iterate with an index variable, so we can handle multiline values
        line_idx = 0
        lines = sanitized_yaml.splitlines()
        num_lines = len(lines)
        while line_idx < num_lines:
            line = lines[line_idx]
            # Increment here, so that the inner multiline processing loop
            # doesn't cause a skip of the line following the multiline value.
            line_idx += 1
            # Ignore empty lines
            clean_line = line.strip()
            if clean_line == "":
                continue

            new_indent = RecipeParser._num_tab_spaces(line)
            new_node = RecipeParser._parse_line(clean_line)
            # If the last node ended (pre-comments) with a |, reset the value
            # to be a list of the following, extra-indented strings
            if multiline_re.match(line):
                # Per YAML spec, multiline statements can't be commented. In
                # other words, the `#` symbol is seen as a string character in
                # multiline values.
                multiline_node = _Node([], is_multiline=True)
                multiline = lines[line_idx]
                multiline_indent = RecipeParser._num_tab_spaces(multiline)
                # Add the line to the list once it is verified to be the next
                # line to capture in this node. This means that `line_idx` will
                # point to the line of the next node, post-processing.
                while (multiline_indent > new_indent):
                    multiline_node.value.append(multiline.strip())
                    line_idx += 1
                    multiline = lines[line_idx]
                    multiline_indent = RecipeParser._num_tab_spaces(multiline)
                # The previous level is the key to this multi-line value, so
                # we can safely reset it.
                new_node.children = [multiline_node]
            if new_indent > cur_indent:
                node_stack.append(last_node)
            elif new_indent < cur_indent:
                # Multiple levels of depth can change from line to line, so
                # multiple stack nodes must be pop'd. Example:
                # foo:
                #   bar:
                #     fizz: buzz
                # baz: blah
                # TODO Figure out tab-depth of the recipe being read. 4 spaces
                #      is technically valid in YAML
                depth_to_pop = (cur_indent - new_indent) // TAB_SPACE_COUNT
                for _ in range(0, depth_to_pop):
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

    def _render_tree(node: _Node, depth: int, lines: list[str]) -> None:
        """
        Recursive helper function that traverses the parse tree to generate
        a file.
        :param node:    Current node in the tree
        :param depth:   Current depth of the recursion
        :param lines:   Accumulated list of lines in the recipe file
        """
        spaces = TAB_AS_SPACES * depth

        # Handle lines that are just comments
        if node.value is None and node.comment:
            lines.append(node.comment)
            return

        # Handle same-line printing
        if len(node.children) == 1 and len(node.children[0].children) == 0:
            # Handle the edge case of a list containing 1 member
            if node.children[0].is_list_member:
                lines.append(f"{spaces}{node.value}:  {node.comment}".rstrip())
                lines.append(
                    f"{spaces}{TAB_AS_SPACES}- {RecipeParser._stringify_yaml(node.children[0].value)}  {node.children[0].comment}".rstrip()
                )
                return
            # Handle multi-line statements. In theory this will probably only
            # ever be strings, but we'll try to account for other types.
            #
            # By the language spec, # symbols do not indicate comments on
            # multiline strings.
            if node.children[0].is_multiline:
                lines.append(f"{spaces}{node.value}: |  {node.comment}".rstrip())
                for val_line in node.children[0].value:
                    lines.append(
                        f"{spaces}{TAB_AS_SPACES}{RecipeParser._stringify_yaml(val_line)}".rstrip()
                    )
                return
            lines.append(
                f"{spaces}{node.value}: {RecipeParser._stringify_yaml(node.children[0].value)}  {node.children[0].comment}".rstrip()
            )
            return

        # Don't render a `:` for the non-visible root node
        if depth > -1:
            lines.append(
                f"{spaces}{node.value}:  {node.comment}".rstrip()
            )
        for child in node.children:
            # Leaf nodes are rendered as members in a list
            if len(child.children) == 0:
                lines.append(
                    f"{spaces}  - {RecipeParser._stringify_yaml(child.value)}  {child.comment}".rstrip()
                )
            else:
                RecipeParser._render_tree(child, depth + 1, lines)
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
        lines = []

        # Render variable set section
        for key, val in self._vars.items():
            # Double quote strings
            if isinstance(val, str):
                val = f"\"{val}\""
            lines.append(f"{{% set {key} = {val} %}}")
        # Add spacing if variables have been set
        if len(self._vars):
            lines.append("")

        # Render parse-tree
        # -1 is passed in as the "root-level" is not directly rendered in a YAML
        # file; it is merely implied.
        RecipeParser._render_tree(self._root, -1, lines)

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