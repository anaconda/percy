"""
File:           dumper.py
Description:    Provides utilities to dump rendering results
"""

from __future__ import annotations

import sys
from typing import Final, TextIO

import yaml
from ruamel.yaml import YAML

from percy.render._renderer import RendererType
from percy.render.recipe import Recipe

# Ruamel configuration
ruamel = YAML(typ="rt")
ruamel.version = (1, 1)
ruamel.indent(mapping=2, sequence=4, offset=2)
ruamel.preserve_quotes = True
ruamel.allow_duplicate_keys = True
ruamel.width = 1000
ruamel.default_flow_style = False

# List of top-level recipe fields
FIELDS: Final[list[str]] = [
    "variant",
    "package",
    "source",
    "build",
    "requirements",
    "test",
    "app",
    "outputs",
    "about",
    "extra",
]


def _dump_render_results_ruamel(render_results: list[Recipe], out: TextIO = sys.stdout) -> None:
    """
    Dumps a list of rendered variants of a recipe.

    :param render_results: List of rendered variants.
    :param out: Output stream. Defaults to sys.stdout.
    """
    data_to_dump = []
    for render_result in render_results:
        render_dump = render_result.meta
        render_dump["variant"] = render_result.variant_id
        render_dump["renderer"] = str(render_result.renderer)
        for k, v in render_dump["variant"].items():
            render_dump["variant"][k] = list(v)
        data_to_dump.append(render_dump)
    ruamel.dump(data_to_dump, out)


def _dump_render_results_yaml(render_results: list[Recipe], out: TextIO = sys.stdout) -> None:
    """
    Dumps a list of rendered variants of a recipe.

    :param render_results: List of rendered variants.
    :param out: Output stream. Defaults to sys.stdout.
    """

    class _MetaYaml(dict):
        fields = FIELDS

        def to_omap(self):
            return [(field, self[field]) for field in _MetaYaml.fields if field in self]

    def _represent_omap(dumper, data):
        return dumper.represent_mapping("tag:yaml.org,2002:map", data.to_omap())

    yaml.add_representer(_MetaYaml, _represent_omap)

    class _IndentDumper(yaml.Dumper):
        def increase_indent(self, flow=False, indentless=False):  # pylint: disable=unused-argument
            return super().increase_indent(flow, False)

        def ignore_aliases(self, data):  # pylint: disable=unused-argument
            return True

    data_to_dump = []
    for render_result in render_results:
        render_dump = render_result.meta
        render_dump["variant"] = render_result.variant_id
        render_dump["renderer"] = str(render_result.renderer)
        for k, v in render_dump["variant"].items():
            render_dump["variant"][k] = list(v)
        data_to_dump.append(_MetaYaml(render_dump))
    yaml.dump(
        data_to_dump,
        out,
        Dumper=_IndentDumper,
        default_flow_style=False,
        indent=2,
    )


def dump_render_results(render_results: list, out: TextIO = sys.stdout) -> None:
    """
    Dumps a list of rendered variants of a recipe.

    :param render_results: list of rendered variants.
    :param out: Output stream. Defaults to sys.stdout.
    """
    if render_results and render_results[0].renderer == RendererType.RUAMEL:
        _dump_render_results_ruamel(render_results, out)
    elif render_results and render_results[0].renderer == RendererType.CRM:
        for render_result in render_results:
            print(render_result.crm.render())
    else:
        _dump_render_results_yaml(render_results, out)
