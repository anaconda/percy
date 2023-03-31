from pathlib import Path
import click
import os
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


@click.group(short_help="Commands for operating on a recipe.")
@click.option("--recipe", "-r", metavar="FILE", help="Recipe meta.yaml to operate on.")
@click.pass_context
def recipe(ctx, recipe):
    """Commands that operate on a recipe."""
    ctx.ensure_object(dict)
    ctx.obj["recipe_path"] = Path(get_recipe(recipe))


@recipe.command(short_help="Render a recipe")
@click.pass_obj
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
def render(obj, subdir, python, others):
    """Render a recipe."""

    recipe_path = obj["recipe_path"]
    render_results = percy.render.recipe.render(
        recipe_path, subdir, python, dict(others)
    )
    percy.render.recipe.dump_render_results(render_results)
