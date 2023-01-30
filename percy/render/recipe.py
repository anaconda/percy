"""
Recipe renderer. 
Not as accurate as conda-build render, but faster and architecture independent.
"""

import sys
import re
from copy import deepcopy
from typing import Any, Dict, List, Set
from pathlib import Path
from dataclasses import dataclass, field
import jinja2
import argparse
import contextlib
import yaml

from percy.render.variants import read_conda_build_config

try:
    loader = yaml.CLoader
except:
    loader = yaml.Loader


@contextlib.contextmanager
def stringify_numbers():
    # ensure that numbers are not interpreted as ints or floats.  That trips up versions
    #     with trailing zeros.
    implicit_resolver_backup = loader.yaml_implicit_resolvers.copy()
    for ch in list("0123456789"):
        if ch in loader.yaml_implicit_resolvers:
            del loader.yaml_implicit_resolvers[ch]
    yield
    for ch in list("0123456789"):
        if ch in implicit_resolver_backup:
            loader.yaml_implicit_resolvers[ch] = implicit_resolver_backup[ch]


class JinjaSilentUndefined(jinja2.Undefined):
    def _fail_with_undefined_error(self, *args, **kwargs):
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
    ) = (
        __le__
    ) = (
        __gt__
    ) = (
        __ge__
    ) = (
        __int__
    ) = __float__ = __complex__ = __pow__ = __rpow__ = _fail_with_undefined_error


jinja = jinja2.Environment(
    trim_blocks=True,
    lstrip_blocks=True,
)
jinja_silent_undef = jinja2.Environment(undefined=JinjaSilentUndefined)


class RecipeError(Exception):
    def __init__(self, item, message=None, line=None, column=None):
        self.line = line
        self.column = column
        if message is not None:
            if line is not None:
                if column is not None:
                    message += " (at line %i / column %i)" % (line, column)
                else:
                    message += " (at line %i)" % line
            super().__init__(item, message)
        else:
            super().__init__(item)


class DuplicateKey(RecipeError):
    """Raised for recipes with duplicate keys in the meta.yaml. YAML
    does not allow those, but the PyYAML parser silently overwrites
    previous keys.

    For duplicate keys that are a result of ``# [osx]`` style line selectors,
    `Recipe` attempts to resolve them as a list of dictionaries instead.
    """

    template = "has duplicate key"


class MissingKey(RecipeError):
    """Raised if a recipe is missing package/version or package/name"""

    template = "has missing key"


class EmptyRecipe(RecipeError):
    """Raised if the recipe file is empty"""

    template = "is empty"


class MissingMetaYaml(RecipeError):
    """Raised when FileNotFoundError is encountered

    self.item is NOT a Recipe but a str here
    """

    template = "has missing file `meta.yaml`"


class JinjaRenderFailure(RecipeError):
    """Raised on Jinja rendering problems

    May have self.line
    """

    template = "failed to render in Jinja2. Error was: %s"


class YAMLRenderFailure(RecipeError):
    """Raised on YAML parsing problems

    May have self.line
    """

    template = "failed to load YAML. Error was: %s"


class Recipe:
    """Represents a recipe (meta.yaml) in editable form

    Using conda-build to render recipe is slow and a one-way
    process. We need to be able to load **and** save recipes, which is
    handled by the representation in this class.

    Recipes undergo two manipulation rounds before parsed as YAML:
     1. Selecting lines using ``# [expression]``
     2. Rendering as Jinja2 template

    Arguments:
      recipe_dir: path to specific recipe
    """

    def __init__(self, recipe_file, variant_id, variant):
        #: recipe dir
        if recipe_file:
            self.recipe_file = recipe_file
            self.recipe_dir = recipe_file.parent
        else:
            self.recipe_file = ""
            self.recipe_dir = ""

        #: Selectors configuration
        self.variant_id = variant_id
        self.selector_dict: Dict[str, Any] = variant

        # Filled in by render()
        #: Parsed recipe YAML
        self.meta: Dict[str, Any] = {}
        self.skip = False
        self.packages: Dict[str:Package] = dict()

        # These will be filled in by load_from_string()
        #: Lines of the raw recipe file
        self.meta_yaml: List[str] = []
        #: Original recipe before modifications (updated by load_from_string)
        self.orig: Recipe = deepcopy(self)

    @property
    def path(self):
        """Full path to ``meta.yaml``"""
        return self.recipe_file

    @property
    def dir(self):
        """Path to recipe folder"""
        return self.recipe_dir

    def __str__(self) -> str:
        return str(self.recipe_dir)

    def __repr__(self) -> str:
        return f'{self.__class__.__name__} "{self.recipe_dir}"'

    def load_from_string(self, data) -> "Recipe":
        """Load and `render` recipe contents from disk"""
        self.meta_yaml = data
        if not self.meta_yaml:
            raise EmptyRecipe(self)
        self.render()
        return self

    @classmethod
    def from_string(
        cls,
        recipe_text,
        variant_id,
        variant,
        return_exceptions=False,
    ) -> "Recipe":
        """Create new `Recipe` object from string"""
        try:
            recipe = cls("", variant_id, variant)
            recipe.load_from_string(recipe_text)
        except Exception as exc:
            if return_exceptions:
                return exc
            raise exc
        recipe.set_original()
        return recipe

    @classmethod
    def from_file(
        cls,
        recipe_fname,
        variant_id,
        variant,
        return_exceptions=False,
    ) -> "Recipe":
        """Create new `Recipe` object from file

        Args:
           recipe_fname: Relative path to recipe (folder or meta.yaml)
        """
        recipe_fname = Path(recipe_fname)
        recipe = cls(recipe_fname, variant_id, variant)
        try:
            if recipe_fname.is_file():
                with open(recipe_fname) as text:
                    recipe.load_from_string(text.read())
        except FileNotFoundError:
            exc = MissingMetaYaml(recipe_fname)
            if return_exceptions:
                return exc
            raise exc
        except Exception as exc:
            if return_exceptions:
                return exc
            raise exc
        recipe.set_original()
        return recipe

    def save(self):
        with open(self.path, "w", encoding="utf-8") as fdes:
            fdes.write(self.dump())

    def set_original(self) -> None:
        """Store the current state of the recipe as "original" version"""
        self.orig = deepcopy(self)

    def is_modified(self) -> bool:
        return self.meta_yaml != self.orig.meta_yaml

    def dump(self):
        """Dump recipe content"""
        return "\n".join(self.meta_yaml) + "\n"

    def apply_selector(self, data, selector_dict):
        """Apply selectors # [...]"""
        updated_data = []
        for line in data.splitlines():
            if (match := re.search(r"^(\s*)#.*$", line)) is not None:
                line = f"{match.group(1)}# comment "  # <-- this is to ignore potential bad jinja in comments
            elif (
                match := re.search(r"(\s*)[^#].*(#\s*\[([^\]]*)\].*)", line)
            ) is not None:
                cond_str = match.group(3)
                try:
                    if not eval(cond_str, None, selector_dict):
                        line = f"{match.group(1)}"
                    else:
                        line = line.replace(
                            match.group(2), ""
                        )  # <-- comments sometimes causes trouble in jinja
                except Exception:
                    # todo: load selector with cbc content
                    continue
            updated_data.append(line)
        return updated_data

    def get_template(self):
        """Create a Jinja2 template from the current raw recipe"""
        # This function exists because the template cannot be pickled.
        # Storing it means the recipe cannot be pickled, which in turn
        # means we cannot pass it to ProcessExecutors.
        try:
            meta_yaml_selectors_applied = self.apply_selector(
                self.meta_yaml, self.selector_dict
            )
            return jinja_silent_undef.from_string(
                "\n".join(meta_yaml_selectors_applied)
            )
        except jinja2.exceptions.TemplateSyntaxError as exc:
            raise JinjaRenderFailure(self, message=exc.message, line=exc.lineno)
        except jinja2.exceptions.TemplateError as exc:
            raise JinjaRenderFailure(self, message=exc.message)

    def render(self) -> None:
        """Convert recipe text into data structure

        - create jinja template from recipe content
        - render template
        - parse yaml
        - normalize
        """
        try:
            #: Variables to pass to Jinja when rendering recipe
            def expand_compiler(lang):
                compiler = self.selector_dict.get(f"{lang}_compiler", None)
                if not compiler:
                    return compiler
                else:
                    return f"{compiler}_{self.selector_dict.get('target_platform', 'win-64')}"

            JINJA_VARS = {
                "unix": self.selector_dict.get("unix", False),
                "win": self.selector_dict.get("win", False),
                "PYTHON": self.selector_dict.get(
                    "PYTHON",
                    "%PYTHON%" if self.selector_dict.get("win", False) else "${PYTHON}",
                ),
                "py": int(self.selector_dict.get("py", "39")),
                "py3k": self.selector_dict.get("py3k", "0") == "1",
                "py2k": self.selector_dict.get("py3k", "0") == "0",
                "build_platform": self.selector_dict.get("target_platform", "win-64"),
                "target_platform": self.selector_dict.get("target_platform", "win-64"),
                "ctng_target_platform": self.selector_dict.get(
                    "target_platform", "win-64"
                ),
                "cross_target_platform": self.selector_dict.get(
                    "target_platform", "win-64"
                ),
                "ctng_gcc": self.selector_dict.get("c_compiler_version", "7.3.0"),
                "ctng_binutils": self.selector_dict.get("c_compiler_version", "2.35"),
                "numpy": self.selector_dict.get("numpy", "1.16"),
                "np": self.selector_dict.get("np", "116"),
                "pl": self.selector_dict.get("pl", "5"),
                "lua": self.selector_dict.get("lua", "5"),
                "luajit": self.selector_dict.get("lua", "5")[0] == "2",
                "linux64": self.selector_dict.get("linux-64", "0") == "1",
                "aarch64": self.selector_dict.get("aarch64", "0") == "1",
                "ppcle64": self.selector_dict.get("ppcle64", "0") == "1",
                "cran_mirror": "https://cloud.r-project.org",
                "compiler": expand_compiler,
                "pin_compatible": lambda x, max_pin=None, min_pin=None, lower_bound=None, upper_bound=None: f"{x}",
                "pin_subpackage": lambda x, max_pin=None, min_pin=None, exact=False: f"{x}",
                "cdt": lambda x: f"{x}-cos6-x86_64",
                "os.environ.get": lambda name, default="": "",
                "ccache": lambda name, method="": "ccache",
            }
            yaml_text = self.get_template().render(JINJA_VARS)
        except jinja2.exceptions.TemplateSyntaxError as exc:
            raise JinjaRenderFailure(self, message=exc.message, line=exc.lineno)
        except jinja2.exceptions.TemplateError as exc:
            raise JinjaRenderFailure(self, message=exc.message)
        except TypeError as exc:
            raise JinjaRenderFailure(self, message=str(exc))

        try:
            # load yaml
            with stringify_numbers():
                self.meta = yaml.load(
                    yaml_text.replace("\t", " ").replace("%", " "), Loader=loader
                )

            # should this be skipped?
            bld = self.meta.get("build", {})
            if bld and bld.get("skip", False):
                self.skip = True

            # extract package info
            if not self.skip:
                self.render_packages()
        except yaml.error.YAMLError as exc:
            if hasattr(exc, "problem_mark"):
                raise YAMLRenderFailure(
                    self,
                    f"{str(exc.problem)} {str(exc.context)}",
                    line=exc.problem_mark.line,
                )
            else:
                raise YAMLRenderFailure(self, f"{str(exc.problem)}")

    def render_packages(self):

        # read main package deps
        name = self.meta.get("package", {}).get("name", "unknown").strip()
        is_noarch = False
        ignore_run_exports = []
        main_build = self.meta.get("build", {})
        if main_build:
            is_noarch = main_build.get("noarch", False)
            ignore_run_exports = main_build.get("ignore_run_exports", [])
        pkg_reqs = {"build": [], "host": [], "run": [], "run_constrained": []}
        requirements = self.meta.get("requirements", {})
        if requirements is not None:
            if isinstance(requirements, list):
                pkg_reqs["run"].extend(requirements)
            else:
                for s in pkg_reqs.keys():
                    l = requirements.get(s, [])
                    if l is not None:
                        if isinstance(l, list):
                            pkg_reqs[s].extend(l)
                        else:
                            pkg_reqs[s].extend([l])
            for s in pkg_reqs.keys():
                pkg_reqs[s] = [
                    Dep(i) for i in pkg_reqs[s] if (i is not None and str(i).strip())
                ]
        self.packages[name] = Package(
            self,
            set(pkg_reqs["build"]),
            set(pkg_reqs["host"]),
            set(pkg_reqs["run"]),
            set(pkg_reqs["run_constrained"]),
            set(ignore_run_exports),
            is_noarch,
        )

        # read output package deps
        outputs = self.meta.get("outputs", [])
        if outputs:
            for output in outputs:
                name = output.get("name", "")
                is_noarch = False
                ignore_run_exports = []
                main_build = output.get("build", {})
                if main_build:
                    is_noarch = main_build.get("noarch", False)
                    ignore_run_exports = main_build.get("ignore_run_exports", [])
                output_pkg_reqs = deepcopy(pkg_reqs)
                requirements = output.get("requirements", {})
                if requirements is not None:
                    if isinstance(requirements, list):
                        output_pkg_reqs["run"].extend(requirements)
                    else:
                        for s in pkg_reqs.keys():
                            l = requirements.get(s, [])
                            if l is not None:
                                if isinstance(l, list):
                                    output_pkg_reqs[s].extend(l)
                                else:
                                    output_pkg_reqs[s].extend([l])
                    for s in output_pkg_reqs.keys():
                        output_pkg_reqs[s] = [
                            Dep(i)
                            for i in output_pkg_reqs[s]
                            if (i is not None and str(i).strip())
                        ]
                self.packages[name] = Package(
                    self,
                    set(output_pkg_reqs["build"]),
                    set(output_pkg_reqs["host"]),
                    set(output_pkg_reqs["run"]),
                    set(output_pkg_reqs["run_constrained"]),
                    set(ignore_run_exports),
                    is_noarch,
                )

    def __getitem__(self, key):
        return self.meta[key]

    def get(self, key, default=None):
        try:
            return self.__getitem__(key)
        except KeyError:
            return default


class Dep:
    def __init__(self, raw_dep):
        self.raw_dep = str(raw_dep)
        splits = re.split(r"[\s<=>]", self.raw_dep, 1)
        self.pkg = splits[0].strip()
        self.constraint = ""
        if len(splits) > 1:
            self.constraint = splits[1]

    def __str__(self) -> str:
        return str(self.raw_dep)

    def __repr__(self) -> str:
        return f'{self.__class__.__name__} "{self.raw_dep}"'


@dataclass
class Package:
    recipe: Recipe = None
    build: Set[Dep] = field(default_factory=set)
    host: Set[Dep] = field(default_factory=set)
    run: Set[Dep] = field(default_factory=set)
    run_constrained: Set[Dep] = field(default_factory=set)
    ignore_run_exports: Set[str] = field(default_factory=set)
    is_noarch = False
    git_info: object = None

    def __getitem__(self, key):
        return getattr(self, key)

    def get(self, key, default=None):
        try:
            return getattr(self, key, default)
        except KeyError:
            return default

    def has_dep(self, section, pkg_name):
        return any([pkg_name.lower() == dep.pkg.lower() for dep in self[section]])

    def merge_deps(self, other):
        self.build.update(other.build)
        self.host.update(other.host)
        self.run.update(other.run)
        self.run_constrained.update(other.run_constrained)
        self.ignore_run_exports.update(other.ignore_run_exports)


def render(recipe_path, subdir=None, python=None, others=None, return_exceptions=False):
    # gather all possible variants
    if others is None:
        others = {"r_implementation": "r-base", "rust_compiler": "rust"}
    variants = read_conda_build_config(recipe_path, subdir, python, others)

    # render for each variant and combine similar results
    render_results = []
    for variant_id, variant in variants:
        r = Recipe.from_file(recipe_path, variant_id, variant, return_exceptions)
        if match := next((x for x in render_results if r.meta == x.meta), None):
            for key, value in r.variant_id.items():
                match.variant_id.get(key, set()).update(value)
        else:
            render_results.append(r)
    return render_results


def dump_render_results(render_results, out=sys.stdout):

    FIELDS = [
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

    class _MetaYaml(dict):
        fields = FIELDS

        def to_omap(self):
            return [(field, self[field]) for field in _MetaYaml.fields if field in self]

    def _represent_omap(dumper, data):
        return dumper.represent_mapping("tag:yaml.org,2002:map", data.to_omap())

    yaml.add_representer(_MetaYaml, _represent_omap)

    class _IndentDumper(yaml.Dumper):
        def increase_indent(self, flow=False, indentless=False):
            return super().increase_indent(flow, False)

        def ignore_aliases(self, data):
            return True

    data_to_dump = []
    for render_result in render_results:
        render_dump = render_result.meta
        render_dump["variant"] = render_result.variant_id
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


def main_cli():
    parser = argparse.ArgumentParser(
        prog="render",
        description="An alternate, less accurate but faster render tool for conda recipes",
    )
    parser.add_argument(
        "recipe", type=Path, help="Recipe meta.yaml file. E.g. ./meta.yaml"
    )
    parser.add_argument(
        "-s",
        "--subdir",
        type=str,
        action="append",
        help="Architecture. E.g. -s linux-64 -s win-64",
    )
    parser.add_argument(
        "-p",
        "--python",
        type=str,
        action="append",
        help="Python version. E.g. -p 3.9 -p 3.10",
    )
    parser.add_argument(
        "-k",
        "--others",
        action="append",
        nargs="+",
        help="Additional key values (e.g. -k blas_impl openblas)",
    )

    args = parser.parse_args()

    others = None
    if args.others:
        others = {}
        for k, v in args.others:
            others[k] = v

    render_results = render(args.recipe, args.subdir, args.python, others)
    dump_render_results(render_results)


if __name__ == "__main__":

    main_cli()
