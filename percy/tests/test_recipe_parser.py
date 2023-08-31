"""
File:           test_recipe_parser.py
Description:    Unit tests for the recipe parser class and tools
"""
from pathlib import Path

from percy.render import recipe_parser

# Path to supplementary files used in test cases
TEST_FILES_PATH = "percy/tests/test_aux_files"


def load_file(file: Path | str) -> str:
    """
    Loads a file into a single string
    :param file:    Filename of the file to read
    :return: Text from the file
    """
    with open(Path(file), "r", encoding="utf-8") as f:
        return f.read()

def test_construction():
    """
    Tests the construction of a recipe parser instance with a simple, common
    example file.
    """
    types_toml = load_file(f"{TEST_FILES_PATH}/types-toml.yaml")
    parser = recipe_parser.RecipeParser(types_toml)
    assert parser._vars == {"name": "types-toml", "version": "0.10.8.6"}
    # TODO more assert statements
    # TODO remove debugging
    print(parser.render())
