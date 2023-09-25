""" Find what to rebuild when updating a feedstock.
    Create corresponding tickets in Jira.
"""

import argparse
import itertools
import json
import logging
import os
from pathlib import Path

import requests
from jira.client import JIRA
from jira.exceptions import JIRAError

import percy.render.aggregate as aggregate

logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)

perseverance_jira = None
perseverance_fields_map = None


def add_issue(login, token, dry_run, current_epic_key, target_pkg, pkg):
    """
    Add a new issue to perseverance jira.
    """
    global perseverance_jira
    global perseverance_fields_map

    if not perseverance_jira:
        perseverance_jira = JIRA("https://anaconda.atlassian.net/", basic_auth=(login, token))
        allfields = perseverance_jira.fields()
        perseverance_fields_map = {field["name"]: field["id"] for field in allfields}

    logging.info(f"NEW {pkg}")

    issue_fields = {
        "project": {"key": "PKG"},
        "summary": f"{pkg} rebuilt against {target_pkg}",
        "description": f"{pkg} rebuilt against {target_pkg}",
        "issuetype": {"name": "Task"},
        perseverance_fields_map["Package Name"]: pkg,
    }
    if current_epic_key:
        issue_fields[perseverance_fields_map["Epic Link"]] = current_epic_key
    try:
        # create issue
        if not dry_run:
            perseverance_jira.create_issue(fields=issue_fields, prefetch=True)
        else:
            logging.info(issue_fields)

    except JIRAError as err:
        logging.error(f"Failed to add issue {pkg}. {err.text}")


def depends_on_target(repo_package, target):
    for v in repo_package["depends"]:
        if v.startswith(f"{target} "):
            return v
    return None


def process_repodata(subdir, targets):
    session = requests.Session()
    pkgs = []
    is_noarch = subdir == "noarch"

    # load subdir repodata
    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir = json.loads(response.text)
    for v in repodata_subdir["packages"].values():
        for target in targets:
            spec_str = depends_on_target(v, target)
            if spec_str:
                pkgs.append(
                    {
                        "name": v["name"],
                        "spec": spec_str,
                        "version": v["version"],
                        "build_number": v["build_number"],
                        "noarch": is_noarch,
                    }
                )

    pkgs = sorted(pkgs, key=lambda v: v["name"])

    session.close()

    return pkgs


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
        default="/Users/cbousseau/work/recipes/aggregate2/",
    )
    parser.add_argument("--epic", type=str, help="Epic key")
    parser.add_argument("--target", type=str, help="Target feedstock to rebuild against")
    parser.add_argument("--dry_run", help="If set, no actual sync is done.", action="store_true")
    parser.add_argument(
        "--login",
        type=str,
        help="Jira login (if not given, env var JIRA_LOGIN is used)",
    )
    parser.add_argument(
        "--token",
        type=str,
        help="Jira token (if not given, env var JIRA_TOKEN is used)",
    )

    return parser


class JiraSync:
    def __init__(self, login, token, dry_run=False):
        """
        If dry_run is True, no calls are made to update Jira.
        """
        self.dry_run = dry_run
        self.perseverance_project = "PKG"
        self.perseverance_jira = JIRA("https://anaconda.atlassian.net/", basic_auth=(login, token))
        allfields = self.perseverance_jira.fields()
        self.perseverance_fields_map = {field["name"]: field["id"] for field in allfields}

    def sync(self, epic_key, target, stages):
        """
        Add changes from input json to perseverance jira
        """

        # read epic tasks from jira
        epic_tasks = []
        total = 0
        while True:
            issues = self.perseverance_jira.search_issues(
                f'project = {self.perseverance_project} and "Epic Link" = {epic_key}',
                fields="*all",
                startAt=total,
            )
            got = len(issues)
            if got == 0:
                break
            total += got
            epic_tasks.extend(
                [
                    getattr(
                        issue.fields,
                        self.perseverance_fields_map["Package Name"],
                        "",
                    ).lower()
                    for issue in issues
                ]
            )

        # add packages to jira
        n_stages = len(stages)
        for i, stage in enumerate(stages):
            for feedstock in stage:
                package_name = next(iter(feedstock.packages)).lower()
                if package_name not in epic_tasks:
                    logging.info(f"No existing ticket {package_name} : creating new ticket")
                    issue_key = f"{i+1:03}/{n_stages:03} {feedstock.name}"
                    desc = f"{issue_key} rebuild against {target}"
                    issue_fields = {
                        "project": {"key": "PKG"},
                        "summary": desc,
                        "description": desc,
                        "issuetype": {"name": "Task"},
                        self.perseverance_fields_map["Package Name"]: package_name,
                    }
                    issue_fields[self.perseverance_fields_map["Epic Link"]] = epic_key
                    try:
                        # create issue
                        if not self.dry_run:
                            self.perseverance_jira.create_issue(fields=issue_fields, prefetch=True)
                        else:
                            logging.info(issue_fields)

                    except JIRAError as err:
                        logging.error(f"Failed to add issue {feedstock.name}. {err.text}")
                else:
                    logging.info(f"Existing ticket {package_name} : skip")


def print_build_order(buildout):
    stages = [list(result) for key, result in itertools.groupby(buildout, key=lambda f: f.weight)]
    for i, stage in enumerate(stages):
        for feedstock in stage:
            print(f"{i:03} {feedstock.name:30} {list(feedstock.packages.keys())}")


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

    # load aggregate
    aggregate_repo = aggregate.Aggregate(args.aggregate)
    for subdir, pyver in itertools.product(subdirs, python):
        others = {"r_implementation": "r-base"}
        if subdir.startswith("win-"):
            others["rust_compiler"] = "rust"
        aggregate_repo.load_local_feedstocks(subdir, pyver, others)

    # load repodata
    pkg_targets = aggregate_repo.feedstocks[args.target].packages.keys()
    main_pkgs = set()
    for subdir in subdirs + ["noarch"]:
        results = process_repodata(subdir, pkg_targets)
        main_pkgs.update(set([r["name"] for r in results]))
        with open(f"./{args.target}_{subdir}.json", "w") as f:
            json.dump(results, f, indent=4)

    # get feedstock build order
    buildout = aggregate_repo.get_depends_build_order([], [args.target], [], [], [], False)

    # print build order
    print("\n\nDownstream build order:")
    stages = [list(result) for key, result in itertools.groupby(buildout, key=lambda f: f.weight)]
    all_packages = set()
    for i, stage in enumerate(stages):
        for feedstock in stage:
            all_packages.update(set(feedstock.packages.keys()))
            print(f"{i:03} {feedstock.name:30} {list(feedstock.packages.keys())}")
    for pkg in main_pkgs.difference(all_packages):
        print(f"Missing from build order: {pkg}")

    # create jira issues
    login = args.login
    if not args.login:
        login = os.environ.get("JIRA_LOGIN")
    token = args.token
    if not args.token:
        token = os.environ.get("JIRA_TOKEN")
    syncer = JiraSync(login, token, args.dry_run)
    syncer.sync(args.epic, args.target, stages)
