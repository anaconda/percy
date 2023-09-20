"""
File:           test_recipe_parser.py
Description:    Unit tests for the recipe parser class and tools
"""
# Allows older versions of python to use newer forms of type annotation. There
# are major features introduced in 3.9 and 3.10.
from __future__ import annotations

from pathlib import Path
from typing import Final

import pytest

from percy.render import recipe_parser

# Path to supplementary files used in test cases
TEST_FILES_PATH = "percy/tests/test_aux_files"

# Long multi-line description string found in the `simple-recipe.yaml` test file
SIMPLE_DESCRIPTION: Final[
    str
] = "This is a PEP 561 type stub package for the toml package.\nIt can be used by type-checking tools like mypy, pyright,\npytype, PyCharm, etc. to check code that uses toml."  # pylint: disable=line-too-long


def load_file(file: Path | str) -> str:
    """
    Loads a file into a single string
    :param file:    Filename of the file to read
    :return: Text from the file
    """
    with open(Path(file), "r", encoding="utf-8") as f:
        return f.read()


def load_recipe(file_name: str) -> recipe_parser.RecipeParser:
    """
    Convenience function that simplifies initializing a recipe parser.
    :param file_name:   File name of the test recipe to load
    :return: RecipeParser instance, based on the file
    """
    recipe = load_file(f"{TEST_FILES_PATH}/{file_name}")
    return recipe_parser.RecipeParser(recipe)


## Construction and rendering sanity checks ##


def test_construction() -> None:
    """
    Tests the construction of a recipe parser instance with a simple, common
    example file.
    """
    types_toml = load_file(f"{TEST_FILES_PATH}/types-toml.yaml")
    parser = recipe_parser.RecipeParser(types_toml)
    assert (
        parser._init_content == types_toml  # pylint: disable=protected-access
    )
    assert parser._vars_tbl == {  # pylint: disable=protected-access
        "name": "types-toml",
        "version": "0.10.8.6",
    }
    assert not parser._is_modified  # pylint: disable=protected-access
    # TODO assert on tree structure
    # TODO assert on selectors table
    # assert parser._root == TODO


def test_dog_food_easy() -> None:
    """
    Test "eating our own dog food": Take a recipe, construct a parser, re-render
    and ensure the output matches the input.

    This is the "easy" recipe test, to ensure compatibility with "basic" recipe
    structures with no gotchas.
    """
    types_toml = load_file(f"{TEST_FILES_PATH}/types-toml.yaml")
    parser = recipe_parser.RecipeParser(types_toml)
    assert parser.render() == types_toml


def test_dog_food_medium() -> None:
    """
    Test "eating our own dog food": Take a recipe, construct a parser, re-render
    and ensure the output matches the input.

    This is the "medium" recipe test, to ensure compatibility with some more
    contrived examples
    """
    simple = load_file(f"{TEST_FILES_PATH}/simple-recipe.yaml")
    parser = recipe_parser.RecipeParser(simple)
    assert parser.render() == simple


## Values ##


def test_contains_value() -> None:
    """
    Tests retrieval of a value from a parsed YAML example.
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.contains_value("/build/number")
    assert parser.contains_value("/build/number/")
    assert parser.contains_value("/build")
    assert parser.contains_value("/requirements/host/0")
    assert parser.contains_value("/requirements/host/1")
    # Path not found cases
    assert not parser.contains_value("/invalid/fake/path")
    assert not parser.is_modified()


def test_get_value() -> None:
    """
    Tests retrieval of a value from a parsed YAML example.
    """
    parser = load_recipe("simple-recipe.yaml")
    # Return a single value
    assert parser.get_value("/build/number") == {"number": 0}
    assert parser.get_value("/build/number/") == 0
    # Return a compound value
    assert parser.get_value("/build") == {
        "number": 0,
        "skip": True,
        "is_true": True,
    }
    assert parser.get_value("/build/") == {
        "number": 0,
        "skip": True,
        "is_true": True,
    }
    # Return a value in a list
    assert parser.get_value("/requirements/host") == ["setuptools", "fakereq"]
    assert parser.get_value("/requirements/host/") == ["setuptools", "fakereq"]
    assert parser.get_value("/requirements/host/0") == "setuptools"
    assert parser.get_value("/requirements/host/1") == "fakereq"
    # Return a multiline string
    assert parser.get_value("/about/description") == {
        "description": SIMPLE_DESCRIPTION
    }
    assert parser.get_value("/about/description/") == SIMPLE_DESCRIPTION
    # Path not found cases
    with pytest.raises(KeyError):
        parser.get_value("/invalid/fake/path")
    assert parser.get_value("/invalid/fake/path", 42) == 42
    # Tests that a user can pass `None` without throwing
    assert parser.get_value("/invalid/fake/path", None) is None
    assert not parser.is_modified()


## Variables ##


def test_list_variable() -> None:
    """
    Validates the list of variables found
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.list_variables() == ["zz_non_alpha_first", "name", "version"]
    assert not parser.is_modified()


def test_contains_variable() -> None:
    """
    Validates checking if a variable exists in a recipe
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.contains_variable("zz_non_alpha_first")
    assert parser.contains_variable("name")
    assert parser.contains_variable("version")
    assert not parser.contains_variable("fake_var")
    assert not parser.is_modified()


def test_get_variable() -> None:
    """
    Tests the value returned from fetching a variable
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.get_variable("zz_non_alpha_first") == 42
    assert parser.get_variable("name") == "types-toml"
    assert parser.get_variable("version") == "0.10.8.6"
    with pytest.raises(KeyError):
        parser.get_variable("fake_var")
    assert parser.get_variable("fake_var", 43) == 43
    # Tests that a user can pass `None` without throwing
    assert parser.get_variable("fake_var", None) is None
    assert not parser.is_modified()


def test_set_variable() -> None:
    """
    Tests setting and adding a variable
    """
    parser = load_recipe("simple-recipe.yaml")
    parser.set_variable("name", "foobar")
    parser.set_variable("zz_non_alpha_first", 24)
    # Ensure a missing variable gets added
    parser.set_variable("DNE", "The limit doesn't exist")
    # Validate
    assert parser.is_modified()
    assert parser.list_variables() == [
        "zz_non_alpha_first",
        "name",
        "version",
        "DNE",
    ]
    assert parser.get_variable("name") == "foobar"
    assert parser.get_variable("zz_non_alpha_first") == 24
    assert parser.get_variable("DNE") == "The limit doesn't exist"


def test_del_variable() -> None:
    """
    Tests deleting a variable
    """
    parser = load_recipe("simple-recipe.yaml")
    parser.del_variable("name")
    # Ensure a missing var doesn't crash a delete
    parser.del_variable("DNE")
    # Validate
    assert parser.is_modified()
    assert parser.list_variables() == ["zz_non_alpha_first", "version"]
    with pytest.raises(KeyError):
        parser.get_variable("name")


def test_get_variable_references() -> None:
    """
    Tests generating a list of paths that use a variable
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.get_variable_references("version") == [
        "/test_var_usage/foo",
    ]
    assert parser.get_variable_references("zz_non_alpha_first") == [
        "/test_var_usage/bar/1",
    ]
    assert parser.get_variable_references("name") == [
        "/package/name",
        "/test_var_usage/bar/3",
    ]
    assert not parser.is_modified()


## Selectors ##


def test_list_selectors() -> None:
    """
    Validates the list of selectors found
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.list_selectors() == ["[unix]", "[py<37]"]
    assert not parser.is_modified()


def test_contains_selectors() -> None:
    """
    Validates checking if a selector exists in a recipe
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.contains_selector("[py<37]")
    assert parser.contains_selector("[unix]")
    assert not parser.contains_selector("[fake selector]")
    assert not parser.is_modified()


def test_get_selector_paths() -> None:
    """
    Tests the paths returned from fetching a selector
    """
    parser = load_recipe("simple-recipe.yaml")
    assert parser.get_selector_paths("[py<37]") == ["/build/skip"]
    assert parser.get_selector_paths("[unix]") == [
        "/package/name",
        "/requirements/host/0",
        "/requirements/host/1",
    ]
    assert not parser.get_selector_paths("[fake selector]")
    assert not parser.is_modified()


## Patch and Search ##


def test_patch_schema_validation() -> None:
    """
    Tests edge cases that should trigger an exception on JSON patch schema
    validation. Valid schemas are inherently tested in the other patching tests.
    """
    parser = load_recipe("simple-recipe.yaml")
    # Invalid enum/unknown op
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "fakeop",
                "path": "/build/number",
                "value": 42,
            }
        )
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "",
                "path": "/build/number",
                "value": 42,
            }
        )
    # Patch has extra field(s)
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "replace",
                "path": "/build/number",
                "value": 42,
                "extra": "field",
            }
        )
    # Patch is missing required fields
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "path": "/build/number",
                "value": 42,
            }
        )
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "replace",
                "value": 42,
            }
        )
    # Patch is missing required fields, based on `op`
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "add",
                "path": "/build/number",
            }
        )
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "remove",
                "path": "/build/number",
            }
        )
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "replace",
                "path": "/build/number",
            }
        )
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "move",
                "path": "/build/number",
            }
        )
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "copy",
                "path": "/build/number",
            }
        )
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch(
            {
                "op": "test",
                "path": "/build/number",
            }
        )
    # Patch has invalid types in critical fields
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({"op": "move", "path": 42, "value": 42})
    with pytest.raises(recipe_parser.JsonPatchValidationException):
        parser.patch({"op": "move", "path": "/build/number", "from": 42})


def test_patch_path_not_found() -> None:
    """
    Tests if `patch` returns false on all ops when the path is not found.
    Also checks if the tree has been modified.
    """
    parser = load_recipe("simple-recipe.yaml")

    assert not (
        parser.patch(
            {
                "op": "replace",
                "path": "/package/path/to/fake/value",
                "value": 42,
            }
        )
    )
    assert not (
        parser.patch(
            {
                "op": "test",
                "path": "/package/path/to/fake/value",
                "value": 42,
            }
        )
    )

    assert not parser.is_modified()


def test_patch_test() -> None:
    """
    Tests the `test` patch op. The `test` op may be useful for other test
    assertions, so it is tested before the other patch operations.
    """
    parser = load_recipe("simple-recipe.yaml")

    # Test that values match, as expected
    assert parser.patch(
        {
            "op": "test",
            "path": "/build/number",
            "value": 0,
        }
    )
    assert parser.patch(
        {
            "op": "test",
            "path": "/build",
            "value": {
                "number": 0,
                "skip": True,
                "is_true": True,
            },
        }
    )
    assert parser.patch(
        {
            "op": "test",
            "path": "/requirements/host",
            "value": ["setuptools", "fakereq"],
        }
    )
    assert parser.patch(
        {
            "op": "test",
            "path": "/requirements/host/1",
            "value": "fakereq",
        }
    )
    assert parser.patch(
        {
            "op": "test",
            "path": "/about/description",
            "value": SIMPLE_DESCRIPTION,
        }
    )
    # Test that values do not match, as expected
    assert not (
        parser.patch(
            {
                "op": "test",
                "path": "/build/number",
                "value": 42,
            }
        )
    )
    assert not (
        parser.patch(
            {
                "op": "test",
                "path": "/build",
                "value": {
                    "number": 42,
                    "skip": True,
                },
            }
        )
    )
    assert not (
        parser.patch(
            {
                "op": "test",
                "path": "/requirements/host",
                "value": ["not_setuptools", "fakereq"],
            }
        )
    )
    assert not (
        parser.patch(
            {
                "op": "test",
                "path": "/requirements/host/1",
                "value": "other_fake",
            }
        )
    )
    assert not (
        parser.patch(
            {
                "op": "test",
                "path": "/about/description",
                "value": "other_fake\nmultiline",
            }
        )
    )

    # Ensure that `test` does not modify the tree
    assert not parser.is_modified()


def test_patch_replace() -> None:
    """
    Tests the `replace` patch op.
    """
    parser = load_recipe("simple-recipe.yaml")
    # Patch an integer
    assert parser.patch(
        {
            "op": "replace",
            "path": "/build/number",
            "value": 42,
        }
    )
    # Patch a bool
    assert parser.patch(
        {
            "op": "replace",
            "path": "/build/is_true",
            "value": False,
        }
    )
    # Patch a string
    assert parser.patch(
        {
            "op": "replace",
            "path": "/about/license",
            "value": "MIT",
        }
    )
    # Patch an array element
    assert parser.patch(
        {
            "op": "replace",
            "path": "/requirements/run/0",
            "value": "cpython",
        }
    )
    # Patch an element to become an array
    assert parser.patch(
        {
            "op": "replace",
            "path": "/about/summary",
            "value": [
                "The Trial",
                "Never Ends",
                "Picard",
            ],
        }
    )
    # Patch a multiline string
    assert parser.patch(
        {
            "op": "replace",
            "path": "/about/description",
            "value": (
                "This is a PEP 561\ntype stub package\nfor the toml package."
            ),
        }
    )

    # Hard mode: replace a string with an object containing multiple types in
    # a complex data structure.
    assert parser.patch(
        {
            "op": "replace",
            "path": "/multi_level/list_2/1",
            "value": {"build": {"number": 42, "skip": True}},
        }
    )

    # Sanity check: validate all modifications
    assert parser.is_modified()
    # NOTE: That patches, as of writing, cannot preserve selectors
    assert parser.render() == load_file(
        f"{TEST_FILES_PATH}/simple-recipe_test_patch_replace.yaml"
    )


## Diff ##
