"""
File:           test_recipe_parser.py
Description:    Unit tests for the recipe parser class and tools
"""
import pytest

from pathlib import Path
from typing import Final

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

## Construction and rendering sanity checks ##

def test_construction():
    """
    Tests the construction of a recipe parser instance with a simple, common
    example file.
    """
    types_toml = load_file(f"{TEST_FILES_PATH}/types-toml.yaml")
    parser = recipe_parser.RecipeParser(types_toml)
    assert parser._init_content == types_toml
    assert parser._vars_tbl == {"name": "types-toml", "version": "0.10.8.6"}
    assert parser._is_modified == False
    # TODO assert on tree structure
    # TODO assert on selectors table
    #assert parser._root == TODO

def test_dog_food_easy():
    """
    Test "eating our own dog food": Take a recipe, construct a parser,

    This is the "easy" recipe test, to ensure compatibility with "basic" recipe
    structures with no gotchas.
    """
    types_toml = load_file(f"{TEST_FILES_PATH}/types-toml.yaml")
    parser = recipe_parser.RecipeParser(types_toml)
    assert parser.render() == types_toml

## Values ##

def test_get_value():
    """
    Tests retrieval of a value from a parsed YAML example.
    """
    # TODO complete
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.contains_value("/build/number")
    assert parser.contains_value("/build/number/")
    assert parser.contains_value("/build")
    assert parser.contains_value("/requirements/host/0")
    assert parser.contains_value("/requirements/host/1")
    # Path not found cases
    assert not parser.contains_value("/invalid/fake/path")

def test_get_value():
    """
    Tests retrieval of a value from a parsed YAML example.
    """
    # TODO complete
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    # Return a single value
    assert parser.get_value("/build/number") == { "number": 0 }
    assert parser.get_value("/build/number/") == 0
    # Return a compound value
    assert parser.get_value("/build") == { "number": 0, "skip": True }
    assert parser.get_value("/build/") == { "number": 0, "skip": True }
    # Return a value in a list
    assert parser.get_value("/requirements/host") == ["setuptools", "fakereq"]
    assert parser.get_value("/requirements/host/") == ["setuptools", "fakereq"]
    assert parser.get_value("/requirements/host/0") == "setuptools"
    assert parser.get_value("/requirements/host/1") == "fakereq"
    # Return a multiline string
    description: Final[str] = "This is a PEP 561 type stub package for the toml package.\nIt can be used by type-checking tools like mypy, pyright,\npytype, PyCharm, etc. to check code that uses toml."
    assert parser.get_value("/about/description") == {"description": description}
    assert parser.get_value("/about/description/") == description
    # Path not found cases
    with pytest.raises(KeyError):
        parser.get_value("/invalid/fake/path")
    assert parser.get_value("/invalid/fake/path", 42) == 42

## Variables ##

def test_list_var():
    """
    Validates the list of variables found
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.list_vars() == ["zz_non_alpha_first", "name", "version"]

def test_contains_var():
    """
    Validates checking if a variable exists in a recipe
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.contains_var("zz_non_alpha_first")
    assert parser.contains_var("name")
    assert parser.contains_var("version")
    assert not parser.contains_var("fake_var")

def test_get_var():
    """
    Tests the value returned from fetching a variable
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.get_var("zz_non_alpha_first") == 42
    assert parser.get_var("name") == "types-toml"
    assert parser.get_var("version") == "0.10.8.6"
    with pytest.raises(KeyError):
        parser.get_var("fake_var")
    assert parser.get_var("fake_var", 43) == 43

## Selectors ##

def test_list_selectors():
    """
    Validates the list of selectors found
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.list_selectors() == ["[unix]", "[py<37]"]

def test_contains_selectors():
    """
    Validates checking if a selector exists in a recipe
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.contains_selector("[py<37]")
    assert parser.contains_selector("[unix]")
    assert not parser.contains_selector("[fake selector]")

def test_get_selector_paths():
    """
    Tests the paths returned from fetching a selector
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.get_selector_paths("[py<37]") == ["/build/skip"]
    assert parser.get_selector_paths("[unix]") == [
        "/build/number",
        "/requirements/host/0",
        "/requirements/host/1",
    ]
    assert parser.get_selector_paths("[fake selector]") == []

## Patch and Search ##

def test_patch_schema_validation():
    """
    Tests edge cases that should trigger an exception on JSON patch schema
    validation. Valid schemas are inherently tested in the other patching tests.
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    # Invalid enum/unknown op
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "fakeop",
            "path": "/build/number",
            "value": 42,
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "",
            "path": "/build/number",
            "value": 42,
        })
    # Patch has extra field(s)
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "replace",
            "path": "/build/number",
            "value": 42,
            "extra": "field",
        })
    # Patch is missing required fields
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "path": "/build/number",
            "value": 42,
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "replace",
            "value": 42,
        })
    # Patch is missing required fields, based on `op`
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "add",
            "path": "/build/number",
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "remove",
            "path": "/build/number",
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "replace",
            "path": "/build/number",
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "move",
            "path": "/build/number",
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "copy",
            "path": "/build/number",
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "test",
            "path": "/build/number",
        })
    # Patch has invalid types in critical fields
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "move",
            "path": 42,
            "value": 42
        })
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({
            "op": "move",
            "path": "/build/number",
            "from": 42
        })

def test_patch_path_not_found():
    """
    Tests if `patch` returns false on all ops when the path is not found.
    Also checks if the tree has been modified.
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)

    assert (
        parser.patch({
            "op": "replace",
            "path": "/package/path/to/fake/value",
            "value": 42,
        }) == False
    )
    assert (
        parser.patch({
            "op": "test",
            "path": "/package/path/to/fake/value",
            "value": 42,
        }) == False
    )

    assert parser.is_modified() == False

## Diff ##
