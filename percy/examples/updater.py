""" Update a recipe
"""

import percy.render.recipe as recipe
import argparse
from pathlib import Path
import logging

logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="aggregate_issue_finder",
        description="Find issues in aggregate pinned feedstocks.",
    )
    parser.add_argument(
        "-r",
        "--recipe_path",
        type=Path,
        help="recipe path",
        default="/Users/cbousseau/work/recipes/aggregate2/cartopy-feedstock/recipe/meta.yaml",
    )
    return parser


def load_recipe(recipe_path):
    others = {"r_implementation": "r-base"}
    rendered_recipes = recipe.render(
        recipe_path, ["linux-64"], ["3.10"], others, False, recipe.RendererType.RUAMEL
    )
    rendered_recipe = next(iter(rendered_recipes))
    return rendered_recipe


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()

    rendered_recipe = load_recipe(args.recipe_path)

    # update pin and increment build number
    """
        Patch operations:
            replace : if package is found in section, replace by "- package constraint"
            add: add "- package constraint" to section
            add_or_replace : add or replace by "- package constraint"
            remove: remove "- package" from section
    """
    operations = [
        {
            "op": "add_or_replace",
            "section": "host",
            "package": "openssl",
            "constraint": ["{{ openssl }}"],
        },
        {
            "op": "add_or_replace",
            "section": "run",
            "package": "openssl",
            "constraint": ["3.*"],
        },
        {
            "op": "replace",
            "section": "host",
            "package": "numpy",
            "constraint": ["1.21  # [py<311]", "1.23  # [py>=311]"],
        },
        {
            "op": "replace",
            "section": "run",
            "package": "numpy",
            "constraint": [">=1.21,<=2.0a0  # [py<311]", ">=1.23,<=2.0a0  # [py>=311]"],
        },
        {"op": "remove", "section": "host", "package": "geos", "constraint": []},
        {"op": "remove", "section": "run", "package": "geos", "constraint": []},
        {"op": "add", "section": "host", "package": "geos2", "constraint": ["1.2.3"]},
        {
            "op": "add",
            "section": "run",
            "package": "{{ pin_compatible('geos2') }}",
            "constraint": [""],
        },
        {
            "op": "add_or_replace",
            "section": "test",
            "package": "pytest2",
            "constraint": [""],
        },
    ]
    rendered_recipe = load_recipe(args.recipe_path)
    rendered_recipe.patch(operations)
