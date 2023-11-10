"""
File:           exceptions.py
Description:    Exceptions emitted by the rendering engine
"""
from __future__ import annotations

from typing import Optional


class RecipeError(Exception):
    """
    Base Recipe exception
    """

    def __init__(self, item, message: Optional[str] = None, line: Optional[int] = None, column: Optional[int] = None):
        self.line = line
        self.column = column
        if message is not None:
            if line is not None:
                message += f" (at line {line})"
                if column is not None:
                    message += f" / column {column})"
            super().__init__(item, message)
        else:
            super().__init__(item)


class EmptyRecipe(RecipeError):
    """Raised if the recipe file is empty"""

    template = "is empty"


class MissingMetaYaml(RecipeError):
    """Raised when FileNotFoundError is encountered

    self.item is NOT a Recipe but a str here
    """

    template = "has missing file `meta.yaml`"


class JinjaRenderFailure(RecipeError):
    """Raised on Jinja rendering problems"""

    template = "failed to render in Jinja2. Error was: %s"


class YAMLRenderFailure(RecipeError):
    """Raised on YAML parsing problems"""

    template = "failed to load YAML. Error was: %s"
