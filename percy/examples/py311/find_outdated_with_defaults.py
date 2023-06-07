"""Script to find local packages at lower version than on defaults.

The script considers packages from defaults that depend on python and are
architecture-specific.

It also takes into account exclude packages.

output is outdated_{subdir}.json 
"""

import argparse
import yaml
import requests
import json
from conda.models.version import VersionOrder


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


def compare_repodata(subdir, python_ref, python_target, block_list):
    
    # TODO: refactor the common logic from this function into a helper.

    results = {}
    session = requests.Session()

    # load noarch repodata
    pkgs_noarch = {}
    url = "https://repo.anaconda.com/pkgs/main/noarch/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        name = v["name"]
        # Skip packages that we don't care about here.
        if not depends_on_python(v, python_target) or name in block_list:
            continue
        # Skip packages that were already identified.
        if name in pkgs_noarch:
            continue
        # Compare the versions.
        noarch_version = VersionOrder(pkgs_noarch[name]["version"])
        version = VersionOrder(v["version"])
        if version > noarch_version:
            continue
        # Compare the build numbers if the versions match.
        noarch_build = pkgs_noarch[name]["build_number"]
        build = v["build_number"]
        if noarch_version == version and noarch_build >= build:
            continue
        # Add the identified noarch package.
        pkgs_noarch[name] = {
            "version": v["version"],
            "build_number": build,
            "noarch": True,
        }

    # load 310 repodata
    pkgs_310 = {}
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        name = v["name"]
        # Skip packages that we don't care about here.
        if not depends_on_python(v, python_ref) or name in block_list:
            continue
        # Skip packages that were already identified.
        if name in pkgs_310:
            continue
        # Compare the versions.
        version_310 = VersionOrder(pkgs_310[name]["version"])
        version = VersionOrder(v["version"])
        if version > version_310:
            continue
        # Compare the build numbers if the versions match.
        build_310 = pkgs_310[name]["build_number"]
        build = v["build_number"]
        if version_310 == version and build_310 >= build:
            continue
        # Add the identified noarch package.
        pkgs_310[name] = {
            "version": v["version"],
            "build_number": build,
            "noarch": False,
        }

    # merge defaults noarch 310
    pkgs_defaults = pkgs_310
    for name, info in pkgs_noarch.items():
        if name not in pkgs_defaults:
            continue
        # Compare the versions.
        version_defaults = VersionOrder(pkgs_defaults[name]["version"])
        version = VersionOrder(info["version"])
        if version_defaults > version:
            continue
        # Compare the build numbers if the versions match.
        build = info["build_number"]
        build_defaults = pkgs_defaults[name]["build_number"]
        if version == version_defaults and build_defaults >= build:
            continue
        print(f"Found {name} {pkgs_noarch[name]}")
        print(f"Removing {name} {pkgs_defaults[name]}")
        del pkgs_defaults[name]

    # load 311 repodata
    pkgs_311 = {}
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        name = v["name"]
        if not depends_on_python(v, python_target) or name in block_list:
            continue
        if name in pkgs_311:
            continue
        # Compare the versions.
        version_311 = VersionOrder(pkgs_311[name]["version"])
        version = VersionOrder(v["version"])
        if version_311 > version:
            continue
        # Compare the build numbers if the versions match.
        build_311 = pkgs_311[name]["build_number"]
        build = v["build_number"]
        if version == version_311 and build_311 >= build:
            continue
        # Add the identified py311 package.
        pkgs_311[name] = {
            "version": v["version"],
            "build_number": build,
            "noarch": False,
        }

    # compare local with defaults
    for local_name, local_data in pkgs_311.items():
        if local_name not in pkgs_defaults:
            continue
        version_local = VersionOrder(local_data["version"])
        version_defaults = VersionOrder(pkgs_defaults[local_name]["version"])
        if version_defaults > version_local:
            continue
        build_defaults = int(pkgs_defaults[local_name]["build_number"])
        build_local = int(local_data["build_number"])
        if build_defaults >= build_local:
            continue
        results[local_name] = {
            "311_version": local_data["version"],
            "311_build_number": build_local,
            "310_version": pkgs_defaults[local_name]["version"],
            "310_build_number": build_defaults,
        }

    # find missing from local
    for defaults_name in pkgs_defaults.keys() - pkgs_311.keys():
        defaults_version = pkgs_defaults[defaults_name]["version"]
        results[defaults_name] = {
            "311_version": None,
            "311_build_number": None,
            "310_version": defaults_version,
            "310_build_number": build_defaults,
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
    filename = f"{args.subdir}/python_3.10_{args.subdir}_package_list_missing.yaml"
    with open(filename) as file:
        block_list = yaml.safe_load(file)

    results = compare_repodata(args.subdir, "3.10", "3.11", block_list)
    with open(f"./oudated_{args.subdir}.json", "w") as f:
        json.dump(results, f, indent=4)
