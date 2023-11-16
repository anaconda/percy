"""
File:           _types.py
Description:    Provides private types, type aliases, constants, and small classes used by the parser and related files.
"""
from __future__ import annotations

import re
from typing import Final

import yaml

#### Private Types (Not to be used external to the `parser` module) ####

# Type alias for a list of strings treated as a Pythonic stack
StrStack = list[str]
# Type alias for a `StrStack` that must be immutable. Useful for some recursive operations.
StrStackImmutable = tuple[str, ...]

#### Private Constants (Not to be used external to the `parser` module) ####

# String that represents a root node in our path.
ROOT_NODE_VALUE: Final[str] = "/"
# Marker used to temporarily work around some Jinja-template parsing issues
PERCY_SUB_MARKER: Final[str] = "__PERCY_SUBSTITUTION_MARKER__"

#### Private Classes (Not to be used external to the `parser` module) ####

# NOTE: The classes put in this file should be structures (NamedTuples) and very small support classes that don't make
# sense to dedicate a file for.


class ForceIndentDumper(yaml.Dumper):
    """
    Custom YAML dumper used to include optional indentation for human readability.
    Adapted from: https://stackoverflow.com/questions/25108581/python-yaml-dump-bad-indentation
    """

    def increase_indent(self, flow: bool = False, indentless: bool = False) -> None:  # pylint: disable=unused-argument
        return super().increase_indent(flow, False)


class Regex:
    """
    Namespace used to organize all regular expressions used by the `parser` module.
    """

    # Pattern to detect Jinja variable names and functions
    _JINJA_VAR_FUNCTION_PATTERN: Final[str] = r"[a-zA-Z_][a-zA-Z0-9_\|\'\"\(\)\, =\.\-]*"

    # Jinja regular expressions
    JINJA_SUB: Final[re.Pattern[str]] = re.compile(r"{{\s*" + _JINJA_VAR_FUNCTION_PATTERN + r"\s*}}")
    JINJA_FUNCTION_LOWER: Final[re.Pattern[str]] = re.compile(r"\|\s*lower")
    JINJA_LINE: Final[re.Pattern[str]] = re.compile(r"({%.*%}|{#.*#})\n")
    JINJA_SET_LINE: Final[re.Pattern[str]] = re.compile(r"{%\s*set\s*" + _JINJA_VAR_FUNCTION_PATTERN + r"\s*=.*%}\s*\n")

    SELECTOR: Final[re.Pattern[str]] = re.compile(r"\[.*\]")
    MULTILINE: Final[re.Pattern[str]] = re.compile(r"^\s*.*:\s+\|(\s*|\s+#.*)")
    DETECT_TRAILING_COMMENT: Final[re.Pattern[str]] = re.compile(r"(\s)+(#)")
