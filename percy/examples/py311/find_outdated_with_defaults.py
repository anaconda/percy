""" Script to find local packages at lower version than on defaults.
    The script considers packages from defaults that depend on python and are arch specific.
    It also takes into account exclude packages.
    output is outdated_{subdir}.json 
"""

import argparse
from pathlib import Path
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
    
    results = {}
    session = requests.Session()

    # load noarch repodata
    pkgs_noarch = {}
    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/noarch/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        if depends_on_python(v, python_target) and v["name"] not in block_list:
            if (v["name"] not in pkgs_noarch) \
                or (VersionOrder(pkgs_noarch[v["name"]]["version"]) < VersionOrder(v["version"])) \
                or (VersionOrder(pkgs_noarch[v["name"]]["version"]) == VersionOrder(v["version"]) and pkgs_noarch[v["name"]]["build_number"] < v["build_number"]):
                pkgs_noarch[v["name"]] = { "version": v["version"], "build_number": v["build_number"], "noarch": True }


    # load 310 repodata
    pkgs_310 = {}
    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        if depends_on_python(v, python_ref) and v["name"] not in block_list:
            if (v["name"] not in pkgs_310) \
                or (VersionOrder(pkgs_310[v["name"]]["version"]) < VersionOrder(v["version"])) \
                or (VersionOrder(pkgs_310[v["name"]]["version"]) == VersionOrder(v["version"]) and pkgs_310[v["name"]]["build_number"] < v["build_number"]):
                pkgs_310[v["name"]] = { "version": v["version"], "build_number": v["build_number"], "noarch": False }

    # merge defaults noarch 310
    pkgs_defaults = pkgs_310
    for name, info in pkgs_noarch.items():
        if name in pkgs_defaults and \
            ((VersionOrder(info["version"]) > VersionOrder(pkgs_defaults[name]["version"])) \
            or (VersionOrder(info["version"]) == VersionOrder(pkgs_defaults[name]["version"]) and info["build_number"] > pkgs_defaults[name]["build_number"])):
            print(f"Found {name} {pkgs_noarch[name]}")
            print(f"Removing {name} {pkgs_defaults[name]}")
            del pkgs_defaults[name]

    # load 311 repodata
    pkgs_311 = {}
    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        if depends_on_python(v, python_target) and v["name"] not in block_list:
            if (v["name"] not in pkgs_311) \
                or (VersionOrder(pkgs_311[v["name"]]["version"]) < VersionOrder(v["version"])) \
                or (VersionOrder(pkgs_311[v["name"]]["version"]) == VersionOrder(v["version"]) and pkgs_311[v["name"]]["build_number"] < v["build_number"]):
                pkgs_311[v["name"]] = { "version": v["version"], "build_number": v["build_number"], "noarch": False }

    # compare local with defaults
    git_cmds = []
    condabuild_cmds = []
    for local_name, local_data in pkgs_311.items():
        local_version = local_data["version"]
        local_build_number = int(local_data["build_number"])
        if local_name in pkgs_defaults:
            defaults_version = pkgs_defaults[local_name]["version"]
            defaults_build_number = int(pkgs_defaults[local_name]["build_number"])
            if (VersionOrder(local_version) < VersionOrder(defaults_version)) \
                or (VersionOrder(local_version) == VersionOrder(defaults_version) and local_build_number < defaults_build_number):
                results[local_name] = {"311_version": local_version, "311_build_number": local_build_number, "310_version": defaults_version, "310_build_number": defaults_build_number}

    # find missing from local
    for defaults_name in pkgs_defaults.keys() - pkgs_311.keys():
        defaults_version = pkgs_defaults[defaults_name]["version"]
        results[defaults_name] = {"311_version": None, "311_build_number": None, "310_version": defaults_version, "310_build_number": defaults_build_number}

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
    with open(f"{args.subdir}/python_3.10_{args.subdir}_package_list_missing.yaml", "r") as file:
        block_list = yaml.safe_load(file)

    results = compare_repodata(args.subdir, "3.10", "3.11", block_list)
    with open(f"./oudated_{args.subdir}.json", "w") as f:
        json.dump(results, f, indent=4)
