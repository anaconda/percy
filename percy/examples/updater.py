""" Update a recipe
"""

import percy.render.recipe as recipe
import argparse
from pathlib import Path
import logging
import re
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
        default="/Users/cbousseau/work/recipes/aggregate2/mamba-feedstock/recipe/meta.yaml",
    )
    return parser

def update_dep(package, section, pkg, constraint):
    if package.has_dep(section, pkg):
        _replace_dep(package.recipe, f"{package.path_prefix}requirements/{section}", pkg, constraint)
    else:
        _add_dep(package.recipe, f"{package.path_prefix}requirements/{section}", pkg, constraint) 

def _replace_dep(recipe, path, pkg, constraint):
    (start_row, start_col, end_row, end_col) = recipe.get_raw_range(path)
    sub_text = "\n".join(recipe.meta_yaml[start_row:end_row])
    sub_text = re.sub(f'(?=\s*?)-\s+{pkg}\s*.*', f'- {pkg} {constraint}', sub_text)
    recipe.meta_yaml[start_row:end_row] = sub_text.split("\n")

def _add_dep(recipe, path, pkg, constraint):
    (_, start_col, end_row, _) = recipe.get_raw_range(path)
    recipe.meta_yaml.insert(end_row, " " * start_col + f"- {pkg} {constraint}")

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

    subdirs = [
        # "osx-arm64",
        # "osx-64",
        # "win-64",
        "linux-64",
        # "linux-aarch64",
        # "linux-ppc64le",
        # "linux-s390x",
    ]

    python = [
        # "3.8",
        # "3.9",
        "3.10",
        # "3.11",
    ]

    # load recipe
    others = {"r_implementation": "r-base"}
    rendered_recipes = recipe.render(args.recipe_path, subdirs, python, others, False, recipe.RendererType.RUAMEL)
    rendered_recipe = next(iter(rendered_recipes))

    # update pin and increment build number
    host_pkg = "openssl"
    host_ver = "{{ openssl }}"
    run_pkg = "openssl"
    run_ver = "3.*"
    for pkg_name, pkg in rendered_recipe.packages.items():
        update_dep(pkg, "host", host_pkg, host_ver)
        update_dep(pkg, "run", run_pkg, run_ver)
    increment_build_number(rendered_recipe)
    rendered_recipe.save()
