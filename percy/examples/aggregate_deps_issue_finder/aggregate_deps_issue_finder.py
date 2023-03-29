""" Script to find issues in aggregate pinned feedstocks.
"""

import percy.render.aggregate as aggregate
import argparse
from pathlib import Path
import yaml
import requests
import json
import re
import itertools
from conda.models.version import VersionOrder

def get_repodata_package_list(subdir):

    session = requests.Session()

    pkgs = {}

    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        if v["name"] not in pkgs or VersionOrder(pkgs[v["name"]]["version"]) < VersionOrder(v["version"]):
            pkgs[v["name"]] = { "version": v["version"], "noarch": False }
    
    repodata_noarch = None
    url = "https://repo.anaconda.com/pkgs/main/noarch/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_noarch = json.loads(response.text)
    for v in repodata_noarch["packages"].values():
        if v["name"] not in pkgs or VersionOrder(pkgs[v["name"]]["version"]) < VersionOrder(v["version"]):
            pkgs[v["name"]] = { "version": v["version"], "noarch": True }

    return pkgs

def find_issues(aggregate_path, subdir, python_ref, issues, excludes):

    # load defaults
    defaults_pkgs = get_repodata_package_list(subdir)

    # load aggregate
    aggregate_repo = aggregate.Aggregate(aggregate_path)
    others = {"r_implementation": "r-base"}
    if subdir.startswith("win-"):
        others["rust_compiler"] = "rust"
    aggregate_repo.load_local_feedstocks(subdir, python_ref, others)

    for name, rendered_pkg in aggregate_repo.packages.items():

        # find local feedstocks with cbc run dep not set in host
        run_deps = set([run_dep.pkg for run_dep in rendered_pkg.run])
        host_deps = set([host_dep.pkg for host_dep in rendered_pkg.host])
        for pkg in set(rendered_pkg.recipe.selector_dict.keys()).intersection(run_deps):
            #print(name, pkg, host_deps)
            if pkg not in host_deps and pkg not in excludes:
                rec = issues["missing_host"].setdefault(rendered_pkg.git_info.name,[])
                if pkg not in rec:
                    rec.append(pkg)

        # find local feedstocks ignoring pinning of a host dependency
        pb = set(host_deps).intersection(rendered_pkg.ignore_run_exports)
        if pb:
            for pkg in pb:
                if pkg not in excludes:
                    rec = issues["bad_ignore_run_exports"].setdefault(rendered_pkg.git_info.name,[])
                    if pkg not in rec:
                        rec.append(pkg)

        # find local feedstocks with outdated version compared to defaults
        if name in defaults_pkgs:
            default_version = defaults_pkgs[name]["version"]
            default_is_noarch = defaults_pkgs[name]["noarch"]
            if rendered_pkg.version == "-1":
                rendered_pkg.version = "0a"
            if VersionOrder(rendered_pkg.version) < VersionOrder(default_version):
                rec = issues["outdated_local"].setdefault(rendered_pkg.git_info.name,{}).setdefault(name,{ "subdir": [subdir], "aggregate_version": rendered_pkg.version, "defaults_version": default_version})
                if subdir not in rec["subdir"]:
                    rec["subdir"].append(subdir)
                if rendered_pkg.has_dep("run", "python") and not default_is_noarch:
                    rec = issues["outdated_py_local"].setdefault(rendered_pkg.git_info.name,{}).setdefault(name,{ "subdir": [subdir], "aggregate_version": rendered_pkg.version, "defaults_version": default_version})
                    if subdir not in rec["subdir"]:
                        rec["subdir"].append(subdir)
            elif VersionOrder(rendered_pkg.version) > VersionOrder(default_version):
                rec = issues["outdated_defaults"].setdefault(rendered_pkg.git_info.name,{}).setdefault(subdir,[])
                if rendered_pkg.name not in rec:
                    rec.append({ "name": rendered_pkg.name, "aggregate_version": rendered_pkg.version, "defaults_version": default_version})
        else:
            rec = issues["not_in_defaults"].setdefault(rendered_pkg.git_info.name,[])
            if rendered_pkg.name not in rec:
                rec.append(rendered_pkg.name)

    
    return issues


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="aggregate_issue_finder",
        description="Find issues in aggregate pinned feedstocks.",
    )
    parser.add_argument(
        "-a",
        "--aggregate",
        type=Path,
        help="aggregate path",
        default="/Users/cbousseau/work/recipes/aggregate/",
    )

    return parser


if __name__ == "__main__":

    parser = create_parser()
    args = parser.parse_args()
    
    subdirs = [
        "osx-arm64",
        "osx-64",
        "win-64",
        "linux-64",
        "linux-aarch64",
        "linux-ppc64le",
        "linux-s390x",
    ]

    python = [
        "3.8",
        "3.9",
        "3.10",
        "3.11",
    ]

    issues = {
        "bad_ignore_run_exports" : {},
        "missing_host" : {},
        "outdated_local" : {},
        "outdated_defaults" : {},
        "outdated_py_local" : {},
        "not_in_defaults" : {},
    }
    issues_no_numpy_python = {
        "bad_ignore_run_exports" : {},
        "missing_host" : {},
        "outdated_local" : {},
        "outdated_defaults" : {},
        "outdated_py_local" : {},
        "not_in_defaults" : {},
    }

    for subdir, pyver in itertools.product(subdirs, python):
        find_issues(args.aggregate, subdir, pyver, issues, [])
        find_issues(args.aggregate, subdir, pyver, issues_no_numpy_python, ["numpy", "python"])

    with open(f"./issues.yaml", "w") as f:
        yaml.dump(issues, f)
    with open(f"./issues_no_numpy_python.yaml", "w") as f:
        yaml.dump(issues_no_numpy_python, f)

    print(f"Outdated: { len(issues['outdated_py_local']) }")