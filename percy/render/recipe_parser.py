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
import json
import re
from pathlib import PurePath
from typing import Any, Final, Mapping, NamedTuple

import yaml
from jsonschema import validate as schema_validate

# Base types that can store value
Primitives = str | int | float | bool | None

# Type that represents a JSON-like type
JsonType = dict[str, "JsonType"] | list["JsonType"] | Primitives

# Type that represents a JSON patch payload
JsonPatchType = dict[str, JsonType]
# Type for a schema object used by the `jsonschema` library
SchemaType = Mapping[str, Any]  # type: ignore[misc]

# Type alias for a list of strings treated as a Pythonic stack
_StrStack = list[str]
# Type alias for a `_StrStack` that must be immutable. Useful for some recursive
# operations.
_StrStackImmutable = tuple[str]

# Type alias for a table that maps operations to functions.
_OpsTable = dict[str, callable]

# Indicates how many spaces are in a level of indentation
TAB_SPACE_COUNT: Final[str] = 2
TAB_AS_SPACES: Final[str] = " " * TAB_SPACE_COUNT
# Marker used to temporarily work around some Jinja-template parsing issues
_PERCY_SUB_MARKER: Final[str] = "__PERCY_SUBSTITUTION_MARKER__"

# Schema validator for JSON patching
JSON_PATCH_SCHEMA: Final[SchemaType] = {
    "type": "object",
    "properties": {
        "op": {"enum": ["add", "remove", "replace", "move", "copy", "test"]},
        "path": {"type": "string"},
        "from": {"type": "string"},
        "value": {
            "type": [
                "string",
                "number",
                "object",
                "array",
                "boolean",
                "null",
            ],
            "items": {
                "type": [
                    "string",
                    "number",
                    "object",
                    "array",
                    "boolean",
                    "null",
                ]
            },
        },
    },
    "required": [
        "op",
        "path",
    ],
    "allOf": [
        # `value` is required for `add`/`remove`/`replace`/`test`
        {
            "if": {
                "properties": {"op": {"const": "add"}},
            },
            "then": {"required": ["value"]},
        },
        {
            "if": {
                "properties": {"op": {"const": "remove"}},
            },
            "then": {"required": ["value"]},
        },
        {
            "if": {
                "properties": {"op": {"const": "replace"}},
            },
            "then": {"required": ["value"]},
        },
        {
            "if": {
                "properties": {"op": {"const": "test"}},
            },
            "then": {"required": ["value"]},
        },
        # `from` is required for `move`/`copy`
        {
            "if": {
                "properties": {"op": {"const": "move"}},
            },
            "then": {"required": ["from"], "type": "string"},
        },
        {
            "if": {
                "properties": {"op": {"const": "copy"}},
            },
            "then": {"required": ["from"], "type": "string"},
        },
    ],
    "additionalProperties": False,
}


class UnsupportedOpException(Exception):
    """
    Indicates that the calling code has attempted to perform an unsupported
    operation.
    """

    def __init__(self, op: str):
        """
        Constructs an Unsupported Operation Exception
        :param op: Operation being encountered.
        """
        message = "An unspecified operation was encountered."
        if op:
            message = f"Unsupported operation encountered: {op}"
        super().__init__(message)


class JsonPatchValidationException(Exception):
    """
    Indicates that the calling code has attempted to use an illegal JSON patch
    payload that does not meet the schema criteria.
    """

    def __init__(self, patch: JsonPatchType):
        """
        Constructs a JSON Patch Validation Exception
        :param op: Operation being encountered.
        """
        super().__init__(
            f"Invalid patch was attempted:\n{json.dumps(patch, indent=2)}"
        )


class _Node:
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
        value: Primitives = None,
        comment: str = "",
        children: list["_Node"] | None = None,
        is_list_member: bool = False,
        is_multiline: bool = False,
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

    def __str__(self) -> str:
        """
        Renders the Node as a string. Useful for debugging purposes.
        :return: The node's value, as a string
        """
        return str(self.value)

    def is_leaf(self) -> bool:
        """
        Indicates if a node is a leaf node
        :return: True if the node is a leaf
        """
        return len(self.children) == 0


class SelectorInfo(NamedTuple):
    """
    Immutable structure that tracks information about how a particular selector
    is used.
    """

    node: _Node
    path: _StrStack


class _Traverse:
    """
    Private class, treated as a namespace, that contains methods for traversing
    `_Node` data structures. These functions can't exist under the `_Node` class
    as the class has not yet been defined.
    """

    @staticmethod
    def _traverse_recurse(node: _Node, path: _StrStack) -> _Node | None:
        """
        Recursive helper function for traversing a tree.
        :param node:    Current node on the tree.
        :param path:    Path, as a stack, that describes a location in the tree.
        :return: `_Node` object if a node is found in the parse tree at that
                 path. Otherwise returns `None`.
        """
        if len(path) == 0:
            return node

        path_part = path[-1]
        # Check if the path is attempting an array index.
        if path_part.isdigit():
            # Check if index is in range
            max_idx = len(node.children) - 1
            path_idx = int(path_part)
            if path_idx < 0 or path_idx > max_idx:
                return None
            path.pop()
            return _Traverse._traverse_recurse(node.children[path_idx], path)

        for child in node.children:
            # Remember: for nodes that represent part of the path, the "value"
            # stored in the node is part of the path-name.
            if child.value == path[-1]:
                path.pop()
                return _Traverse._traverse_recurse(child, path)
        # Path not found
        return None

    @staticmethod
    def traverse(node: _Node | None, path: _StrStack) -> _Node | None:
        """
        Given a path in the recipe tree, traverse the tree and return the node
        at that path.

        If no Node is found at that path, return `None`.
        :param node:    Starting node of the tree/branch to traverse.
        :param path:    Path, as a stack, that describes a location in the tree.
        :return: `_Node` object if a node is found in the parse tree at that
                 path. Otherwise returns `None`.
        """
        # Bootstrap recursive edge cases
        if _Node is None:
            return None
        if len(path) == 0:
            return None
        if len(path) == 1:
            if path[0] == "/":
                return node
            return None
        # Purge `root` from the path
        path.pop()
        return _Traverse._traverse_recurse(node, path)

    @staticmethod
    def traverse_all(
        node: _Node | None,
        func: callable,
        path: _StrStackImmutable | None = None,
        idx_num: int = 0,
    ) -> None:
        """
        Given a node, traverse all child nodes and apply a function to each
        node. Useful for updating or extracting information on the whole tree.
        :param node:    Node to start with
        :param func:    Function to apply against all traversed nodes.
        :param path:    CALLERS: DO NOT SET. This value tracks the current path
                        of a node. This should only be specified in recursive
                        calls to this function. Tuples are used for their
                        immutability, so paths change based on the current
                        stack frame.
        :param idx_num: CALLERS: DO NOT SET. Used in recursive calls to track
                        the index position of a list-member node.
        """
        if node is None:
            return
        # Initialize, if on the root node. Otherwise build-up the path
        if path is None:
            path = ("/",)
        elif node.is_list_member:
            path = (str(idx_num),) + path
        elif not node.is_leaf():
            path = (node.value,) + path
        func(node, list(path))
        # Used for paths that contain lists of items
        idx_num = 0
        for child in node.children:
            _Traverse.traverse_all(child, func, path, idx_num)
            idx_num += 1


class RecipeParser:
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

    # Static set of patch operations that require `value`. The others require
    # `from`.
    _patch_ops_requiring_value = set(["add", "remove", "replace", "test"])

    @staticmethod
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

    @staticmethod
    def _substitute_markers(s: str, subs: list[str]) -> str:
        """
        Given a string, replace substitution markers with the original Jinja
        template from a list of options.
        :param s:       String to replace substitution markers with
        :param subs:    List of substitutions to make, in order of appearance
        :return: New string, with substitutions removed
        """
        for sub in subs:
            s = s.replace(_PERCY_SUB_MARKER, sub, 1)
        return s

    @staticmethod
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

    @staticmethod
    def _parse_yaml(s: str) -> JsonType:
        """
        Parse a line of YAML into a Pythonic data structure
        :param s:   String to parse
        :return: Pythonic data corresponding to the line of YAML
        """
        output: JsonType = None
        try:
            output = yaml.load(s, yaml.SafeLoader)
        except Exception:  # pylint: disable=W0718
            # TODO this is a bit hacky and an area for improvement
            # If a construction exception is thrown, attempt to re-parse by
            # replacing Jinja macros (substrings in `{{}}`) with friendly string
            # substitution markers, then re-inject the substitutions back in.
            # We classify all Jinja substitutions as string values, so we don't
            # have to worry about the type of the actual substitution.
            jinja_sub_re = re.compile(r"{{.*}}")
            sub_list = jinja_sub_re.findall(s)
            s = jinja_sub_re.sub(_PERCY_SUB_MARKER, s)
            output = yaml.load(s, yaml.SafeLoader)
            # Add the substitutions back in
            if isinstance(output, str):
                output = RecipeParser._substitute_markers(output, sub_list)
            if isinstance(output, dict):
                key = list(output.keys())[0]
                output[key] = RecipeParser._substitute_markers(
                    output[key], sub_list
                )
            elif isinstance(output, list):
                output[0] = RecipeParser._substitute_markers(
                    output[0], sub_list
                )
            else:
                # TODO throw
                pass
        return output

    @staticmethod
    def _parse_line_node(s: str) -> _Node:
        """
        Parses a line of conda-formatted YAML into a Node.
        TODO: handle multi-line strings

        Latest YAML spec can be found here: https://yaml.org/spec/1.2.2/

        :param s:   Pre-stripped (no leading/trailing spaces), non-Jinja line of
                    a recipe file
        :return: A Node representing a line of the conda-formatted YAML.
        """
        # Use PyYaml to safely/easily/correctly parse single lines of YAML.
        output = RecipeParser._parse_yaml(s)

        # Attempt to parse-out comments. Fully commented lines are not ignored
        # to preserve context when the text is rendered. Their order in the list
        # of child nodes will preserve their location. Fully commented lines
        # just have a value of "None".
        #
        # There is an open issue to PyYaml to support comment parsing:
        #   - https://github.com/yaml/pyyaml/issues/90
        # TODO Ruamel can handle comments
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

    @staticmethod
    def _str_to_stack_path(path: str) -> _StrStack:
        """
        Takes a JSON-patch path as a string and return a path as a stack of
        strings.

        String paths are used by callers, stacks are used internally.

        For example:
            "/foo/bar/baz" -> ["baz", "bar", "foo", "/"]
        :param path: Path to deconstruct into a stack
        :return: Path, described as a stack of strings.
        """
        # TODO: validate the path starts with `/` (root)

        # Use `PurePath` as a way to parse the path into component parts that
        # are easy to recursively manipulate, in a stack. NOTE: Remember that
        # Python's implementation of a stack is to use a list from the end of
        # the list. In other words, the `root` is at the end of the list.
        return path.split("/")[::-1]

    @staticmethod
    def _stack_path_to_str(path_stack: _StrStack | _StrStackImmutable) -> str:
        """
        Takes a stack that represents a path and converts it into a string.

        String paths are used by callers, stacks are used internally.

        :param path_stack:  Stack to construct back into a string.
        :return: Path, described as a string.
        """
        # Normalize type if a tuple is given.
        if isinstance(path_stack, tuple):
            path_stack = list(path_stack)
        path = ""
        while len(path_stack) > 0:
            value = path_stack.pop()
            # Special case to bootstrap root; the first element will
            # automatically add the first slash.
            if value == "/":
                continue
            path += f"/{value}"
        return path

    @staticmethod
    def _generate_subtree(value: JsonType) -> list[_Node]:
        """
        Given a value supported by JSON, use the RecipeParser to generate a list
        of child nodes. This effectively creates a new subtree that can be
        used to patch other parse trees.
        """
        # Multiline values can replace the list of children with a single
        # multiline leaf node.
        if isinstance(value, str) and "\n" in value:
            return [
                _Node(
                    value=value.splitlines(),
                    is_multiline=True,
                )
            ]

        # For complex types, generate the YAML equivalent and build
        # a new tree.
        if isinstance(value, (dict, list)):
            return RecipeParser(  # pylint: disable=W0212
                yaml.dump(value)
            )._root.children

        # Primitives can be safely stringified to generate a parse tree.
        return RecipeParser(  # pylint: disable=W0212
            str(RecipeParser._stringify_yaml(value))
        )._root.children

    def _rebuild_selectors(self) -> None:
        """
        Re-builds the selector look-up table. This table allows quick access to
        tree nodes that have a selector specified.

        This needs to be called when the three is modified.
        """
        self._selector_tbl: dict[str, list[SelectorInfo]] = {}
        selector_re = re.compile(r"\[.*\]")

        def _collect_selectors(node: _Node, path: _StrStackImmutable):
            # Ignore empty comments
            if node.comment is None or not node.comment:
                return
            match = selector_re.search(node.comment)
            if match:
                selector = match.group(0)
                selector_info = SelectorInfo(node, path)
                if selector not in self._selector_tbl:
                    self._selector_tbl[selector] = [selector_info]
                else:
                    self._selector_tbl[selector].append(selector_info)

        _Traverse.traverse_all(self._root, _collect_selectors)

    def __init__(self, content: str):
        """
        Constructs a RecipeParser instance.
        :param content: conda-build formatted recipe file, as a single text
                        string.
        """
        # The initial, raw, text is preserved for diffing and debugging purposes
        self._init_content: Final[str] = content
        # Indicates if the original content has changed
        self._is_modified = False

        # Tracks Jinja variables set by the file
        self._vars_tbl: dict[str, JsonType] = {}
        # Find all the set statements and record the values
        set_line_re = re.compile(r"{%\s*set.*=.*%}\s*\n")
        for line in set_line_re.findall(self._init_content):
            key = line[line.find("set") + len("set") : line.find("=")].strip()
            value = line[line.find("=") + len("=") : line.find("%}")].strip()
            self._vars_tbl[key] = ast.literal_eval(value)

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
            new_node = RecipeParser._parse_line_node(clean_line)
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
                while multiline_indent > new_indent:
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

        # Now that the tree is built, construct a selector look-up table that
        # tracks all the nodes that use a particular selector. This will make
        # it easier to.
        #
        # This table will have to be re-built or modified when the tree is
        # modified with `patch()`.
        self._rebuild_selectors()

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
        return self._is_modified

    def has_unsupported_statements(self) -> bool:
        """
        Runs a series of checks against the original recipe file.
        """
        # TODO complete
        raise NotImplemented

    @staticmethod
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
                    f"{spaces}{TAB_AS_SPACES}- "
                    f"{RecipeParser._stringify_yaml(node.children[0].value)}  "
                    f"{node.children[0].comment}".rstrip()
                )
                return
            # Handle multi-line statements. In theory this will probably only
            # ever be strings, but we'll try to account for other types.
            #
            # By the language spec, # symbols do not indicate comments on
            # multiline strings.
            if node.children[0].is_multiline:
                lines.append(
                    f"{spaces}{node.value}: |  {node.comment}".rstrip()
                )
                for val_line in node.children[0].value:
                    lines.append(
                        f"{spaces}{TAB_AS_SPACES}"
                        f"{RecipeParser._stringify_yaml(val_line)}".rstrip()
                    )
                return
            lines.append(
                f"{spaces}{node.value}: "
                f"{RecipeParser._stringify_yaml(node.children[0].value)}  "
                f"{node.children[0].comment}".rstrip()
            )
            return

        depth_delta = 1
        # Don't render a `:` for the non-visible root node
        if depth > -1:
            list_prefix = ""
            # Being in a list changes how the depth is rendered
            if node.is_list_member:
                depth_delta += 1
                list_prefix = "- "
            lines.append(
                f"{spaces}{list_prefix}{node.value}:  {node.comment}".rstrip()
            )
        for child in node.children:
            # Leaf nodes are rendered as members in a list
            if child.is_leaf():
                lines.append(
                    f"{spaces}  - "
                    f"{RecipeParser._stringify_yaml(child.value)}  "
                    f"{child.comment}".rstrip()
                )
            else:
                RecipeParser._render_tree(child, depth + depth_delta, lines)
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
        for key, val in self._vars_tbl.items():
            # Double quote strings
            if isinstance(val, str):
                val = f'"{val}"'
            lines.append(f"{{% set {key} = {val} %}}")
        # Add spacing if variables have been set
        if len(self._vars_tbl):
            lines.append("")

        # Render parse-tree
        # -1 is passed in as the "root-level" is not directly rendered in a YAML
        # file; it is merely implied.
        RecipeParser._render_tree(self._root, -1, lines)

        return "\n".join(lines)

    ## YAML Access Functions ##

    def contains_value(self, path: str) -> bool:
        """
        Determines if a value (via a path) is contained in this recipe
        :param path:    JSON patch (RFC 6902)-style path to a value.
        :return: True if the path exists. False otherwise.
        """
        path_stack = RecipeParser._str_to_stack_path(path)
        return _Traverse.traverse(self._root, path_stack) is not None

    def get_value(self, path: str, default: JsonType = None) -> JsonType:
        """
        Retrieves a value at a given path. If the value is not found, return a
        specified default value or throw.
        :param path:    JSON patch (RFC 6902)-style path to a value. NOTE: There
                        is no "get" op in JSON patch. To get the value (not
                        the key-value pair) at a path, add a `/` at the end
                        of the path. For paths that are lists/objects, this is
                        ignored.

                        For example:
                            /build/number  -> { "number": 0 }
                            /build/number/ -> 0
        :param default: (Optional) If the value is not found, return this value
                        instead.
        :raises KeyError: If the value is not found AND no default is specified
        :return: If found, the value in the recipe at that path. Otherwise, the
                 caller-specified default value.
        """
        # Ignore the root case
        path_ends_in_slash = len(path) > 1 and path[-1] == "/"
        path_stack = RecipeParser._str_to_stack_path(path)
        node = _Traverse.traverse(self._root, path_stack)

        # Handle if the path was not found
        if node is None:
            if default is None:
                raise KeyError(f"No value/key found at path {path!r}")
            return default

        # Handle unpacking of the last key-value set of nodes, if `/` is
        # specified and the target node is a single key-value-pair. Ignore the
        # trailing `/` if the value is a compound type. There is an exception
        # for this rule for multiline strings, which need to be re-combined.
        if path_ends_in_slash:
            if len(node.children) == 1:
                if node.children[0].is_multiline:
                    return "\n".join(node.children[0].value)
                return node.children[0].value

        # Leaf nodes can return their value directly
        if node.is_leaf():
            return node.value

        # NOTE: Traversing the tree and generating our own data structures will
        # be more efficient than rendering and leveraging the YAML parser, BUT
        # this method re-uses code and is easier to maintain.
        lst = []
        RecipeParser._render_tree(node, -1, lst)
        return RecipeParser._parse_yaml("\n".join(lst))

    ## Jinja Variable Functions ##

    def list_vars(self) -> list[str]:
        """
        Returns variables found in the recipe, sorted by first appearance.
        :return: List of variables found in the recipe.
        """
        return list(dict.fromkeys(self._vars_tbl))

    def contains_var(self, var: str) -> bool:
        """
        Determines if a variable is set in this recipe.
        :param var: Variable to check for.
        :return: True if a variable name is found in this recipe. False
                 otherwise.
        """
        return var in self._vars_tbl

    def get_var(self, var: str, default: Primitives = None) -> Primitives:
        """
        Returns the value of a variable set in the recipe. If specified, a
        default value will be returned if the variable name is not found.
        :param var: Variable of interest check for.
        :param default: (Optional) If the value is not found, return this value
                        instead.
        :raises KeyError: If the value is not found AND no default is specified
        :return: The value (or specified default value if not found) of the
                 variable name provided.
        """
        if var not in self._vars_tbl:
            if default is None:
                raise KeyError
            return default
        return self._vars_tbl[var]

    def set_var(self, var: str, value: Primitives) -> None:
        """
        Adds or changes an existing Jinja variable.
        :param var:     Variable to modify
        :param value:   Value to set
        """
        self._vars_tbl[var] = value
        self._is_modified = True

    def del_var(self, var: str) -> None:
        """
        Remove a variable from the project. If one is not found, no changes
        are made.
        :param var: Variable to delete
        """
        if not var in self._vars_tbl:
            return
        del self._vars_tbl[var]
        self._is_modified = True

    def get_var_paths(self, var: str) -> list[str]:
        """
        Returns a list of paths that use particular variables.
        :param var: Variable of interest
        :return: List of paths that use a variable, sorted by first appearance.
        """
        if var not in self._vars_tbl:
            return []

        path_list: list[str] = []
        # The text between the braces is very forgiving. Just searching for
        # whitespace characters means we will never match the very common
        # `{{ name | lower }}` expression, or similar piping functions.
        var_re = re.compile(r"{{.*" + var + r".*}}")

        def _collect_var_usage(node: _Node, path: _StrStackImmutable):
            # Variables can only be found inside string values.
            if isinstance(node.value, str) and var_re.search(node.value):
                path_list.append(RecipeParser._stack_path_to_str(path))

        _Traverse.traverse_all(self._root, _collect_var_usage)
        # The list should be de-duped and maintain order.
        return list(dict.fromkeys(path_list))

    ## Selector Functions ##

    def list_selectors(self) -> list[str]:
        """
        Returns selectors found in the recipe, sorted by first appearance.
        :return: List of selectors found in the recipe.
        """
        return list(dict.fromkeys(self._selector_tbl))

    def contains_selector(self, selector: str) -> bool:
        """
        Determines if a selector expression is present in this recipe.
        :param selector:    Selector to check for.
        :return: True if a selector is found in this recipe. False otherwise.
        """
        return selector in self._selector_tbl

    def get_selector_paths(self, selector: str) -> list[str]:
        """
        Given a selector (including the surrounding brackets), provide a list
        of paths in the parse tree that use that selector.

        Selector paths will be ordered by the line they appear on in the file.

        :param selector:    Selector of interest.
        :return: A list of all known paths that use a particular selector
        """
        # We return a tuple so that caller doesn't accidentally modify a
        # private member variable.
        if not self.contains_selector(selector):
            return []
        path_list: list[str] = []
        for path_stack in self._selector_tbl[selector]:
            path_list.append(RecipeParser._stack_path_to_str(path_stack.path))
        # The list should be de-duped and maintain order. Duplications occur
        # when key-value pairings mean a selector occurs on two nodes with
        # the same path.
        #
        # For example:
        #   skip: True  # [unix]
        # The nodes for both `skip` and `True` contain the comment `[unix]`
        return list(dict.fromkeys(path_list))

    ## YAML Patching Functions ##

    # TODO complete: set/add and remove selectors

    def _patch_replace(
        self, _: str, path_stack: _StrStack, value: JsonType
    ) -> bool:
        """
        Performs a JSON patch `replace` operation.
        :param path_stack:  Path that describes a location in the tree, as a
                            list, treated like a stack.
        :param value:   Value to update with.
        :raises UnsupportedOpException: If the operation preformed is not
                                        supported. TODO Exception will no longer
                                        be raised when support is added.
        """
        node: _Node
        node_idx: int = -1
        # Pre-determine if the path is targeting a list position. Patching
        # only applies on the last index provided.
        if path_stack[0].isdigit():
            # Find the index and parent of the target
            node_idx = int(path_stack.pop(0))
            node = _Traverse.traverse(self._root, path_stack)
        else:
            node = _Traverse.traverse(self._root, path_stack)
        # Path not found
        if node is None:
            return False

        # Leaf nodes contain values and not path information. Paths should
        # not be made that access leaf nodes, with the exception of members
        # of a list. Making such a path violates the RFC.
        if not node.is_list_member and node.is_leaf():
            return False

        new_children: Final[list[_Node]] = RecipeParser._generate_subtree(value)
        # Lists inject all children at the target position.
        if node_idx >= 0:
            # Ensure all children are marked as list members
            for child in new_children:
                child.is_list_member = True
            node.children[node_idx:node_idx] = new_children
            # Evict the old child, which is now behind the new children
            node.children.pop(node_idx + len(new_children))
            return True

        # Leaves that represent values/paths of values can evict all
        # children, and be replaced with new children, derived from a new
        # tree of values.
        node.children = new_children
        return True

    def _patch_test(self, path: str, _: _StrStack, value: JsonType) -> bool:
        """
        Performs a JSON patch `test` operation.
        :param path:        Path as a string. Useful for invoking public
                            class members.
        :param value:   Value to evaluate against.
        """
        try:
            # Remember that `get_value()` returns the object at the path IF
            # the ending `/` is not specified.
            return self.get_value(path + "/") == value
        except KeyError:
            # Path not found
            return False

    def _get_supported_patch_ops(self) -> _OpsTable:
        """
        Generates a look-up table of currently supported JSON patch operation
        functions, on this instance. This makes it easier to determine which
        operations are currently available AND simplifies "switch"-like logic.
        """
        return {
            "replace": self._patch_replace,
            "test": self._patch_test,
        }

    def patch(self, patch: JsonPatchType) -> bool:
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

        :param patch:                           JSON-patch payload to operate
                                                with.
        :raises JsonPatchValidationException:   If the JSON-patch payload does
                                                not conform to our schema/spec.
        :raises UnsupportedOpException:         If the operation preformed is
                                                not supported
        :return: If the calling code attempts to perform the `test` operation,
                 this indicates the return value of the `test` request. In other
                 words, if `value` matches the target variable, return True.
                 False otherwise.
        """
        # Validate the patch schema
        try:
            schema_validate(patch, JSON_PATCH_SCHEMA)
        except Exception as e:
            raise JsonPatchValidationException(patch) from e

        path: Final[str] = patch["path"]
        # Path must have length
        if not path:
            raise JsonPatchValidationException(patch)
        path_stack: Final[_StrStack] = RecipeParser._str_to_stack_path(path)

        # Check if the operation is currently supported (support for all ops
        # will be added over time. If all ops are supported, the schema will
        # check this by the `enum` value)
        op: Final[str] = patch["op"]
        supported_patch_ops: Final[_OpsTable] = self._get_supported_patch_ops()
        if op not in supported_patch_ops:
            raise UnsupportedOpException(op)

        # The supplemental field name is determined by the operation type.
        value_from: Final[str] = (
            "value" if op in RecipeParser._patch_ops_requiring_value else "from"
        )
        # Both versions of the path are sent over so that the op can easily use
        # both private and public functions (without incurring even more
        # conversions between path types).
        is_successful = supported_patch_ops[op](
            path, path_stack, patch[value_from]
        )

        # Update the selector table and modified flag, if the operation
        # succeeded.
        if is_successful and op != "test":
            # TODO this is not the most efficient way to update the selector
            # table, but for now, it works.
            self._rebuild_selectors()
            # TODO technically this doesn't handle a no-op.
            self._is_modified = True

        return is_successful

    # TODO re-enable stubs when built. Commented out to shut the linter up
    # about unused variables (W0613)

    # def search(self, regex: str) -> list[str]:
    #     # TODO complete
    #     return []

    # def search_and_patch(self, regex: str, patch: JsonPatchType) -> bool:
    #     # TODO complete
    #     # TODO only support: add, remove, replace
    #     return False

    # def diff(self) -> str:
    #     """
    #     Returns a diff of the current recipe state with original state of the
    #     recipe.
    #     :return: User-friendly displayable string that represents
    #              notifications made to the recipe.
    #     """
    #     if not self.is_modified():
    #         return "No diff"
    #     # TODO complete
    #     return ""
