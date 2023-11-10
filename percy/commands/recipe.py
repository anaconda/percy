"""
File:           recipe.py
Description:    CLI for interacting with recipe files.
"""
from __future__ import annotations

import functools
import json
import os
from pathlib import Path
from typing import Callable, Optional

import click

import percy.commands.aggregate
import percy.render.recipe
from percy.render._renderer import RendererType

# pylint: disable=line-too-long


def get_recipe(cmd_line: Optional[str | Path] = None) -> Path:
    """
    Determine the path to the target recipe file
    :param cmd_line: (Optional) If specified, this is the path to a recipe file to operate on. If not specified, the
        recipe file is determined by the current working directory.
    :returns: Path to the recipe file of interest
    """
    # command line has highest precedence
    if cmd_line:
        return Path(cmd_line)
    # look through current directory
    path = Path(os.getcwd()) / "recipe" / "meta.yaml"
    if path.is_file():
        return path
    else:
        path_old_style = Path(os.getcwd()) / "meta.yaml"
        if path_old_style.is_file():
            return path_old_style
    return path


def base_options(f: Callable):
    """
    Base options/flags supported by this command
    :param f: Function callback
    """

    @click.option(
        "--backend",
        "-b",
        callback=percy.commands.aggregate.sanitize_renderer_enum,
        type=click.Choice(
            [e.name for e in RendererType],
            case_sensitive=False,
        ),
        default="PYYAML",
        help="Renderer backend. Defaults to pyyaml.",
    )
    @click.option(
        "--subdir",
        "-s",
        type=str,
        multiple=True,
        default=[
            "linux-64",
            "linux-aarch64",
            "linux-ppc64le",
            "linux-s390x",
            "osx-arm64",
            "osx-64",
            "win-64",
        ],
        help="Architecture. E.g. -s linux-64 -s win-64",
    )
    @click.option(
        "--python",
        "-p",
        type=str,
        multiple=True,
        help="Python version. E.g. -p 3.9 -p 3.10",
    )
    @click.option(
        "--others",
        "-k",
        type=(str, str),
        multiple=True,
        default={},
        help="Additional key values (e.g. -k blas_impl openblas)",
    )
    @functools.wraps(f)
    def wrapper_base_options(*args, **kwargs):
        return f(*args, **kwargs)

    return wrapper_base_options


@click.group(short_help="Commands for operating on a recipe.")
@click.option("--recipe", "-r", metavar="FILE", help="Recipe meta.yaml to operate on.")
@click.pass_context
def recipe(ctx, recipe: str):  # pylint: disable=redefined-outer-name
    """
    Commands that operate on a recipe.
    """
    ctx.ensure_object(dict)
    ctx.obj["recipe_path"] = Path(get_recipe(recipe))


@recipe.command(short_help="Render a recipe")
@click.pass_obj
@base_options
def render(obj, subdir, python, others, backend):
    """
    Render a recipe.
    """

    # render recipe
    recipe_path = obj["recipe_path"]
    render_results = percy.render.recipe.render(
        recipe_path,
        subdir,
        python,
        dict(others),
        False,
        backend,
    )

    # dump recipe
    percy.render.recipe.dump_render_results(render_results)


@recipe.command(short_help="Check if a recipe is outdated compare to main.")
@click.pass_obj
@base_options
def outdated(obj, subdir, python, others, backend):
    """
    Render a recipe.
    """

    # render recipe
    recipe_path = obj["recipe_path"]
    render_results = percy.render.recipe.render(
        recipe_path,
        subdir,
        python,
        dict(others),
        False,
        backend,
    )

    # load defaults
    print(f"Checking outdated for subdir { subdir[0] }")
    defaults_pkgs = percy.repodata.repodata.get_latest_package_list(subdir[0], True)

    # compare package with defaults
    for rendered_recipe in render_results:
        if subdir[0] in rendered_recipe.variant_id["subdir"]:
            for name, package in rendered_recipe.packages.items():
                result = percy.repodata.repodata.compare_package_with_defaults(package, defaults_pkgs)
                if not result:
                    print("OK")
                else:
                    print(f"Outdated: {name} {result}")


@recipe.command(short_help="Patch a recipe")
@click.pass_obj
@base_options
@click.option(
    "--increment_build_number",
    type=bool,
    is_flag=True,
    show_default=True,
    default=False,
    multiple=False,
    help="Increment build number",
)
@click.option(
    "--parse_tree",
    type=bool,
    is_flag=True,
    show_default=True,
    default=False,
    multiple=False,
    help="Uses the parse tree patching system over the original implementation.",
)
@click.argument("patch_file", metavar="FILE")
def patch(obj, subdir, python, others, backend, increment_build_number: bool, parse_tree: bool, patch_file):
    """
    Patch a recipe. Takes a patch file as input, with content like:

    \b
    [
        {"op":"remove","path":"@output/build/noarch"},
        {"op":"add","path":"@output/build/skip","value":["True  # [py<37]"]},
        {"op":"replace","path":"@output/build/script","match":"pip install(?!=.*--no-build-isolation).*","value":["pip install . --no-deps --no-build-isolation --ignore-installed --no-cache-dir -vvv"]},
        {"op":"replace","path":"@output/requirements/host","match":"cython( 0.29.[^\\s]+)?","value":["cython 0.29"]},
        {"op":"replace","path":"@output/requirements/host","match":"numpy( .*)?","value":["numpy {{numpy}}"]},
        {"op":"replace","path":"@output/requirements/run","match":"numpy( .*)?","value":["{{ pin_compatible('numpy') }}"]},
        {"op":"add","path":"@output/requirements/host","match":"python","value":["python"]},
        {"op":"add","path":"@output/requirements/run","match":"python","value":["python"]},
        {"op":"add","path":"@output/requirements/host","match":"setuptools","value":["setuptools"]},
        {"op":"add","path":"@output/requirements/host","match":"wheel","value":["wheel"]},
        {"op":"add","path":"@output/test/requires","match":"pip","value":["pip"]},
        {"op":"add","path":"@output/test/commands","match":"pip check","value":["pip check"]}
    ]
    """

    # render recipe
    recipe_path = obj["recipe_path"]
    op_mode = percy.render.recipe.OpMode.CLASSIC
    recipe: percy.render.recipe.Recipe  # pylint: disable=redefined-outer-name
    # Enables parse-tree mode
    if parse_tree:
        backend = RendererType.PERCY
        op_mode = percy.render.recipe.OpMode.PARSE_TREE
        recipe = percy.render.recipe.Recipe.from_file(
            recipe_path,
            renderer=backend,
        )
    # Default operation
    else:
        render_results = percy.render.recipe.render(
            recipe_path,
            subdir,
            python,
            dict(others),
            False,
            backend,
        )
        recipe = next(iter(render_results))

    # patch recipe
    with open(patch_file, encoding="utf-8") as p:
        recipe.patch(json.load(p), increment_build_number, op_mode=op_mode)
    print("Done")
