"""
File:           repodata.py
Description:    Provides tools for processing information about a repository
"""
from __future__ import annotations

import json
import logging

import requests
from conda.exceptions import InvalidVersionSpec
from conda.models.version import VersionOrder

from percy.render.recipe import Package


def get_latest_package_list(subdir: str = "linux-64", merge_noarch: bool = True) -> dict[str, dict]:
    """
    Get latest packages on defaults

    :param subdir: The subdirectory. Defaults to "linux-64".
    :param merge_noarch: Include noarch versions. Defaults to True.

    :returns: { pkg_name : { version, build_number, noarch } }
    """

    session = requests.Session()

    # load noarch repodata
    if merge_noarch:
        pkgs_noarch = {}
        repodata_subdir = None
        url = "https://repo.anaconda.com/pkgs/main/noarch/repodata.json"
        response = session.get(url)
        response.raise_for_status()
        repodata_subdir = json.loads(response.text)
        for v in repodata_subdir["packages"].values():
            if (
                (v["name"] not in pkgs_noarch)
                or (VersionOrder(pkgs_noarch[v["name"]]["version"]) < VersionOrder(v["version"]))
                or (
                    VersionOrder(pkgs_noarch[v["name"]]["version"]) == VersionOrder(v["version"])
                    and pkgs_noarch[v["name"]]["build_number"] < v["build_number"]
                )
            ):
                pkgs_noarch[v["name"]] = {
                    "version": v["version"],
                    "build_number": v["build_number"],
                    "noarch": True,
                }

    # load subdir repodata
    pkgs_subdir = {}
    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    response.raise_for_status()
    repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        if (
            (v["name"] not in pkgs_subdir)
            or (VersionOrder(pkgs_subdir[v["name"]]["version"]) < VersionOrder(v["version"]))
            or (
                VersionOrder(pkgs_subdir[v["name"]]["version"]) == VersionOrder(v["version"])
                and pkgs_subdir[v["name"]]["build_number"] < v["build_number"]
            )
        ):
            pkgs_subdir[v["name"]] = {
                "version": v["version"],
                "build_number": v["build_number"],
                "noarch": False,
            }

    session.close()

    # merge noarch with subdir
    pkgs_defaults = pkgs_subdir
    if merge_noarch:
        for name, info in pkgs_noarch.items():
            if name in pkgs_defaults and (
                (VersionOrder(info["version"]) > VersionOrder(pkgs_defaults[name]["version"]))
                or (
                    VersionOrder(info["version"]) == VersionOrder(pkgs_defaults[name]["version"])
                    and info["build_number"] > pkgs_defaults[name]["build_number"]
                )
            ):
                logging.info("Found newer noarch %s %s", name, info)
                pkgs_defaults[name] = pkgs_noarch[name]

    return pkgs_defaults


def compare_package_with_defaults(package: Package, defaults_pkgs: dict[str, dict]) -> dict:
    """
    Compare a local package with its latest version on defaults

    :param package: Local package
    :param defaults_pkgs: defaults data

    :returns: Comparison result
    """
    result = None
    try:
        local_feedstock = package.git_info.name
        local_name = package.name
        local_version = package.version
        local_build_number = int(package.number)
        if local_name in defaults_pkgs:
            defaults_version = defaults_pkgs[local_name]["version"]
            defaults_build_number = int(defaults_pkgs[local_name]["build_number"])
            if (VersionOrder(local_version) < VersionOrder(defaults_version)) or (
                VersionOrder(local_version) == VersionOrder(defaults_version)
                and local_build_number < defaults_build_number
            ):
                result = {
                    "local_feedstock": local_feedstock,
                    "local_version": local_version,
                    "local_build_number": local_build_number,
                    "defaults_version": defaults_version,
                    "defaults_build_number": defaults_build_number,
                }
    except (ValueError, InvalidVersionSpec):
        logging.exception(local_name)
    return result
