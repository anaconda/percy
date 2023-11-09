""" Update a recipe
"""

import argparse
import json
import logging
from pathlib import Path

import percy.render.recipe as recipe

logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="updater",
        description="Patch a recipe.",
    )
    parser.add_argument(
        "-r",
        "--recipe_path",
        type=Path,
        help="recipe path",
        default="/Users/cbousseau/work/recipes/aggregate2/cartopy-feedstock/recipe/meta.yaml",
    )
    parser.add_argument(
        "-p",
        "--patch_file",
        type=Path,
        help="patch_file path",
        default="test_patch.json",
    )
    return parser


def load_recipe(recipe_path):
    others = {"r_implementation": "r-base"}
    rendered_recipes = recipe.render(
        recipe_path,
        ["linux-64"],
        ["3.10"],
        others,
        False,
        recipe.RendererType.RUAMEL,
    )
    rendered_recipe = next(iter(rendered_recipes))
    return rendered_recipe


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()

    # Now do the actual modifications required.
    rendered_recipe = recipe.Recipe.from_file(args.recipe_path)
    with open(args.patch_file, encoding="utf-8") as p:
        rendered_recipe.patch(json.load(p), False)

    # rendered_recipe = load_recipe(args.recipe_path)

    # # update pin and increment build number
    # rendered_recipe = load_recipe(args.recipe_path)
    # with open(args.patch_file) as p:
    #     rendered_recipe.patch(json.load(p), False)
