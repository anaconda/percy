"""
File:           types.py
Description:    Provides public types, type aliases, constants, and small classes used by the parser.
"""
from __future__ import annotations

from typing import Any, Final, Mapping, Union

#### Types ####

# Base types that can store value
Primitives = Union[str, int, float, bool, None]
# Same primitives, as a tuple. Used with `isinstance()`
PRIMITIVES_TUPLE: Final[tuple] = (str, int, float, bool, type(None))

# Type that represents a JSON-like type
JsonType = Union[dict[str, "JsonType"], list["JsonType"], Primitives]

# Type that represents a JSON patch payload
JsonPatchType = dict[str, JsonType]
# Type for a schema object used by the `jsonschema` library
SchemaType = Mapping[str, Any]  # type: ignore[misc]


#### Constants ####

# Indicates how many spaces are in a level of indentation
TAB_SPACE_COUNT: Final[str] = 2
TAB_AS_SPACES: Final[str] = " " * TAB_SPACE_COUNT

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
