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

def compare_repodata(subdir, local_repodata, python_ref, block_list, include_noarch=False):
    
    results = {}

    # load default repodata
    session = requests.Session()
    defaults_pkgs = {}
    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        if depends_on_python(v, python_ref) and v["name"] not in block_list:
            if v["name"] not in defaults_pkgs or VersionOrder(defaults_pkgs[v["name"]]["version"]) < VersionOrder(v["version"]):
                defaults_pkgs[v["name"]] = { "version": v["version"], "noarch": False }
    if include_noarch:
        repodata_noarch = None
        url = "https://repo.anaconda.com/pkgs/main/noarch/repodata.json"
        response = session.get(url)
        if response.status_code != 200:
            raise Exception()
        else:
            repodata_noarch = json.loads(response.text)
        for v in repodata_noarch["packages"].values():
            if depends_on_python(v, python_ref) and v["name"] not in block_list:
                if v["name"] not in defaults_pkgs or VersionOrder(defaults_pkgs[v["name"]]["version"]) < VersionOrder(v["version"]):
                    defaults_pkgs[v["name"]] = { "version": v["version"], "noarch": True }

    # load local repodata
    local_pkgs = {}
    with open(local_repodata) as f:
        repodata_subdir = json.load(f)
        for v in repodata_subdir["packages"].values():
            if v["name"] not in local_pkgs or VersionOrder(local_pkgs[v["name"]]["version"]) < VersionOrder(v["version"]):
                local_pkgs[v["name"]] = { "version": v["version"], "noarch": False }

    # compare local with defaults
    for local_name, local_data in local_pkgs.items():
        local_version = local_data["version"]
        if local_name in defaults_pkgs:
            defaults_version = defaults_pkgs[local_name]["version"]
            if VersionOrder(local_version) < VersionOrder(defaults_version):
                results[local_name] = {"local_version": local_version, "defaults_version": defaults_version,}

    # find missing from local
    for defaults_name in defaults_pkgs.keys() - local_pkgs.keys():
        defaults_version = defaults_pkgs[defaults_name]["version"]
        results[defaults_name] = {"local_version": None, "defaults_version": defaults_version,}


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

    parser.add_argument(
        "-r",
        "--repodata",
        type=Path,
        help="local repodata",
        default="repodata.json",
    )

    parser.add_argument(
        "-p",
        "--python_ref",
        type=str,
        help="python ref",
        default="3.10",
    )

    return parser


if __name__ == "__main__":

    parser = create_parser()
    args = parser.parse_args()

    block_list = []
    with open(f"{args.subdir}/python_3.10_{args.subdir}_package_list_missing.yaml", "r") as file:
        block_list = yaml.safe_load(file)

    results = compare_repodata(args.subdir, args.repodata, args.python_ref, block_list)
    with open(f"./oudated_{args.subdir}.json", "w") as f:
        json.dump(results, f, indent=4)
