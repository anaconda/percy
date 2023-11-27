"""
File:           types.py
Description:    Provides public types, type aliases, constants, and small classes used by rendering.
"""

from __future__ import annotations

from percy.types import JsonType

# Type that represents a dictionary of selector info
SelectorDict = dict[str, JsonType]
