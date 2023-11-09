"""
File:           _renderer.py
Description:    Provides tools for rendering recipe files.
"""
from __future__ import annotations

import contextlib
import re
from enum import Enum
from pathlib import Path
from typing import Any, Final, Optional

import jinja2
import yaml

from percy.parser.recipe_parser import RecipeParser
from percy.render.exceptions import JinjaRenderFailure, YAMLRenderFailure

# TODO Future: re-evaluate. This project correctly identifies these dependencies as necessary. They should not need to
# be optionally included.
try:
    from ruamel.yaml import YAML
    from ruamel.yaml.parser import ParserError

    has_ruamel = True
except ModuleNotFoundError:
    has_ruamel = False
try:
    from conda_build import api
    from conda_build.config import Config

    has_conda_build = True
except ModuleNotFoundError:
    has_conda_build = False


class RendererType(Enum):
    PYYAML = 1
    RUAMEL = 2
    CONDA = 3
    PERCY = 4  # Custom parse-tree-based renderer, found in `recipe_parser.py`


if has_ruamel:
    # Ruamel configuration
    ruamel = YAML(typ="rt")
    ruamel.version = (1, 1)
    ruamel.allow_duplicate_keys = True
    ruamel.indent(mapping=2, sequence=2, offset=2)
    ruamel.preserve_quotes = True
    ruamel.allow_duplicate_keys = True
    ruamel.width = 1000
    ruamel.default_flow_style = False
    for digit in "0123456789":
        if digit in ruamel.resolver.versioned_resolver:
            del ruamel.resolver.versioned_resolver[digit]

# Pyyaml configuration
try:
    loader = yaml.CLoader  # pylint: disable=invalid-name
except Exception:  # pylint: disable=broad-exception-caught
    loader = yaml.Loader  # pylint: disable=invalid-name


@contextlib.contextmanager
def _stringify_numbers() -> None:
    """
    Ensure that numbers are not interpreted as ints or floats.  That trips up versions with trailing zeros.
    """
    implicit_resolver_backup = loader.yaml_implicit_resolvers.copy()
    for ch in list("0123456789"):
        if ch in loader.yaml_implicit_resolvers:
            del loader.yaml_implicit_resolvers[ch]
    yield
    for ch in list("0123456789"):
        if ch in implicit_resolver_backup:
            loader.yaml_implicit_resolvers[ch] = implicit_resolver_backup[ch]


# Jinja configuration
class _JinjaSilentUndefined(jinja2.Undefined):
    def _fail_with_undefined_error(self, *args, **kwargs):  # pylint: disable=unused-argument
        class EmptyString(str):
            def __call__(self, *args, **kwargs):
                return ""

        return EmptyString()

    __add__ = (
        __radd__
    ) = (
        __mul__
    ) = (
        __rmul__
    ) = (
        __div__
    ) = (
        __rdiv__
    ) = (
        __truediv__
    ) = (
        __rtruediv__
    ) = (
        __floordiv__
    ) = (
        __rfloordiv__
    ) = (
        __mod__
    ) = (
        __rmod__
    ) = (
        __pos__
    ) = (
        __neg__
    ) = (
        __call__
    ) = (
        __getitem__
    ) = (
        __lt__
    ) = __le__ = __gt__ = __ge__ = __int__ = __float__ = __complex__ = __pow__ = __rpow__ = _fail_with_undefined_error


_jinja_silent_undef = jinja2.Environment(undefined=_JinjaSilentUndefined)


# TODO Future: nearly identical to variants.py::_apply_selector
def apply_selector(data: str, selector_dict: dict[str, Any]) -> list[str]:
    """Apply selectors # [...]

    Args:
        data: Raw meta yaml string
        selector_dict: Selector configuration.

    Returns:
        meta yaml filtered based on selectors, as a list of string.
    """
    updated_data = []
    for line in data.splitlines():
        if (match := re.search(r"(\s*)[^#].*(#\s*\[([^\]]*)\].*)", line)) is not None:
            cond_str = match.group(3)
            try:
                # TODO Future: evaluate security risk
                if not eval(cond_str, None, selector_dict):  # pylint: disable=eval-used
                    line = f"{match.group(1)}"
                else:
                    line = line.replace(match.group(2), "")  # <-- comments sometimes causes trouble in jinja
            except Exception:  # pylint: disable=broad-exception-caught
                continue
        updated_data.append(line)
    return "\n".join(updated_data)


def _get_template(meta_yaml, selector_dict):
    """Create a Jinja2 template from the current raw recipe"""
    # This function exists because the template cannot be pickled.
    # Storing it means the recipe cannot be pickled, which in turn
    # means we cannot pass it to ProcessExecutors.
    meta_yaml_selectors_applied = apply_selector(meta_yaml, selector_dict)
    return _jinja_silent_undef.from_string(meta_yaml_selectors_applied)


def render(
    recipe_dir: Path | str,
    meta_yaml: str,
    selector_dict: dict[str, Any],
    renderer_type: Optional[RendererType] = None,
) -> dict[str, Any]:
    """
    Convert recipe text into data structure

    - create jinja template from recipe content
    - render template
    - parse yaml
    - normalize
    :param recipe_dir:      Directory that contains the target `meta.yaml` file.
    :param meta_yaml:       Raw YAML text string from the file.
    :param selector_dict:   Dictionary of selector statements
    :param renderer_type:   Rendering engine to target
    :return: Parsed YAML, as a dictionary of keys and values.
    """

    if not renderer_type:
        renderer_type = RendererType.PYYAML

    try:
        #: Variables to pass to Jinja when rendering recipe
        def expand_compiler(lang):
            compiler = selector_dict.get(f"{lang}_compiler", None)
            if not compiler:
                return compiler
            elif renderer_type == RendererType.RUAMEL:
                return f"compiler_{lang}"
            else:
                return f"{compiler}_{selector_dict.get('target_platform', 'win-64')}"

        jinja_vars: Final[dict[str, Any]] = {
            "unix": selector_dict.get("unix", False),
            "win": selector_dict.get("win", False),
            "PYTHON": selector_dict.get(
                "PYTHON",
                "%PYTHON%" if selector_dict.get("win", False) else "${PYTHON}",
            ),
            "py": int(selector_dict.get("py", "39")),
            "py3k": selector_dict.get("py3k", "0") == "1",
            "py2k": selector_dict.get("py3k", "0") == "0",
            "build_platform": selector_dict.get("target_platform", "win-64"),
            "target_platform": selector_dict.get("target_platform", "win-64"),
            "ctng_target_platform": selector_dict.get("target_platform", "win-64"),
            "cross_target_platform": selector_dict.get("target_platform", "win-64"),
            "ctng_gcc": selector_dict.get("c_compiler_version", "7.3.0"),
            "ctng_binutils": selector_dict.get("c_compiler_version", "2.35"),
            "numpy": selector_dict.get("numpy", "1.16"),
            "np": selector_dict.get("np", "116"),
            "pl": selector_dict.get("pl", "5"),
            "lua": selector_dict.get("lua", "5"),
            "luajit": selector_dict.get("lua", "5")[0] == "2",
            "linux64": selector_dict.get("linux-64", "0") == "1",
            "aarch64": selector_dict.get("aarch64", "0") == "1",
            "ppcle64": selector_dict.get("ppcle64", "0") == "1",
            "cran_mirror": "https://cloud.r-project.org",
            "compiler": expand_compiler,
            "pin_compatible": lambda x, max_pin=None, min_pin=None, lower_bound=None, upper_bound=None: f"{x} x",
            "pin_subpackage": lambda x, max_pin=None, min_pin=None, exact=False: f"{x} x",
            "cdt": lambda x: f"{x}-cos6-x86_64",
            "os.environ.get": lambda name, default="": "",
            "ccache": lambda name, method="": "ccache",
        }
        render_dict = {**jinja_vars, **selector_dict}
        yaml_text = _get_template(meta_yaml, selector_dict).render(render_dict)
    except jinja2.exceptions.TemplateSyntaxError as exc:
        raise JinjaRenderFailure(recipe_dir, message=exc.message, line=exc.lineno) from exc
    except jinja2.exceptions.TemplateError as exc:
        raise JinjaRenderFailure(recipe_dir, message=exc.message) from exc
    except TypeError as exc:
        raise JinjaRenderFailure(recipe_dir, message=str(exc)) from exc

    try:
        if renderer_type == RendererType.RUAMEL:
            if not has_ruamel:
                raise YAMLRenderFailure(recipe_dir, message="ruamel unavailable")
            # load yaml with ruamel
            return ruamel.load(yaml_text.replace("\t", " ").replace("%", " "))
        elif renderer_type == RendererType.PYYAML:
            # load yaml with pyyaml
            with _stringify_numbers():
                return yaml.load(
                    yaml_text.replace("\t", " ").replace("%", " "),
                    Loader=loader,
                )
        elif renderer_type == RendererType.CONDA:
            if not has_conda_build:
                raise YAMLRenderFailure(recipe_dir, message="conda build unavailable")
            platform, arch = selector_dict.get("subdir").split("-")
            rendered = api.render(
                recipe_dir,
                config=Config(
                    platform=platform,
                    arch=arch,
                ),
                variants=selector_dict,
            )
            return rendered[0][0].meta
        elif renderer_type == RendererType.PERCY:
            parser = RecipeParser(meta_yaml)
            return parser.render_to_object()
        else:
            raise YAMLRenderFailure(recipe_dir, message="Unknown renderer type.")
    except ParserError as exc:
        raise YAMLRenderFailure(recipe_dir, line=exc.problem_mark.line) from exc
