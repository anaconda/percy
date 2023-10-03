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
# Allows older versions of python to use newer forms of type annotation. There
# are major features introduced in 3.9 and 3.10.
from __future__ import annotations

import ast
import difflib
import json
import re
from typing import Any, Callable, Final, Mapping, NamedTuple, Optional, Union

import yaml
from jsonschema import validate as schema_validate

# Base types that can store value
Primitives = Union[str, int, float, bool, None]
# Same primitives, as a tuple. Used with `isinstance()`
PrimitivesTuple = (str, int, float, bool, None)

# Type that represents a JSON-like type
JsonType = Union[dict[str, "JsonType"], list["JsonType"], Primitives]

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
_OpsTable = dict[str, Callable[[str, _StrStack, Optional[JsonType]], bool]]

# Indicates how many spaces are in a level of indentation
TAB_SPACE_COUNT: Final[str] = 2
TAB_AS_SPACES: Final[str] = " " * TAB_SPACE_COUNT
# String that represents a root node in our path.
_ROOT_NODE_VALUE: Final[str] = "/"
# Marker used to temporarily work around some Jinja-template parsing issues
_PERCY_SUB_MARKER: Final[str] = "__PERCY_SUBSTITUTION_MARKER__"

# Schema validator for JSON patching
JSON_PATCH_SCHEMA: Final[SchemaType] = {
    "type": "object",
    "properties": {
        "op": {"enum": ["add", "remove", "replace", "move", "copy", "test"]},
        "path": {"type": "string", "minLength": 1},
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
        # `value` is required for `add`/`replace`/`test`
        {
            "if": {
                "properties": {"op": {"const": "add"}},
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
            "then": {"required": ["from"]},
        },
        {
            "if": {
                "properties": {"op": {"const": "copy"}},
            },
            "then": {"required": ["from"]},
        },
    ],
    "additionalProperties": False,
}


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
        super().__init__(f"Invalid patch was attempted:\n{json.dumps(patch, indent=2)}")


class ForceIndentDumper(yaml.Dumper):
    """
    Custom YAML dumper used to include optional indentation for human readability.
    Adapted from: https://stackoverflow.com/questions/25108581/python-yaml-dump-bad-indentation
    """

    def increase_indent(self, flow=False, indentless=False):  # pylint: disable=unused-argument
        return super().increase_indent(flow, False)


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

    # Sentinel used to discern a `null` in the YAML file and a defaulted, unset
    # value. For example, comment-only lines should always be set to the
    # `_sentinel` object.
    _sentinel = object()

    def __init__(
        self,
        value: Primitives = _sentinel,
        comment: str = "",
        children: Optional[list["_Node"]] = None,
        list_member_flag: bool = False,
        multiline_flag: bool = False,
        key_flag: bool = False,
    ):
        """
        Constructs a node
        :param value:               Value of the current node
        :param comment:             Comment on the line this node was found on
        :param children:            List of children nodes, descendants of this
                                    node
        :param list_member_flag:    Indicates if this node is part of a list
        :param multiline_flag:      Indicates if the node represents a multiline
                                    value.
        :param key_flag:            Indicates if the node represents a key that
                                    points to zero or more subsequent values.
        """
        self.value = value
        self.comment = comment
        self.children: list[_Node] = children if children else []
        self.list_member_flag = list_member_flag
        self.multiline_flag = multiline_flag
        self.key_flag = key_flag

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
            and self.list_member_flag == other.list_member_flag
            and self.multiline_flag == other.multiline_flag
            # Save recursive (most expensive) check for last
            and self.children == other.children
        )

    def __str__(self) -> str:
        """
        Renders the Node as a string. Useful for debugging purposes.
        :return: The node's value, as a string
        """
        value = self.value
        if self.is_comment():
            value = "Comment node"
        if self.is_collection_element():
            value = "Collection node"
        return (
            f"Node: {value}\n"
            f"  - Comment:      {self.comment!r}\n"
            f"  - Child count:  {len(self.children)}\n"
            f"  - List?:        {self.list_member_flag}\n"
            f"  - Multiline?:   {self.multiline_flag}\n"
            f"  - Key?:         {self.key_flag}\n"
        )

    def is_leaf(self) -> bool:
        """
        Indicates if a node is a leaf node
        :return: True if the node is a leaf. False otherwise.
        """
        return len(self.children) == 0

    def is_root(self) -> bool:
        """
        Indicates if a node is a root node
        :return: True if the node is a root node. False otherwise.
        """
        return self.value == _ROOT_NODE_VALUE

    def is_comment(self) -> bool:
        """
        Indicates if a line contains only a comment. When rendered, this will
        be a comment only-line.
        :return: True if the node represents only a comment. False otherwise.
        """
        return self.value == _Node._sentinel and self.comment and not self.children

    def is_empty_key(self) -> bool:
        """
        Indicates a line that is just a "label" and contains no child nodes.
        These are effectively leaf nodes that need to be rendered specially.

        Example empty key:
          foo:
        Versus a non-empty key:
          foo:
            - bar

        When converted into a Pythonic data structure, the key will point to
        an `None` value.

        :return: True if the node represents an empty key. False otherwise.
        """
        return self.key_flag and self.is_leaf()

    def is_single_key(self) -> bool:
        """
        Indicates if a node contains a single child node and is a key.

        This special case is used in several edge cases. Namely, it allows the
        rendering algorithm to print such key-value pairs on the same line.

        :return: True if the node represents a single key. False otherwise.
        """
        return self.key_flag and len(self.children) == 1 and self.children[0].is_leaf()

    def is_collection_element(self) -> bool:
        """
        Indicates if the node is a list member that contains other collection
        types. In other words, this node has no value itself BUT it contains
        children that do.
        :return: True if the noe represents an element that is a collection.
                 False otherwise.
        """
        return self.value == _Node._sentinel and self.list_member_flag and len(self.children)


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
    def remap_child_indices(children: list[_Node]) -> list[int]:
        """
        Given a list of child nodes, generate a look-up table to map the
        "virtual" index positions with the "physical" locations.

        A recipe file may have comment lines, represented as child nodes. For
        rendering, these nodes must be preserved, in-order.

        For manipulating and accessing list members, however, comments are to
        be ignored. The calling program should not rely on our implementation
        details and should be able to access a member of a list as expected.
        In other words, users will not consider comments in a list as indexable
        list members.

        :param children:    Child node list to process.
        :return: A list of indices. Indexing this list with the "virtual"
                 (user-provided) index will return the "physical" list position.
        """
        mapping: list[int] = []
        cntr = 0
        for child in children:
            if child.is_comment():
                cntr += 1
                continue
            mapping.append(cntr)
            cntr += 1

        return mapping

    @staticmethod
    def _traverse_recurse(node: _Node, path: _StrStack) -> Optional[_Node]:
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
            # Map virtual to physical indices and perform some out-of-bounds
            # checks.
            idx_map = _Traverse.remap_child_indices(node.children)
            virtual_idx = int(path_part)
            max_idx = len(idx_map) - 1
            if virtual_idx < 0 or virtual_idx > max_idx:
                return None

            path_idx = idx_map[virtual_idx]
            # Edge case: someone attempts to use the index syntax on a non-list
            # member. As children are stored as a list per node, this could "work"
            # with unintended consequences. In other words, users could accidentally
            # abuse underlying implementation details.
            if not node.children[path_idx].list_member_flag:
                return None

            path.pop()
            return _Traverse._traverse_recurse(node.children[path_idx], path)

        for child in node.children:
            # Remember: for nodes that represent part of the path, the "value"
            # stored in the node is part of the path-name.
            if child.value == path_part:
                path.pop()
                return _Traverse._traverse_recurse(child, path)
        # Path not found
        return None

    @staticmethod
    def traverse(node: Optional[_Node], path: _StrStack) -> Optional[_Node]:
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
        if node is None:
            return None
        if len(path) == 0:
            return None
        if len(path) == 1:
            if path[0] == _ROOT_NODE_VALUE:
                return node
            return None
        # Purge `root` from the path
        path.pop()
        return _Traverse._traverse_recurse(node, path)

    @staticmethod
    def traverse_with_index(root: _Node, path: _StrStack) -> tuple[Optional[_Node], int]:
        """
        Given a path, return the node of interest OR the parent node with
        indexing information, if the node is in a list.
        :param root:    Starting node of the tree/branch to traverse.
        :param path:    Path, as a stack, that describes a location in the tree.
        :return: A tuple containing two items:
                   - `_Node` object if a node is found in the parse tree at that
                     path. Otherwise returns `None`. If the path terminates in
                     an index, the parent is returned with the index location.
                   - If the node is a member of a list, the index returned will
                     be >= 0.
        """
        if len(path) == 0:
            return None

        node: _Node
        node_idx: int = -1
        # Pre-determine if the path is targeting a list position. Patching
        # only applies on the last index provided.
        if path[0].isdigit():
            # Find the index position of the target on the parent's list
            node_idx = int(path.pop(0))

        node = _Traverse.traverse(root, path)

        return node, node_idx

    @staticmethod
    def traverse_all(
        node: Optional[_Node],
        func: Callable[[_Node, list[str]], None],
        path: Optional[_StrStackImmutable] = None,
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
            path = (_ROOT_NODE_VALUE,)
        elif node.list_member_flag:
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
    # Sentinel object used for detecting defaulting behavior.
    # See here for a good explanation: https://peps.python.org/pep-0661/
    _sentinel = object()

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
        while s.find(_PERCY_SUB_MARKER) >= 0 and len(subs):
            s = s.replace(_PERCY_SUB_MARKER, subs[0], 1)
            subs.pop(0)
        return s

    @staticmethod
    def _stringify_yaml(val: Primitives, multiline_flag: bool = False) -> Primitives:
        """
        Special function for handling edge cases when converting values back
        to YAML.
        :param val: Value to check
        :param multiline_flag:  (Optional) If the value being processed is a
                                multiline string, set this flag to True to
                                prevent unintended quote-escaping.
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
        # Ensure string quote escaping if quote marks are present. Otherwise
        # this has the unintended consequence of quoting all YAML strings.
        # Although not wrong, it does not follow our common practices.
        # Quote escaping is not required for multiline strings.
        if not multiline_flag and isinstance(val, str):
            if "'" in val or '"' in val:
                # The PyYaml equivalent function injects newlines, hence why
                # we abuse the JSON library to write our YAML.
                return json.dumps(val)
        return val

    @staticmethod
    def _parse_yaml(s: str) -> JsonType:
        """
        Parse a line (or multiple) of YAML into a Pythonic data structure
        :param s:   String to parse
        :return: Pythonic data corresponding to the line of YAML
        """
        output: JsonType = None
        try:
            output = yaml.load(s, yaml.SafeLoader)
        except Exception:  # pylint: disable=broad-exception-caught
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
                for key in output.keys():
                    output[key] = RecipeParser._substitute_markers(output[key], sub_list)
            elif isinstance(output, list):
                for i in range(len(output)):
                    output[i] = RecipeParser._substitute_markers(output[i], sub_list)
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
        # line. Nodes representing keys should be flagged for handling edge
        # cases.
        if isinstance(output, dict):
            children: list[_Node] = []
            key = list(output.keys())[0]
            # If the value returned is None, there is no leaf node to set
            if output[key] is not None:
                # As the line is shared by both parent and child, the comment
                # gets tagged to both.
                children.append(_Node(output[key], comment))
            return _Node(key, comment, children, key_flag=True)
        # If a list is returned, then this line is a listed member of the parent
        # Node
        if isinstance(output, list):
            # The full line is a comment
            if s.startswith("#"):
                # Comments are list members to ensure indentation
                return _Node(comment=comment, list_member_flag=True)
            # Special scenarios that can occur on 1 line:
            #   1. Lists can contain lists: - - foo -> [["foo"]]
            #   2. Lists can contain keys:  - foo: bar -> [{"foo": "bar"}]
            # And, of course, there can be n values in each of these collections
            # on 1 line as well. Scenario 2 occurs in multi-output recipe files
            # so we need to support the scenario here.
            #
            # `PKG-3006` tracks an investigation effort into what we need to
            # support for our purposes.
            if isinstance(output[0], dict):
                # Build up the key-and-potentially-value pair nodes first
                key_children: list[_Node] = []
                key = list(output[0].keys())[0]
                if output[0][key] is not None:
                    key_children.append(_Node(output[0][key], comment))
                key_node = _Node(key, comment, key_children, key_flag=True)

                elem_node = _Node(comment=comment, list_member_flag=True)
                elem_node.children.append(key_node)
                return elem_node
            return _Node(output[0], comment, list_member_flag=True)
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

        # `PurePath` could be used here, but isn't for performance gains.
        # TODO reduce 3 (O)n operations to 1 O(n) operation

        # Wipe the trailing `/`, if provided. It doesn't have meaning here;
        # only the `root` path is tracked.
        if path[-1] == _ROOT_NODE_VALUE:
            path = path[:-1]
        parts = path.split("/")
        # Replace empty strings with `/` for compatibility in other functions.
        for i in range(0, len(parts)):
            if parts[i] == "":
                parts[i] = "/"
        return parts[::-1]

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
            if value == _ROOT_NODE_VALUE:
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
                    multiline_flag=True,
                )
            ]

        # For complex types, generate the YAML equivalent and build
        # a new tree.
        if isinstance(value, (dict, list)):
            # Although not technically required by YAML, we add the optional
            # spacing for human readability.
            return RecipeParser(  # pylint: disable=protected-access
                yaml.dump(value, Dumper=ForceIndentDumper)
            )._root.children

        # Primitives can be safely stringified to generate a parse tree.
        return RecipeParser(str(RecipeParser._stringify_yaml(value)))._root.children  # pylint: disable=protected-access

    def _rebuild_selectors(self) -> None:
        """
        Re-builds the selector look-up table. This table allows quick access to
        tree nodes that have a selector specified.

        This needs to be called when the tree or selectors are modified.
        """
        self._selector_tbl: dict[str, list[SelectorInfo]] = {}
        selector_re = re.compile(r"\[.*\]")

        def _collect_selectors(node: _Node, path: _StrStackImmutable):
            # Ignore empty comments
            if not node.comment:
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
            try:
                self._vars_tbl[key] = ast.literal_eval(value)
            except Exception:  # pylint: disable=broad-exception-caught
                self._vars_tbl[key] = value

        # Root of the parse tree
        self._root = _Node(_ROOT_NODE_VALUE)
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
                multiline_node = _Node([], multiline_flag=True)
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
                for _ in range(depth_to_pop):
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

    @staticmethod
    def _str_tree_recurse(node: _Node, depth: int, lines: list[str]) -> str:
        """
        Helper function that renders a parse tree as a text-based dependency
        tree. Useful for debugging.
        :param node:    Node of interest
        :param depth:   Current depth of the node
        :param lines:   Accumulated list of lines to text to render
        """
        spaces = TAB_AS_SPACES * depth
        branch = "" if depth == 0 else "|- "
        value = node.value
        if node.is_comment():
            value = f"<Comment: {node.comment}>"
        if node.is_collection_element():
            value = "<Collection Node>"
        lines.append(f"{spaces}{branch}{value}")
        for child in node.children:
            RecipeParser._str_tree_recurse(child, depth + 1, lines)

    def __str__(self) -> str:
        """
        Casts the parser into a string. Useful for debugging.
        :return: String representation of the recipe file
        """
        s = "--------------------\n"
        tree_lines: list[str] = []
        RecipeParser._str_tree_recurse(self._root, 0, tree_lines)
        s += "RecipeParser Instance\n"
        s += "- Variables Table:\n"
        s += json.dumps(self._vars_tbl, indent=TAB_AS_SPACES) + "\n"
        s += "- Selectors Table:\n"
        for key, val in self._selector_tbl.items():
            s += f"{TAB_AS_SPACES}{key}: {val}\n"
        s += f"- is_modified?: {self._is_modified}\n"
        s += "- Tree:\n" + "\n".join(tree_lines) + "\n"
        s += "--------------------\n"

        return s

    def __eq__(self, other: object) -> bool:
        """
        Checks if two recipe representations match entirely
        :param other:   Other recipe parser instance to check against.
        :return: True if both recipes contain the same current state. False
                 otherwise.
        """
        if not isinstance(other, RecipeParser):
            raise TypeError
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
        raise NotImplementedError

    @staticmethod
    def _render_tree(node: _Node, depth: int, lines: list[str], parent: Optional[_Node] = None) -> None:
        """
        Recursive helper function that traverses the parse tree to generate
        a file.
        :param node:    Current node in the tree
        :param depth:   Current depth of the recursion
        :param lines:   Accumulated list of lines in the recipe file
        :param parent:  (Optional) Parent node to the current node. Set by
                        recursive calls only.
        """
        spaces = TAB_AS_SPACES * depth

        # Handle lines that are just comments
        if node.is_comment():
            lines.append(node.comment)
            return

        # Handle same-line printing
        if node.is_single_key():
            # Edge case: Handle a list containing 1 member
            if node.children[0].list_member_flag:
                lines.append(f"{spaces}{node.value}:  {node.comment}".rstrip())
                lines.append(
                    f"{spaces}{TAB_AS_SPACES}- "
                    f"{RecipeParser._stringify_yaml(node.children[0].value, True)}  "
                    f"{node.children[0].comment}".rstrip()
                )
                return

            # Edge case: The first element of dictionary in a list has a list `- ` prefix.
            # Subsequent keys in the dictionary just have a tab.
            if parent is not None and parent.is_collection_element() and node == parent.children[0]:
                lines.append(
                    f"{TAB_AS_SPACES * (depth-1)}- {node.value}: "
                    f"{RecipeParser._stringify_yaml(node.children[0].value)}  "
                    f"{node.children[0].comment}".rstrip()
                )
                return

            # Handle multi-line statements. In theory this will probably only
            # ever be strings, but we'll try to account for other types.
            #
            # By the language spec, # symbols do not indicate comments on
            # multiline strings.
            if node.children[0].multiline_flag:
                lines.append(f"{spaces}{node.value}: |  {node.comment}".rstrip())
                for val_line in node.children[0].value:
                    lines.append(f"{spaces}{TAB_AS_SPACES}" f"{RecipeParser._stringify_yaml(val_line, True)}".rstrip())
                return
            lines.append(
                f"{spaces}{node.value}: "
                f"{RecipeParser._stringify_yaml(node.children[0].value)}  "
                f"{node.children[0].comment}".rstrip()
            )
            return

        depth_delta = 1
        # Don't render a `:` for the non-visible root node. Also don't render invisible collection nodes.
        if depth > -1 and not node.is_collection_element():
            list_prefix = ""
            # Being in a list changes how the depth is rendered
            if node.list_member_flag:
                depth_delta += 1
                list_prefix = "- "
            # Nodes representing collections in a list have nothing to render
            lines.append(f"{spaces}{list_prefix}{node.value}:  {node.comment}".rstrip())

        for child in node.children:
            # Comments in a list are indented to list-level, but do not include
            # a list `-` mark
            if child.is_comment():
                lines.append(f"{spaces}{TAB_AS_SPACES}" f"{child.comment}".rstrip())
            # Empty keys can be easily confused for leaf nodes. The difference
            # is these nodes render with a "dangling" `:` mark
            elif child.is_empty_key():
                # Top-level empty-key edge case: Top level keys should have no
                # additional indentation.
                extra_tab = "" if depth < 0 else TAB_AS_SPACES
                lines.append(
                    f"{spaces}{extra_tab}" f"{RecipeParser._stringify_yaml(child.value)}:  " f"{child.comment}".rstrip()
                )
            # Leaf nodes are rendered as members in a list
            elif child.is_leaf():
                lines.append(
                    f"{spaces}{TAB_AS_SPACES}- "
                    f"{RecipeParser._stringify_yaml(child.value)}  "
                    f"{child.comment}".rstrip()
                )
            else:
                RecipeParser._render_tree(child, depth + depth_delta, lines, node)
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

    @staticmethod
    def _render_object_tree(node: _Node, replace_variables: bool, data: JsonType) -> None:
        """
        Recursive helper function that traverses the parse tree to generate
        a Pythonic data object.
        :param node:                Current node in the tree
        :param replace_variables:   If set to True, this replaces all variable
                                    substitutions with their set values.
        :param data:                Accumulated data structure
        """
        # Ignore comment-only lines
        if node.is_comment():
            return

        key = node.value
        for child in node.children:
            # Ignore comment-only lines
            if child.is_comment():
                continue

            # Handle multiline strings
            value = child.value if not child.multiline_flag else "\n".join(child.value)
            # TODO if enabled, string replace `{{}}` in `value`
            # TODO handle `| lower` and similar
            # TODO create new function for handling grammar
            if replace_variables:
                pass

            # Empty keys are interpreted to point to `None`
            if child.is_empty_key():
                data[key][child.value] = None
                continue

            # List members accumulate values in a list
            if child.list_member_flag:
                if key not in data:
                    data[key] = []
                data[key].append(value)
                continue

            # Other (non list and non-empty-key) leaf nodes set values directly
            if child.is_leaf():
                data[key] = value
                continue

            # All other keys prep for containing more dictionaries
            data.setdefault(key, {})
            RecipeParser._render_object_tree(child, replace_variables, data[key])

    def render_to_object(self, replace_variables: bool = False) -> JsonType:
        """
        Takes the underlying state of the parse tree and produces a Pythonic
        object/dictionary representation. Analogous to `json.load()`.
        :param replace_variables:   (Optional) If set to True, this replaces
                                    all variable substitutions with their set
                                    values.
        :return: Pythonic data object representation of the recipe.
        """
        data: JsonType = {}

        # Bootstrap/flatten the root-level
        for child in self._root.children:
            data.setdefault(child.value, {})
            RecipeParser._render_object_tree(child, replace_variables, data)

        return data

    ## YAML Access Functions ##

    def contains_value(self, path: str) -> bool:
        """
        Determines if a value (via a path) is contained in this recipe
        :param path:    JSON patch (RFC 6902)-style path to a value.
        :return: True if the path exists. False otherwise.
        """
        path_stack = RecipeParser._str_to_stack_path(path)
        return _Traverse.traverse(self._root, path_stack) is not None

    def get_value(self, path: str, default: JsonType = _sentinel) -> JsonType:
        """
        Retrieves a value at a given path. If the value is not found, return a
        specified default value or throw.
        :param path:    JSON patch (RFC 6902)-style path to a value.
        :param default: (Optional) If the value is not found, return this value
                        instead.
        :raises KeyError: If the value is not found AND no default is specified
        :return: If found, the value in the recipe at that path. Otherwise, the
                 caller-specified default value.
        """
        path_stack = RecipeParser._str_to_stack_path(path)
        node = _Traverse.traverse(self._root, path_stack)

        # Handle if the path was not found
        if node is None:
            if default == RecipeParser._sentinel:
                raise KeyError(f"No value/key found at path {path!r}")
            return default

        # Handle unpacking of the last key-value set of nodes.
        if node.is_single_key() and not node.is_root():
            if node.children[0].multiline_flag:
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

    def list_variables(self) -> list[str]:
        """
        Returns variables found in the recipe, sorted by first appearance.
        :return: List of variables found in the recipe.
        """
        return list(self._vars_tbl.keys())

    def contains_variable(self, var: str) -> bool:
        """
        Determines if a variable is set in this recipe.
        :param var: Variable to check for.
        :return: True if a variable name is found in this recipe. False
                 otherwise.
        """
        return var in self._vars_tbl

    def get_variable(self, var: str, default: Primitives = _sentinel) -> Primitives:
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
            if default == RecipeParser._sentinel:
                raise KeyError
            return default
        return self._vars_tbl[var]

    def set_variable(self, var: str, value: Primitives) -> None:
        """
        Adds or changes an existing Jinja variable.
        :param var:     Variable to modify
        :param value:   Value to set
        """
        self._vars_tbl[var] = value
        self._is_modified = True

    def del_variable(self, var: str) -> None:
        """
        Remove a variable from the project. If one is not found, no changes
        are made.
        :param var: Variable to delete
        """
        if not var in self._vars_tbl:
            return
        del self._vars_tbl[var]
        self._is_modified = True

    def get_variable_references(self, var: str) -> list[str]:
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

        def _collect_var_refs(node: _Node, path: _StrStackImmutable):
            # Variables can only be found inside string values.
            if isinstance(node.value, str) and var_re.search(node.value):
                path_list.append(RecipeParser._stack_path_to_str(path))

        _Traverse.traverse_all(self._root, _collect_var_refs)
        # The list should be de-duped and maintain order.
        return list(dict.fromkeys(path_list))

    ## Selector Functions ##

    def list_selectors(self) -> list[str]:
        """
        Returns selectors found in the recipe, sorted by first appearance.
        :return: List of selectors found in the recipe.
        """
        return list(self._selector_tbl.keys())

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

    @staticmethod
    def _is_valid_patch_node(node: _Node, node_idx: int) -> bool:
        """
        Indicates if the target node to perform a patch operation against is
        a valid node. This is based on the RFC spec for JSON patching paths.
        :param node:        Target node to validate
        :param node_idx:    If the caller is evaluating that a list member, exists,
                            this is the index into that list. Otherwise this
                            value should be less than 0.
        :return: True if the node can be patched. False otherwise.
        """
        # Path not found
        if node is None:
            return False

        # Leaf nodes contain values and not path information. Paths should
        # not be made that access leaf nodes, with the exception of members
        # of a list and keys. Making such a path violates the RFC.
        if not node.list_member_flag and not node.key_flag and node.is_leaf():
            return False

        if node_idx >= 0:
            # You cannot use the list access feature to access non-lists
            if len(node.children) and not node.children[0].list_member_flag:
                return False
            # Check the bounds if the target requires the use of an index,
            # remembering to use the virtual look-up table.
            idx_map = _Traverse.remap_child_indices(node.children)
            if node_idx > (len(idx_map) - 1):
                return False

        return True

    def _patch_add_find_target(self, path_stack: _StrStack) -> tuple[Optional[_Node], int, str, bool]:
        """
        Finds the target node of an `add()` operation, along with some
        supporting information.

        This function does not modify the parse tree.

        :param path_stack:  Path that describes a location in the tree, as a
                            list, treated like a stack.
        :return: A tuple containing:
                   - The target node, if found (or the parent node if the target
                     is a list member)
                   - The index of a node if the target is a list member
                   - An additional path that needs to be created, if applicable
                   - A flag indicating if the new data will be appended to a list
        """
        if len(path_stack) == 0:
            return None, -1, "", False

        # Special case that only applies to `add`. The `-` character indicates
        # the new element can be added to the end of the list.
        append_to_list = False
        if path_stack[0] == "-":
            path_stack.pop(0)
            append_to_list = True

        path_stack_copy = path_stack.copy()
        node, node_idx = _Traverse.traverse_with_index(self._root, path_stack)
        # Attempt to run a second time, if no node is found. As per the RFC,
        # the containing object/list must exist. That allows us to create only
        # 1 level in the path.
        path_to_create = ""
        if node is None:
            path_to_create = path_stack_copy.pop(0)
            node, node_idx = _Traverse.traverse_with_index(self._root, path_stack_copy)

        return node, node_idx, path_to_create, append_to_list

    def _patch_add(self, _: str, path_stack: _StrStack, value: JsonType) -> bool:
        """
        Performs a JSON patch `add` operation.
        :param path_stack:  Path that describes a location in the tree, as a
                            list, treated like a stack.
        :param value:       Value to add.
        """
        # NOTE from the RFC:
        #   Because this operation is designed to add to existing objects and
        #   arrays, its target location will often not exist...However, the
        #   object itself or an array containing it does need to exist
        # In other words, the patch op will, at most, create 1 new path level.
        # In addition, that also implies that trying to append to an existing
        # list only applies if the append operator is at the end of the list.
        node, node_idx, path_to_create, append_to_list = self._patch_add_find_target(path_stack)

        if not RecipeParser._is_valid_patch_node(node, node_idx):
            return False

        # If we couldn't find 1 level in the path, ensure that we re-insert that
        # as the "root" of the sub-tree we are about to create.
        if path_to_create:
            value = {path_to_create: value}

        new_children: Final[list[_Node]] = RecipeParser._generate_subtree(value)
        # Mark children as list members if they are list members
        if append_to_list or node_idx >= 0:
            for child in new_children:
                child.list_member_flag = True

        # Insert members if an index is specified. Otherwise, extend the list of
        # child nodes from the existing list.
        if node_idx >= 0:
            node.children[node_idx:node_idx] = new_children
        # Extend the list of children if we're appending or adding a new key.
        elif append_to_list or path_to_create:
            node.children.extend(new_children)
        # NOTE from the RFC:
        #   "If the member already exists, it is replaced by the specified value."
        else:
            node.children = new_children

        return True

    def _patch_remove(
        self, _0: str, path_stack: _StrStack, _1: Optional[JsonType]  # pylint: disable=invalid-name
    ) -> bool:
        """
        Performs a JSON patch `remove` operation.
        :param path_stack:  Path that describes a location in the tree, as a
                            list, treated like a stack.
        """
        if len(path_stack) == 0:
            return False

        # Removal in all scenarios requires targeting the parent node.
        node_idx = -1 if not path_stack[0].isdigit() else int(path_stack[0])
        # `traverse()` is destructive to the stack, so make a copy for the second
        # traversal call.
        path_stack_copy = path_stack.copy()
        node_to_rm = _Traverse.traverse(self._root, path_stack)
        path_stack_copy.pop(0)
        node = _Traverse.traverse(self._root, path_stack_copy)

        if not RecipeParser._is_valid_patch_node(node_to_rm, -1) or not RecipeParser._is_valid_patch_node(
            node, node_idx
        ):
            return False

        if node_idx >= 0:
            # Pop the "physical" index, not the "virtual" one to ensure
            # comments have been accounted for.
            node.children.pop(_Traverse.remap_child_indices(node.children)[node_idx])
            return True

        # In all other cases, the node to be removed must be found before eviction
        for i in range(len(node.children)):
            if node.children[i] == node_to_rm:
                node.children.pop(i)
                return True
        return False

    def _patch_replace(self, _: str, path_stack: _StrStack, value: JsonType) -> bool:
        """
        Performs a JSON patch `replace` operation.
        :param path_stack:  Path that describes a location in the tree, as a
                            list, treated like a stack.
        :param value:       Value to update with.
        """
        node, node_idx = _Traverse.traverse_with_index(self._root, path_stack)
        if not RecipeParser._is_valid_patch_node(node, node_idx):
            return False

        new_children: Final[list[_Node]] = RecipeParser._generate_subtree(value)
        # Lists inject all children at the target position.
        if node_idx >= 0:
            # Ensure all children are marked as list members
            for child in new_children:
                child.list_member_flag = True
            node.children[node_idx:node_idx] = new_children
            # Evict the old child, which is now behind the new children
            node.children.pop(node_idx + len(new_children))
            return True

        # Leafs that represent values/paths of values can evict all
        # children, and be replaced with new children, derived from a new
        # tree of values.
        node.children = new_children
        return True

    def _patch_move(self, path: str, path_stack: _StrStack, value_from: JsonType) -> bool:
        """
        Performs a JSON patch `add` operation.
        :param path:        Path as a string.
        :param path_stack:  Path that describes a location in the tree, as a
                            list, treated like a stack.
        :param value_from:  The "from" value in the JSON payload, i.e. the
                            path the value originates from.
        """
        # NOTE from the RFC:
        #   This operation is functionally identical to a "remove" operation on
        #   the "from" location, followed immediately by an "add" operation at
        #   the target location with the value that was just removed.
        # So to save on development and maintenance, that is how this op is
        # written.
        original_value: JsonType
        try:
            original_value = self.get_value(value_from)
        except KeyError:
            return False

        # Validate that `add`` will succeed before we `remove` anything
        node, node_idx, _, _ = self._patch_add_find_target(path_stack.copy())
        if not RecipeParser._is_valid_patch_node(node, node_idx):
            return False

        return self._patch_remove(value_from, RecipeParser._str_to_stack_path(value_from), None) and self._patch_add(
            path, path_stack, original_value
        )

    def _patch_copy(self, path: str, path_stack: _StrStack, value_from: JsonType) -> bool:
        """
        Performs a JSON patch `add` operation.
        :param path:        Path as a string.
        :param path_stack:  Path that describes a location in the tree, as a
                            list, treated like a stack.
        :param value_from:  The "from" value in the JSON payload, i.e. the
                            path the value originates from.
        """
        # NOTE from the RFC:
        #   This operation is functionally identical to an "add" operation at the
        #   target location using the value specified in the "from" member.
        # So to save on development and maintenance, that is how this op is
        # written.
        original_value: JsonType
        try:
            original_value = self.get_value(value_from)
        except KeyError:
            return False

        return self._patch_add(path, path_stack, original_value)

    def _patch_test(self, path: str, _: _StrStack, value: JsonType) -> bool:
        """
        Performs a JSON patch `test` operation.
        :param path:    Path as a string. Useful for invoking public
                        class members.
        :param value:   Value to evaluate against.
        """
        try:
            return self.get_value(path) == value
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
            "add": self._patch_add,
            "remove": self._patch_remove,
            "replace": self._patch_replace,
            "move": self._patch_move,
            "copy": self._patch_copy,
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
        path_stack: Final[_StrStack] = RecipeParser._str_to_stack_path(path)

        # All RFC ops are supported, so the JSON schema validation checks will
        # prevent us from getting this far, if there is an issue.
        op: Final[str] = patch["op"]
        supported_patch_ops: Final[_OpsTable] = self._get_supported_patch_ops()

        # The supplemental field name is determined by the operation type.
        value_from: Final[str] = "value" if op in RecipeParser._patch_ops_requiring_value else "from"

        # A no-op move is silly, but we might as well make it efficient AND
        # ensure a no-op move doesn't corrupt our modification flag.
        if op == "move" and path == patch[value_from]:
            return True

        # Both versions of the path are sent over so that the op can easily use
        # both private and public functions (without incurring even more
        # conversions between path types). NOTE: The `remove` op has no `value`
        # or `from` field to pass in.
        is_successful = supported_patch_ops[op](path, path_stack, None if op == "remove" else patch[value_from])

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

    def diff(self) -> str:
        """
        Returns a git-like-styled diff of the current recipe state with original
        state of the recipe. Useful for debugging and providing users with some
        feedback.
        :return: User-friendly displayable string that represents
                 notifications made to the recipe.
        """
        if not self.is_modified():
            return ""
        # Utilize `difflib` to lower maintenance overhead.
        return "\n".join(
            difflib.unified_diff(
                self._init_content.splitlines(), self.render().splitlines(), fromfile="original", tofile="current"
            )
        )
