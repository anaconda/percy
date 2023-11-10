"""
File:           aggregate.py
Description:    CLI tool for performing operations against all of aggregate.
"""
from __future__ import annotations

import functools
import os
import sys
from itertools import groupby
from pathlib import Path
from typing import Any, Callable, Optional

import click
import yaml

import percy.render.aggregate
import percy.render.recipe
import percy.repodata.repodata
from percy.render._renderer import RendererType


def get_configured_aggregate(cmd_line: Optional[str | Path] = None) -> Path:
    """
    Determines the path of the aggregate repoistory
    :param cmd_line: (Optional) If specified, this is the path to a recipe file to operate on. If not specified, the
        recipe file is determined by the current working directory.
    """
    # command line has highest precedence
    if cmd_line:
        return Path(cmd_line)
    # environment variable
    path = os.getenv("ABS_AGGREGATE")
    if path:
        return path
    # look through ancestor directories
    cwd = Path(os.getcwd())
    path = cwd
    while path != path.parent:
        if (path / "manifest.yaml").exists() or (path / "make-mixed-crlf-patch.py").exists():
            return path
        path = path.parent
    # look in well known locations
    if (cwd / "aggregate" / ".git").exists():
        return cwd / "aggregate"
    return cwd


def load_aggregate(
    obj: Any, subdir: str, python: str, others: dict[str, str], renderer: RendererType
) -> percy.render.aggregate.Aggregate:
    """
    Reads aggregate from disk and constructs an object.
    :param obj: User object, provided by Click
    :param subdir: Target architecture
    :param python: Target Python version
    :param others: Additional key-value pairs to use
    :param renderer: Rendering engine to use for parsing YAML
    :returns: The aggregate repository, represented as a class instance
    """
    print(f"Renderer in use: {renderer.name}")
    aggregate_path = obj["aggregate_directory"]
    aggregate_repo = percy.render.aggregate.Aggregate(aggregate_path)
    if not others:
        others = {}
        if subdir.startswith("win-"):
            others["rust_compiler"] = "rust"
    others["r_implementation"] = "r-base"
    aggregate_repo.load_local_feedstocks(subdir, python, others, renderer)
    return aggregate_repo


def print_build_order(buildout: dict[str, percy.render.aggregate.Feedstock]) -> None:
    """
    Prints the build order
    :param buildout: Dictionary representing the build ordering
    """
    stages = [list(result) for key, result in groupby(buildout, key=lambda f: f.weight)]
    for i, stage in enumerate(stages):
        for feedstock in stage:
            print(f"{i:03} {feedstock.name:30} {list(feedstock.packages.keys())}")


def sanitize_renderer_enum(_0, _1, value: str) -> RendererType:  # pylint: disable=invalid-name
    """
    Takes the renderer type as a user provided string and converts it to the
    enum form.
    :param value: User-provided string to parse
    :returns: Enumerated version o the parser
    """
    # Access should be safe as `click` handles the input limitations for us.
    return RendererType[value.upper()]


def base_options(f: Callable):
    """
    Base options/flags supported by this command
    :param f: Function callback
    """

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
    @click.option(
        "--renderer",
        "-r",
        callback=sanitize_renderer_enum,
        type=click.Choice(
            [e.name for e in RendererType],
            case_sensitive=False,
        ),
        default="PYYAML",
        help="Select which rendering engine to use",
    )
    @functools.wraps(f)
    def wrapper_base_options(*args, **kwargs):
        return f(*args, **kwargs)

    return wrapper_base_options


def order_options(f: Callable):
    """
    Ordering options/flags supported by this command
    :param f: Function callback
    """

    @click.option(
        "--groups",
        "-g",
        type=str,
        multiple=True,
        default=[],
        help="List of groups",
    )
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
        is_flag=True,
        show_default=True,
        default=False,
        multiple=False,
        help="Drop noarch",
    )
    @click.option(
        "--sections",
        type=str,
        multiple=True,
        default=["build", "host", "run"],
        help='Sections to consider [default: ["build", "host", "run"]]',
    )
    @functools.wraps(f)
    def wrapper_order_options(*args, **kwargs):
        return f(*args, **kwargs)

    return wrapper_order_options


@click.group(short_help="Commands for operating on aggregates.")
@click.option(
    "--aggregate",
    "-a",
    metavar="DIRECTORY",
    help="Aggregate directory to operate on.",
)
@click.pass_context
def aggregate(ctx, aggregate):  # pylint: disable=redefined-outer-name
    """
    Commands that operate on aggregates.

    An aggregate is a collection of recipes.

    The aggregate directory is configured from (in order of precedence):

    \b
    1. --aggregate command line option if present
    2. ABS_AGGREGATE env variable if set
    3. The current directory (or an ancestor of it)
    """
    ctx.ensure_object(dict)
    aggregate_path = get_configured_aggregate(aggregate)
    print(aggregate_path)
    ctx.obj["aggregate_directory"] = aggregate_path


@aggregate.command(short_help="Print downstream build order")
@click.pass_obj
@base_options
@order_options
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
    renderer,
    groups,
    feedstocks,
    packages,
    allow_list,
    block_list,
    drop_noarch,
    sections,
):
    """
    Prints build order of feedstock downstream dependencies
    """

    # load aggregate
    aggregate_repo = load_aggregate(obj, subdir, python, others, renderer)

    # get feedstock build order
    buildout = aggregate_repo.get_depends_build_order(
        groups, feedstocks, packages, allow_list, block_list, drop_noarch, sections
    )

    # print build order
    ordering = " ".join(
        [
            f"groups:{groups}",
            f"feedstocks:{feedstocks}",
            f"packages:{packages}",
            f"allow_list:{allow_list}",
            f"block_list:{block_list}",
            f"drop_noarch:{drop_noarch}",
            f"sections:{sections}",
        ]
    )
    print(f"\n\nDownstream build order ({ordering}):")
    print_build_order(buildout)


@aggregate.command(short_help="Print upstream build order")
@click.pass_obj
@base_options
@order_options
def upstream(
    obj,
    subdir,
    python,
    others,
    renderer,
    groups,
    feedstocks,
    packages,
    drop_noarch,
    sections,  # pylint: disable=unused-argument
):
    """
    Prints build order of feedstock upstream dependencies
    """

    # load aggregate
    aggregate_repo = load_aggregate(obj, subdir, python, others, renderer)

    # get feedstock build order
    buildout = aggregate_repo.get_build_order(groups, feedstocks, packages, drop_noarch, ())

    # print build order
    ordering = " ".join(
        [
            f"groups:{groups}",
            f"feedstocks:{feedstocks}",
            f"packages:{packages}",
            f"drop_noarch:{drop_noarch}",
            f"sections:{()}",
        ]
    )
    print(f"\n\nUpstream build order ({ordering}):")
    print_build_order(buildout)


@aggregate.command(short_help="Print build order")
@click.pass_obj
@base_options
@order_options
def order(
    obj,
    subdir,
    python,
    others,
    renderer,
    groups,
    feedstocks,
    packages,
    drop_noarch,
    sections,
):
    """
    Prints build order of specified feedstocks
    """

    # load aggregate
    aggregate_repo = load_aggregate(obj, subdir, python, others, renderer)

    # get feedstock build order
    if not groups and not feedstocks and not packages:
        feedstocks = aggregate_repo.feedstocks.keys()
    buildout = aggregate_repo.get_build_order(groups, feedstocks, packages, drop_noarch, sections)

    # print build order
    ordering = " ".join(
        [
            f"groups:{groups}",
            f"feedstocks:{feedstocks}",
            f"packages:{packages}",
            f"drop_noarch:{drop_noarch}",
            f"sections:{sections}",
        ]
    )
    print(f"\n\nBuild order ({ordering})):")
    print_build_order(buildout)


@aggregate.command(short_help="Print outdated with defaults")
@click.pass_obj
@base_options
@click.option(
    "--missing_local",
    type=bool,
    is_flag=True,
    show_default=True,
    default=False,
    multiple=False,
    help="Identify packages from defaults not pinned on aggregate.",
)
@click.option(
    "--missing_defaults",
    type=bool,
    is_flag=True,
    show_default=True,
    default=False,
    multiple=False,
    help="Identify packages from aggregate not on defaults",
)
def outdated(obj, subdir, python, others, renderer, missing_local, missing_defaults):
    """
    Prints outdated with defaults
    """

    results = {}

    # load aggregate
    aggregate_repo = load_aggregate(obj, subdir, python, others, renderer)

    # load defaults
    defaults_pkgs = percy.repodata.repodata.get_latest_package_list(subdir, True)

    # compare aggregate with defaults
    for local_name, package in aggregate_repo.packages.items():
        result = percy.repodata.repodata.compare_package_with_defaults(package, defaults_pkgs)
        if result:
            results[local_name] = result

    # find missing from local
    if missing_local:
        for name in defaults_pkgs.keys() - aggregate_repo.packages.keys():
            results[name] = {
                "local_feedstock": None,
                "local_version": None,
                "local_build_number": None,
                "defaults_version": defaults_pkgs[name]["version"],
                "defaults_build_number": int(defaults_pkgs[name]["build_number"]),
            }

    # find missing from defaults
    if missing_defaults:
        for name in aggregate_repo.packages.keys() - defaults_pkgs.keys():
            package = aggregate_repo.packages[name]
            results[name] = {
                "local_feedstock": package.git_info.name,
                "local_version": package.version,
                "local_build_number": int(package.number),
                "defaults_version": None,
                "defaults_build_number": None,
            }

    # dump result
    def noop(self, *args, **kw):  # pylint: disable=unused-argument
        pass

    yaml.emitter.Emitter.process_tag = noop
    yaml.dump(
        results,
        sys.stdout,
        default_flow_style=False,
        indent=2,
    )
