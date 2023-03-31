from pathlib import Path
import click
import os
import functools
from itertools import groupby
import percy.render.aggregate


def get_configured_aggregate(cmd_line=None):
    # command line has highest precedence
    if cmd_line:
        return cmd_line
    # environment variable
    path = os.getenv("ABS_AGGREGATE")
    if path:
        return path
    # look through ancestor directories
    cwd = Path(os.getcwd())
    path = cwd
    while path != path.parent:
        if (path / "manifest.yaml").exists() or (
            path / "make-mixed-crlf-patch.py"
        ).exists():
            return path
        path = path.parent
    # look in well known locations
    if (cwd / "aggregate" / ".git").exists():
        return cwd / "aggregate"
    return cwd


def print_build_order(buildout):
    stages = [list(result) for key, result in groupby(buildout, key=lambda f: f.weight)]
    for i, stage in enumerate(stages):
        for feedstock in stage:
            print(f"{i:03} {feedstock.name:30} {list(feedstock.packages.keys())}")


def base_options(f):
    @click.option(
        "--subdir",
        "-s",
        type=str,
        multiple=False,
        default="linux-64",
        help="Architecture. E.g. -s linux-64",
    )
    @click.option(
        "--python",
        "-p",
        type=str,
        multiple=False,
        default="3.10",
        help="Python version. E.g. -p 3.10",
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


def common_options(f):
    @click.option(
        "--feedstocks",
        "-f",
        type=str,
        multiple=True,
        default=[],
        help="List of feedstocks",
    )
    @click.option(
        "--packages",
        "-pkg",
        type=str,
        multiple=True,
        default=[],
        help="List of packages",
    )
    @click.option(
        "--drop_noarch",
        type=bool,
        multiple=False,
        default=False,
        help="Drop noarch",
    )
    @functools.wraps(f)
    def wrapper_common_options(*args, **kwargs):
        return f(*args, **kwargs)

    return wrapper_common_options


@click.group(short_help="Commands for operating on aggregates.")
@click.option(
    "--aggregate", "-a", metavar="DIRECTORY", help="Aggregate directory to operate on."
)
@click.pass_context
def aggregate(ctx, aggregate):
    """Commands that operate on aggregates.

    An aggregate is a collection of recipes.

    The aggregate directory is configured from (in order of precedence):

    \b
    1. --aggregate command line option if present
    2. ABS_AGGREGATE env variable if set
    3. The current directory (or an ancestor of it)
    """
    ctx.ensure_object(dict)
    print(Path(get_configured_aggregate(aggregate)))
    ctx.obj["aggregate_directory"] = Path(get_configured_aggregate(aggregate))


@aggregate.command(short_help="Print downstream build order")
@click.pass_obj
@base_options
@common_options
@click.option(
    "--allow_list",
    type=str,
    multiple=True,
    default=[],
    help="List of packages",
)
@click.option(
    "--block_list",
    type=str,
    multiple=True,
    default=[],
    help="List of feedstocks",
)
def downstream(
    obj,
    subdir,
    python,
    others,
    feedstocks,
    packages,
    allow_list,
    block_list,
    drop_noarch,
):
    """Prints build order of feedstock downstream dependencies"""

    # load aggregate
    aggregate_path = obj["aggregate_directory"]
    aggregate_repo = percy.render.aggregate.Aggregate(aggregate_path)
    others = {"r_implementation": "r-base", "blas_impl": "mkl"}
    if subdir.startswith("win-"):
        others["rust_compiler"] = "rust"
        aggregate_repo.load_local_feedstocks(subdir, python, others)
    else:
        aggregate_repo.load_local_feedstocks(subdir, python, others)

    # get feedstock build order
    buildout = aggregate_repo.get_depends_build_order(
        feedstocks, packages, allow_list, block_list, drop_noarch
    )

    # print build order
    print(
        f"\n\nDownstream build order (feedstocks:{feedstocks} packages:{packages} allow_list:{allow_list} block_list:{block_list} drop_noarch:{drop_noarch}):"
    )
    print_build_order(buildout)


@aggregate.command(short_help="Print upstream build order")
@click.pass_obj
@base_options
@common_options
def upstream(obj, subdir, python, others, feedstocks, packages, drop_noarch):
    """Prints build order of feedstock upstream dependencies"""

    # load aggregate
    aggregate_path = obj["aggregate_directory"]
    aggregate_repo = percy.render.aggregate.Aggregate(aggregate_path)
    others = {"r_implementation": "r-base", "blas_impl": "mkl"}
    if subdir.startswith("win-"):
        others["rust_compiler"] = "rust"
        aggregate_repo.load_local_feedstocks(subdir, python, others)
    else:
        aggregate_repo.load_local_feedstocks(subdir, python, others)

    # get feedstock build order
    buildout = aggregate_repo.get_build_order(feedstocks, packages, drop_noarch, False)

    # print build order
    print(
        f"\n\nUpstream build order (feedstocks:{feedstocks} packages:{packages} drop_noarch:{drop_noarch})):"
    )
    print_build_order(buildout)


@aggregate.command(short_help="Print build order")
@click.pass_obj
@base_options
@common_options
def order(obj, subdir, python, others, feedstocks, packages, drop_noarch):
    """Prints build order of specified feedstocks"""

    # load aggregate
    aggregate_path = obj["aggregate_directory"]
    aggregate_repo = percy.render.aggregate.Aggregate(aggregate_path)
    others = {"r_implementation": "r-base", "blas_impl": "mkl"}
    if subdir.startswith("win-"):
        others["rust_compiler"] = "rust"
        aggregate_repo.load_local_feedstocks(subdir, python, others)
    else:
        aggregate_repo.load_local_feedstocks(subdir, python, others)

    # get feedstock build order
    buildout = aggregate_repo.get_build_order(feedstocks, packages, drop_noarch, True)

    # print build order
    print(
        f"\n\nBuild order (feedstocks:{feedstocks} packages:{packages} drop_noarch:{drop_noarch})):"
    )
    print_build_order(buildout)
