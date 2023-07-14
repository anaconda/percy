# ruff: noqa: E501

from pathlib import Path
import click
import os
import functools
import json
import percy.render.recipe


def get_recipe(cmd_line=None):
    # command line has highest precedence
    if cmd_line:
        return cmd_line
    # look through current directory
    path = Path(os.getcwd()) / "recipe" / "meta.yaml"
    if path.is_file():
        return path
    else:
        path_old_style = Path(os.getcwd()) / "meta.yaml"
        if path_old_style.is_file():
            return path_old_style
    return path


def base_options(f):
    @click.option(
        "--backend",
        "-b",
        type=click.Choice(["PYYAML", "RUAMEL", "CONDA"], case_sensitive=False),
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
def recipe(ctx, recipe):
    """Commands that operate on a recipe."""
    ctx.ensure_object(dict)
    ctx.obj["recipe_path"] = Path(get_recipe(recipe))


@recipe.command(short_help="Render a recipe")
@click.pass_obj
@base_options
def render(obj, subdir, python, others, backend):
    """Render a recipe."""

    # render recipe
    recipe_path = obj["recipe_path"]
    render_results = percy.render.recipe.render(
        recipe_path,
        subdir,
        python,
        dict(others),
        False,
        percy.render.recipe.RendererType[backend],
    )

    # dump recipe
    percy.render.recipe.dump_render_results(render_results)


@recipe.command(short_help="Check if a recipe is outdated compare to main.")
@click.pass_obj
@base_options
def outdated(obj, subdir, python, others, backend):
    """Render a recipe."""

    # render recipe
    recipe_path = obj["recipe_path"]
    render_results = percy.render.recipe.render(
        recipe_path,
        subdir,
        python,
        dict(others),
        False,
        percy.render.recipe.RendererType[backend],
    )

    # load defaults
    print(f"Checking outdated for subdir { subdir[0] }")
    defaults_pkgs = percy.repodata.repodata.get_latest_package_list(subdir[0], True)

    # compare package with defaults
    for recipe in render_results:
        if subdir[0] in recipe.variant_id["subdir"]:
            for name, package in recipe.packages.items():
                result = percy.repodata.repodata.compare_package_with_defaults(
                    package, defaults_pkgs
                )
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
@click.argument("patch_file", metavar="FILE")
def patch(obj, subdir, python, others, backend, increment_build_number, patch_file):
    """Patch a recipe. Takes a patch file as input, with content like:

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
    render_results = percy.render.recipe.render(
        recipe_path,
        subdir,
        python,
        dict(others),
        False,
        percy.render.recipe.RendererType.RUAMEL,
    )

    # patch recipe
    recipe = next(iter(render_results))
    with open(patch_file) as p:
        recipe.patch(json.load(p), increment_build_number)
    print("Done")
