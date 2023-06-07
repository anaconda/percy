""" Update a recipe

- Increment build number to latest+1 from what is on main.
- Pass a dictionary of dependencies to add or update.

"""

import percy.render.recipe as recipe
import argparse
from pathlib import Path
import logging
import re
import copy
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

def update_dep(operation, package, section, pkg, constraints):
    
    # get initial section range
    recipe = package.recipe
    (start_row, start_col, end_row, end_col) = recipe.get_raw_range(f"{package.path_prefix}requirements/{section}")
    range = copy.deepcopy(recipe.meta_yaml[start_row:end_row])

    # does section has dep?
    has_dep = package.has_dep(section, pkg)

    # remove elements
    if operation in ["remove", "replace", "add_or_replace"]:
        range = [l for l in range if not pkg in l ]

    # add elements
    if operation in ["add", "replace", "add_or_replace"]:
        if operation != "replace" or has_dep:
            for constraint in constraints:
                range.insert(end_row, " " * start_col + f"- {pkg} {constraint}")

    # apply change
    recipe.meta_yaml[start_row:end_row] = range

def load_recipe(recipe_path):
    others = {"r_implementation": "r-base"}
    rendered_recipes = recipe.render(recipe_path, ["linux-64"], ["3.10"], others, False, recipe.RendererType.RUAMEL)
    rendered_recipe = next(iter(rendered_recipes))
    return rendered_recipe

def increment_build_number(recipe):
    build_number = int(recipe.meta["build"]["number"]) + 1
    patterns = (
        ('(?=\s*?)number:\s*([0-9]+)',
            'number: {}'.format(build_number)),
        ('(?=\s*?){%\s*set build_number\s*=\s*"?([0-9]+)"?\s*%}',
            '{{% set build_number = {} %}}'.format(build_number)),
        ('(?=\s*?){%\s*set build\s*=\s*"?([0-9]+)"?\s*%}',
            '{{% set build = {} %}}'.format(build_number)),
    )
    text = "\n".join(recipe.meta_yaml)
    for pattern, replacement in patterns:
        text = re.sub(pattern, replacement, text)
    recipe.meta_yaml = text.split("\n")

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
    patch = [
        { "op": "replace", "section": "host", "package": "openssl", "constraint": ["{{ openssl }}"] },
        { "op": "replace", "section": "run", "package": "openssl", "constraint": ["3.*"] },
        { "op": "replace", "section": "host", "package": "numpy", "constraint": ["1.21  # [py<311]", "1.23  # [py>=311]"] },
        { "op": "replace", "section": "run", "package": "numpy", "constraint": [">=1.21,<=2.0a0  # [py<311]", ">=1.23,<=2.0a0  # [py>=311]"] },
        { "op": "remove", "section": "host", "package": "geos", "constraint": [] },
        { "op": "remove", "section": "run", "package": "geos", "constraint": [] },
        { "op": "add", "section": "host", "package": "geos2", "constraint": ["1.2.3"] },
        { "op": "add", "section": "run", "package": "{{ pin_compatible('geos2') }}", "constraint": [""] },
    ]
    rendered_recipe = load_recipe(args.recipe_path)
    increment_build_number(rendered_recipe)
    rendered_recipe.save()
    package_names = rendered_recipe.packages.keys()
    for op in patch:
        for package_name in package_names:
            rendered_recipe = load_recipe(args.recipe_path)
            update_dep(op["op"], rendered_recipe.packages[package_name], op["section"], op["package"], op["constraint"])
            rendered_recipe.save()
