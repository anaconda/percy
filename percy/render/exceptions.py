"""
File:           exceptions.py
Description:    Exceptions emitted by the rendering engine
"""

from __future__ import annotations

from pathlib import Path
from typing import Final, Optional


class RecipeError(Exception):
    """
    Base Recipe exception
    """

    def __init__(
        self,
        recipe_file: str | Path,
        message: Optional[str] = None,
        line: Optional[int] = None,
        column: Optional[int] = None,
    ):
        self.line = line
        self.column = column
        if message is not None:
            if line is not None:
                message += f" (at line {line})"
                if column is not None:
                    message += f" / column {column})"
            super().__init__(Path(recipe_file), message)
        else:
            super().__init__(Path(recipe_file))


class EmptyRecipe(RecipeError):
    """
    Raised if the recipe file is empty
    """

    TEMPLATE: Final[str] = "is empty"


class MissingMetaYaml(RecipeError):
    """
    Raised when FileNotFoundError is encountered

    self.item is NOT a Recipe but a str here
    """

    TEMPLATE: Final[str] = "has missing file `meta.yaml`"


class JinjaRenderFailure(RecipeError):
    """
    Raised on Jinja rendering problems
    """

    TEMPLATE: Final[str] = "failed to render in Jinja2. Error was: %s"


class YAMLRenderFailure(RecipeError):
    """
    Raised on YAML parsing problems
    """

    TEMPLATE: Final[str] = "failed to load YAML. Error was: %s"
