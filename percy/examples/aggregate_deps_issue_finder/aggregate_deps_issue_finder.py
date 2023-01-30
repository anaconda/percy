""" Script to find issues in aggregate pinned feedstocks.
"""

import percy.render.aggregate as aggregate
import argparse
from pathlib import Path
import yaml

def find_issues(aggregate_path, subdir, python_ref, issues, excludes):

    # load aggregate
    aggregate_repo = aggregate.Aggregate(aggregate_path)
    others = {"r_implementation": "r-base"}
    if subdir.startswith("win-"):
        others["rust_compiler"] = "rust"
    aggregate_repo.load_local_feedstocks(subdir, python_ref, others)

    for name, rendered_pkg in aggregate_repo.rendered_packages.items():

        # find feedstocks with cbc run dep not set in host
        run_deps = set([run_dep.pkg for run_dep in rendered_pkg.run])
        host_deps = set([host_dep.pkg for host_dep in rendered_pkg.host])
        for pkg in set(rendered_pkg.recipe.selector_dict.keys()).intersection(run_deps):
            #print(name, pkg, host_deps)
            if pkg not in host_deps and pkg not in excludes:
                rec = issues["missing_host"].setdefault(rendered_pkg.git_info.name,[])
                if pkg not in rec:
                    rec.append(pkg)

        # find feedstocks ignoring pinning of a host dependency
        pb = set(host_deps).intersection(rendered_pkg.ignore_run_exports)
        if pb:
            for pkg in pb:
                if pkg not in excludes:
                    rec = issues["bad_ignore_run_exports"].setdefault(rendered_pkg.git_info.name,[])
                    if pkg not in rec:
                        rec.append(pkg)
    
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
        "3.7",
        "3.8",
        "3.9",
        "3.10",
    ]

    issues = {
        "bad_ignore_run_exports" : {},
        "missing_host" : {},
    }
    issues_no_numpy_python = {
        "bad_ignore_run_exports" : {},
        "missing_host" : {},
    }
    for subdir, pyver in zip(subdirs, python):
        find_issues(args.aggregate, subdir, pyver, issues, [])
        find_issues(args.aggregate, subdir, pyver, issues_no_numpy_python, ["numpy", "python"])

    with open(f"./issues.yaml", "w") as f:
        yaml.dump(issues, f)
    with open(f"./issues_no_numpy_python.yaml", "w") as f:
        yaml.dump(issues_no_numpy_python, f)