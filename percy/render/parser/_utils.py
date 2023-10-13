"""
File:           _utils.py
Description:    Provides private utility functions only used by the parser.
"""
from __future__ import annotations

import json

from percy.render.parser._types import PERCY_SUB_MARKER, ROOT_NODE_VALUE, Regex, StrStack, StrStackImmutable
from percy.render.parser.types import Primitives


def str_to_stack_path(path: str) -> StrStack:
    """
    Takes a JSON-patch path as a string and return a path as a stack of strings. String paths are used by callers,
    stacks are used internally.

    For example:
        "/foo/bar/baz" -> ["baz", "bar", "foo", "/"]
    :param path: Path to deconstruct into a stack
    :return: Path, described as a stack of strings.
    """
    # TODO: validate the path starts with `/` (root)

    # `PurePath` could be used here, but isn't for performance gains.
    # TODO reduce 3 (O)n operations to 1 O(n) operation

    # Wipe the trailing `/`, if provided. It doesn't have meaning here; only the `root` path is tracked.
    if path[-1] == ROOT_NODE_VALUE:
        path = path[:-1]
    parts = path.split("/")
    # Replace empty strings with `/` for compatibility in other functions.
    for i in range(0, len(parts)):
        if parts[i] == "":
            parts[i] = "/"
    return parts[::-1]


def stack_path_to_str(path_stack: StrStack | StrStackImmutable) -> str:
    """
    Takes a stack that represents a path and converts it into a string. String paths are used by callers, stacks are
    used internally.

    :param path_stack:  Stack to construct back into a string.
    :return: Path, described as a string.
    """
    # Normalize type if a tuple is given.
    if isinstance(path_stack, tuple):
        path_stack = list(path_stack)
    path = ""
    while len(path_stack) > 0:
        value = path_stack.pop()
        # Special case to bootstrap root; the first element will automatically add the first slash.
        if value == ROOT_NODE_VALUE:
            continue
        path += f"/{value}"
    return path


def num_tab_spaces(s: str) -> int:
    """
    Counts the number of spaces at the start of the string. Used to indicate depth of a field in a YAML file (the YAML
    specification dictates only spaces can be used for indenting).
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


def substitute_markers(s: str, subs: list[str]) -> str:
    """
    Given a string, replace substitution markers with the original Jinja template from a list of options.
    :param s:       String to replace substitution markers with
    :param subs:    List of substitutions to make, in order of appearance
    :return: New string, with substitutions removed
    """
    while s.find(PERCY_SUB_MARKER) >= 0 and len(subs):
        s = s.replace(PERCY_SUB_MARKER, subs[0], 1)
        subs.pop(0)
    return s


def stringify_yaml(val: Primitives, multiline_flag: bool = False) -> Primitives:
    """
    Special function for handling edge cases when converting values back to YAML.
    :param val: Value to check
    :param multiline_flag:  (Optional) If the value being processed is a multiline string, set this flag to True to
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
    # Ensure string quote escaping if quote marks are present. Otherwise this has the unintended consequence of
    # quoting all YAML strings. Although not wrong, it does not follow our common practices. Quote escaping is not
    # required for multiline strings. We do not escape quotes for Jinja value statements.
    if not multiline_flag and isinstance(val, str) and not Regex.JINJA_SUB.match(val):
        if "'" in val or '"' in val:
            # The PyYaml equivalent function injects newlines, hence why we abuse the JSON library to write our YAML
            return json.dumps(val)
    return val
