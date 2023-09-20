"""Reads cbc files and gives variants.

Largely inspired from conda build.
"""

# TODO: refactor long lines and remove the following linter mute
# ruff: noqa: E501

import copy
import itertools
import logging
import os
import re
from pathlib import Path
from typing import Dict, List, Sequence, Tuple

import yaml

try:
    loader = yaml.CLoader
except Exception:
    loader = yaml.Loader

Variant = Dict[str, dict]


def _ensure_list(obj):
    """Wraps **obj** in a list if necessary

    >>> _ensure_list("one")
    ["one"]
    >>> _ensure_list(["one", "two"])
    ["one", "two"]
    """
    if isinstance(obj, Sequence) and not isinstance(obj, str):
        return obj
    return [obj]


# copied and adapted from conda-build
def _find_config_files(
    metadata_or_path, variant_config_files, exclusive_config_files
):
    """
    Find config files to load. Config files are stacked in the following order:
        1. exclusive config files (see config.exclusive_config_files)
        2. user config files
           (see context.conda_build["config_file"] or ~/conda_build_config.yaml)
        3. cwd config files (see ./conda_build_config.yaml)
        4. recipe config files (see ${RECIPE_DIR}/conda_build_config.yaml)
        5. additional config files (see config.variant_config_files)

    .. note::
        Order determines clobbering with later files clobbering earlier ones.

    :param metadata_or_path: the metadata or path within which to find recipe config files
    :type metadata_or_path:
    :param exclusive_config_files
    :param variant_config_files
    :return: List of config files
    :rtype: `list` of paths (`str`)
    """

    def resolve(p):
        return os.path.abspath(os.path.expanduser(os.path.expandvars(p)))

    # exclusive configs
    files = [resolve(f) for f in _ensure_list(exclusive_config_files)]

    if not files:
        # if not files and not config.ignore_system_variants:
        # user config
        # if cc_conda_build.get('config_file'):
        #     cfg = resolve(cc_conda_build['config_file'])
        # else:
        #     cfg = resolve(os.path.join('~', "conda_build_config.yaml"))
        cfg = resolve(os.path.join("~", "conda_build_config.yaml"))
        if os.path.isfile(cfg):
            files.append(cfg)

        cfg = resolve("conda_build_config.yaml")
        if os.path.isfile(cfg):
            files.append(cfg)
        else:
            path = getattr(metadata_or_path, "path", metadata_or_path)
            cfg = resolve(
                os.path.join(path, "..", "..", "conda_build_config.yaml")
            )
            if os.path.isfile(cfg):
                files.append(cfg)
            else:
                cfg = resolve(
                    os.path.join(path, "..", "conda_build_config.yaml")
                )
                if os.path.isfile(cfg):
                    files.append(cfg)

    path = getattr(metadata_or_path, "path", metadata_or_path)
    cfg = resolve(os.path.join(path, "conda_build_config.yaml"))
    if os.path.isfile(cfg):
        files.append(cfg)

    files.extend([resolve(f) for f in _ensure_list(variant_config_files)])

    return files


class CBCRenderError(Exception):
    def __init__(self, message=None, line=None, column=None):
        self.line = line
        self.column = column
        if message is not None:
            if line is not None:
                if column is not None:
                    message += " (at line %i / column %i)" % (line, column)
                else:
                    message += " (at line %i)" % line
            super().__init__(message)
        else:
            super().__init__()


def _apply_selector(data, selector_dict):
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
                continue
        updated_data.append(line)
    return updated_data


def read_conda_build_config(
    recipe_path: Path,
    subdir: List[str] = None,
    python: List[str] = None,
    others: Dict[str, str] = None,
    variant_config_files: List[str] = [],
    exclusive_config_files: List[str] = [],
) -> List[Tuple[str, Variant]]:
    """Read conda build config into a list of variants.

    Args:
        recipe_path (Path): Path to a recipe meta.yaml file.
        subdir (List[str], optional): A list of subdir to render for. E.g. ["linux-64", "win-64"]. Defaults to None to render all subdirs.
        python (List[str], optional): A list of python version to render for. E.g. ["3.10", "3.11"]. Defaults to None to render all python.
        others (Dict[str, ], optional): Additional variants configuration. E.g. {"blas_impl" : "openblas"} Defaults to None.
        variant_config_files (List[str], optional): Additional cbc files to use. Defaults to [].
        exclusive_config_files (List[str], optional): If specified, only use these cbc files. Defaults to [].

    Raises:
        CBCRenderError: Failed to render cbc file.

    Returns:
        list[tuple[str, dict[str,str]]]: A list of tuples, where the first value is a variant id and the second value a variant dictionary.
    """
    recipe_dir = recipe_path.parent
    variants = []

    if subdir is None:
        subdir = [
            "linux-64",
            "linux-aarch64",
            "linux-s390x",
            "linux-ppc64le",
            "osx-64",
            "osx-arm64",
            "win-64",
        ]
    else:
        subdir = _ensure_list(subdir)
    if python is None:
        python = ["3.8", "3.9", "3.10", "3.11"]
    else:
        python = _ensure_list(python)

    for arch in subdir:
        # Set base configuration
        base_selector_dict = {
            "ccache_method": None,
            "unix": False,
            "linux": False,
            "linux-64": False,
            "linux64": False,
            "win": False,
            "win32": False,
            "win64": False,
            "osx": False,
            "osx64": False,
            "arm64": False,
            "aarch64": False,
            "s390x": False,
            "ppc64le": False,
            "x86_64": False,
            "x86": False,
            "py3k": 1,
            "py2k": 0,
            "py": 310,
            "zip_keys": ["python"],
            "python": python,
        }
        arch = arch.lower()
        (platform, atype) = arch.split("-")
        base_selector_dict[platform] = True
        base_selector_dict[atype] = True
        base_selector_dict[arch] = True
        base_selector_dict["platform"] = platform
        base_selector_dict["arch"] = atype
        base_selector_dict["target_platform"] = arch
        base_selector_dict["build_platform"] = arch
        base_selector_dict[arch.replace("-", "")] = True
        if platform in ("linux", "osx"):
            base_selector_dict["unix"] = True
        if arch in ("linux-64", "win-64", "osx-64"):
            base_selector_dict["x86_64"] = True
            base_selector_dict["x86"] = True
        for i in range(0, 15):
            base_selector_dict[f"py3{i}"] = False

        # List conda_build_config files for linter render.
        conda_build_config_files = _find_config_files(
            recipe_dir, variant_config_files, exclusive_config_files
        )
        logging.debug(f"cbc files: {conda_build_config_files}")

        # Update base selector dict
        for cbc in conda_build_config_files:
            with open(cbc) as f_cbc:
                try:
                    cbc_selectors_str = _apply_selector(
                        f_cbc.read(), base_selector_dict
                    )
                    cbc_selectors_yml = yaml.load(
                        "\n".join(cbc_selectors_str), Loader=loader
                    )
                    if cbc_selectors_yml:
                        for k, v in cbc_selectors_yml.items():
                            if isinstance(v, list):
                                base_selector_dict[k] = v
                except yaml.error.YAMLError as exc:
                    if hasattr(exc, "problem_mark"):
                        raise CBCRenderError(line=exc.problem_mark.line)
                    else:
                        raise CBCRenderError()

        # Gather variants
        zip_keys = []
        groups = {}
        zip_key_groups = base_selector_dict.get("zip_keys", [])
        zip_key_groups = (
            [zip_key_groups]
            if zip_key_groups and isinstance(zip_key_groups[0], str)
            else zip_key_groups
        )
        for key_group in zip_key_groups:
            zip_keys.extend(key_group)
            groups[tuple(key_group)] = list(
                zip(*[base_selector_dict[k] for k in key_group])
            )
        for k, v in base_selector_dict.items():
            if k not in zip_keys and isinstance(v, list) and len(v) > 1:
                groups[k] = v
        if groups:
            group_keys, group_values = zip(*groups.items())
            group_permutations = [
                dict(zip(group_keys, v))
                for v in itertools.product(*group_values)
            ]
            for d in group_permutations:
                new_d = copy.deepcopy(d)
                for k, v in new_d.items():
                    if isinstance(k, tuple):
                        for i, k1 in enumerate(k):
                            d[k1] = v[i]
                        del d[k]
        else:
            group_permutations = [{}]

        # Filter variants
        filtered_group_permutations = []
        if python:
            for group in group_permutations:
                if "python" in group and str(group["python"]) in python:
                    filtered_group_permutations.append(group)
            group_permutations = filtered_group_permutations
        if others:
            for o_key, o_value in others.items():
                if any([o_key in d for d in group_permutations]):
                    filtered_group_permutations = []
                    for group in group_permutations:
                        if o_key in group and str(group[o_key]) == o_value:
                            filtered_group_permutations.append(group)
                    group_permutations = filtered_group_permutations

        # Build selector variants
        for perm in group_permutations:
            variant_selector_dict = copy.deepcopy(base_selector_dict)
            variant_selector_dict.update(perm)
            if others:
                variant_selector_dict.update(others)
            for k, v in variant_selector_dict.items():
                if isinstance(v, list):
                    variant_selector_dict[k] = v[0]
            if "python" in variant_selector_dict:
                python_short = str(variant_selector_dict["python"]).replace(
                    ".", ""
                )
                variant_selector_dict["py"] = int(python_short)
                variant_selector_dict[f"py{python_short}"] = True
            perm["subdir"] = arch
            for k, v in perm.items():
                perm[k] = set(_ensure_list(v))
            variants.append((perm, variant_selector_dict))

    return variants
