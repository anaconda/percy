"""
File:           types.py
Description:    Provides public types, type aliases, constants, and small classes used by the parser.
"""
from __future__ import annotations

from typing import Final, Hashable, TypeVar, Union

#### Types ####

# Base types that can store value
Primitives = Union[str, int, float, bool, None]
# Same primitives, as a tuple. Used with `isinstance()`
PRIMITIVES_TUPLE: Final[tuple[type[str], type[int], type[float], type[bool], type[None]]] = (
    str,
    int,
    float,
    bool,
    type(None),
)

# Type that represents a JSON-like type
JsonType = Union[dict[str, "JsonType"], list["JsonType"], Primitives]

# Type that represents a JSON patch payload
JsonPatchType = dict[str, JsonType]

# Types that build up to types used in `jsonschema`s
SchemaPrimitives = Union[str, int, bool, None]
SchemaDetails = Union[dict[str, "SchemaDetails"], list["SchemaDetails"], SchemaPrimitives]
# Type for a schema object used by the `jsonschema` library
SchemaType = dict[str, SchemaDetails]

# Generic, hashable type
H = TypeVar("H", bound=Hashable)

# Nodes can store a single value or a list of strings (for multiline-string nodes)
NodeValue = Primitives | list[str]


# All sentinel values used in this module should be constructed with this class, for typing purposes.
class SentinelType:
    pass


#### Constants ####

# Indicates how many spaces are in a level of indentation
TAB_SPACE_COUNT: Final[int] = 2
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
