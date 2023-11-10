"""
Script to find local packages at lower version than on defaults.

The script considers packages from defaults that depend on python and are
architecture-specific.

It also takes into account exclude packages.

output is outdated_{subdir}.json
"""

import argparse
import json

import requests
import yaml
from conda.models.version import VersionOrder as vo


def match_lower(mrv, rv, v):
    irv = int(rv) - 1
    hlp = ">={}.{}".format(mrv, irv)
    if v.find(hlp) >= 0:
        return True
    irv = irv - 1
    while irv > -1:
        hlp = ">={}.{}".format(mrv, irv)
        if v.find(hlp) >= 0:
            hlp += ","
            return v.find(hlp) < 0
        hlp = ">{}.{}".format(mrv, irv)
        if v.find(hlp) >= 0:
            hlp += ","
            return v.find(hlp) < 0
        irv = irv - 1
    return False


def depends_on_python(repo_package, python_ref):
    buildstr = repo_package["build"]
    pyver = f"py{python_ref.replace('.','')}"
    if "py_" in buildstr or "pyh" in buildstr or pyver in buildstr:
        return True
    repo_package["depends"]

    hlp = ">=" + python_ref + ",<" + python_ref[0] + "."
    hlp2 = "=" + python_ref
    next_minor = str(int(python_ref.split(".")[-1]) + 1)
    for v in repo_package["depends"]:
        if v.find("python ") >= 0:
            if v.find(hlp) >= 0 or match_lower(python_ref[0], next_minor, v):
                return True
        elif v.find(hlp2) >= 0:
            return True
        elif v == "python":
            return True

    return False


def _is_newer_than(package, version, build_number):
    """
    Returns True when the package is newer than a version and build_number.
    """
    if version > package["vo"]:
        return False
    if version < package["vo"]:
        return True
    return int(build_number) < int(package["build_number"])


def compare_repodata(subdir, python_ref, python_target, block_list):
    session = requests.Session()

    # Yields only packages that depend on a python version within a subdir.
    def get_python_packages(arch, python):
        url = f"https://repo.anaconda.com/pkgs/main/{arch}/repodata.json"
        repodata = session.get(url)
        repodata.raise_for_status()
        for pkg in repodata.json()["packages"].values():
            name = pkg["name"]
            if name not in block_list and depends_on_python(pkg, python):
                version = pkg["version"]
                yield name, pkg["build_number"], version, vo(version)

    # Returns the latest versions of each python package.
    def get_latest(arch, python):
        latest: dict = {}
        for name, build, v, version in get_python_packages(arch, python):
            pkg = latest.get(name)
            if not pkg or _is_newer_than(pkg, version, build):
                latest[name] = {
                    "version": v,
                    "vo": version,
                    "build_number": build,
                    "noarch": arch == "noarch",
                }
        return latest

    # Get the published python_ref (defaults) packages.
    pkgs_defaults = get_latest(subdir, python_ref)

    # Remove anything from defaults that is newer in noarch.
    for name, noarch in get_latest("noarch", python_target).items():
        defaults = pkgs_defaults.get(name)
        if not defaults:
            continue
        if _is_newer_than(noarch, defaults["vo"], defaults["build_number"]):
            print(f"Found {name} {noarch}")
            print(f"Removing {name} {defaults}")
            del pkgs_defaults[name]

    # compare local with defaults
    pkgs_local = get_latest(subdir, python_target)
    results = {}
    for local_name, local in pkgs_local.items():
        defaults = pkgs_defaults.get(local_name)
        if defaults and _is_newer_than(defaults, local["vo"], local["build_number"]):
            results[local_name] = {
                "312_version": local["version"],
                "312_build_number": local["build_number"],
                "311_version": defaults["version"],
                "311_build_number": defaults["build_number"],
            }

    # find missing from local
    for defaults_name in pkgs_defaults.keys() - pkgs_local.keys():
        defaults_version = pkgs_defaults[defaults_name]["version"]
        defaults_build_number = pkgs_defaults[defaults_name]["build_number"]
        results[defaults_name] = {
            "312_version": None,
            "312_build_number": None,
            "311_version": defaults_version,
            "311_build_number": defaults_build_number,
        }

    session.close()

    return results


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="gap finder",
        description="Compare two repodata json files",
    )
    parser.add_argument(
        "-s",
        "--subdir",
        type=str,
        help="subdir",
        default="osx-arm64",
    )

    return parser


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()

    block_list = []
    filename = f"{args.subdir}/python_3.11_{args.subdir}_package_list_missing.yaml"
    with open(filename, encoding="utf-8") as file:
        block_list = yaml.safe_load(file)

    results = compare_repodata(args.subdir, "3.11", "3.12", block_list)
    with open(f"./oudated_{args.subdir}.json", "w", encoding="utf-8") as f:
        json.dump(results, f, indent=4)
