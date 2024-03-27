"""
File:           aggregate.py
Description:    A representation of aggregate. May be used to get a rough build order of packages or gather health
                information.
"""
from __future__ import annotations

import configparser
import logging
import subprocess
from collections import namedtuple
from multiprocessing import Pool
from pathlib import Path
from typing import Any, Optional

import yaml

from percy.render._renderer import RendererType
from percy.render.recipe import Feedstock, Package, Recipe, render


class PackageNode:
    """
    A node representing a package
    """

    aggregate = None
    nodes = {}
    bootstrap_nodes = {}

    def __init__(
        self,
        parent: "PackageNode",
        package_name: str,
        package: Package,
        is_run: bool,
    ):
        """PackageNode constructor

        :param parent: The parent node.
        :param package_name: The package name.
        :param package: The corresponding rendered package.
        :param is_run: If this is coming from a run dependency.
        """
        self.parents = set([parent])
        self.package_name = package_name
        self.package = package
        self.feedstock = self.aggregate.packages[package_name].git_info
        self.is_run = False
        if is_run:
            self.is_run = True
        if parent:
            self.weight = parent.weight + 1
        else:
            self.weight = 0
        self.children = set()
        logging.debug("New node %s", package_name)

    @classmethod
    def init(cls, aggregate: "Aggregate"):
        """
        Initialize a dependency tree.

        :param aggregate: The aggregate object.
        """
        PackageNode.aggregate = aggregate
        PackageNode.nodes = {}
        PackageNode.bootstrap_nodes = {}

    @classmethod
    def make_node(
        cls,
        package_name: str,
        walk_up_sections: tuple[str] = ("build", "host", "run"),
        origin_section: str = "run",
        parent: "PackageNode" = None,
    ) -> "PackageNode":
        """
        Make a node representing a package.

        :param package_name: The name of the package.
        :param walk_up_sections: Call make_node on dependencies from these sections.
        :param origin_section: If the package was used in a run section or other. Defaults to "run".
        :param parent: Parent node. Defaults to None.

        :returns: PackageNode: The package node.
        """

        node = None
        package_name = package_name.strip()
        is_run = origin_section == "run"

        def check_cycle(package_name, parent, ancestors=None):
            if ancestors is None:
                ancestors = []
            if parent:
                if package_name == parent.package_name:
                    return [parent.package_name] + ancestors
                else:
                    for p in parent.parents:
                        r = check_cycle(package_name, p, [parent.package_name] + ancestors)
                        if package_name in r:
                            return r
            return ancestors

        package = PackageNode.aggregate.packages.get(package_name, None)
        if not package:
            logging.warning("No information for %s", package_name)
        else:
            # check cycle
            cycle = check_cycle(package_name, parent)
            if cycle:
                logging.warning("CYCLE: %s", "->".join(cycle + [package_name]))

            if package_name in PackageNode.nodes:
                # existing package - update edges
                node = PackageNode.nodes[package_name]
                if not cycle:
                    node.parents.add(parent)
                if is_run:
                    node.is_run = True
                if parent:
                    node._update_weight(parent.weight)  # pylint: disable=protected-access
            else:
                # new package
                node = cls(parent, package_name, package, is_run)
                PackageNode.nodes[package_name] = node
                if walk_up_sections:
                    node._walk_up_requirements(walk_up_sections)  # pylint: disable=protected-access

            if parent:
                # update parent edge
                if not cycle:
                    parent.children.add(node)
                else:
                    PackageNode.bootstrap_nodes[package_name] = node

        return node

    def _update_weight(self, base_weight):
        if self.weight < (base_weight + 1):
            self.weight = base_weight + 1
            for child in self.children:
                child._update_weight(self.weight)  # pylint: disable=protected-access

    def __str__(self):
        return repr(self)

    def __repr__(self):
        return self.package_name

    def __hash__(self):
        return hash((self.package_name))

    def __eq__(self, other):
        if not isinstance(other, type(self)):
            return NotImplemented
        return self.package_name == other.package_name

    def _walk_up_requirements(self, walk_up_sections):
        for section in walk_up_sections:
            for dep in self.package[section]:
                PackageNode.make_node(dep.pkg, walk_up_sections, section, self)


def _render(
    feedstock_repo: Feedstock, recipe_path: Path, subdir, python, others, renderer
) -> tuple[Feedstock, list[Recipe]]:
    try:
        rendered_recipes = render(recipe_path, subdir, python, others, renderer=renderer)
    except Exception as exc:  # pylint: disable=broad-exception-caught
        logging.error("Render issue %s : %s", feedstock_repo.name, exc)
        rendered_recipes = []
    return feedstock_repo, rendered_recipes


FeedstockGitRepo = namedtuple("FeedstockGitRepo", ["name", "git_url", "branch", "path"])


class Aggregate:
    """An object to handle a repository of feedstocks.

    :ivar local_path: Aggregate path.
    :ivar git_url: Aggregate git url.
    :ivar git_branch: Aggregate git branch.
    :ivar packages: Rendered packages. (Populated after calling load_local_feedstocks.)
    :ivar feedstocks: Feedstocks. (Populated after calling load_local_feedstocks.)
    """

    def __init__(self, aggregate_path: str, manifest_path: Optional[str] = None):
        """Constructor

        :param aggregate_path: Aggregate local path.
        :param manifest_path:  (Optional) Path to the manifest file
        """

        # get local aggregate info
        self.local_path = Path(aggregate_path)
        x = subprocess.run(
            ["git config --get remote.origin.url"],
            capture_output=True,
            shell=True,
            encoding="utf-8",
            cwd=self.local_path,
            check=False,  # Default behavior, fails silently
        )
        self.git_url = x.stdout.strip().replace("git@github.com:", "https://github.com/")
        x = subprocess.run(
            ["git rev-parse --abbrev-ref HEAD"],
            capture_output=True,
            shell=True,
            encoding="utf-8",
            cwd=self.local_path,
            check=False,  # Default behavior, fails silently
        )
        self.git_branch = x.stdout.strip()

        # read git submodules info
        self.submodules = {}
        if not manifest_path:
            aggregate_gitmodules = self.local_path / ".gitmodules"
            config = configparser.ConfigParser()
            config.read(aggregate_gitmodules)
            for section in config.sections():
                path = config[section].get("url").rsplit(".git")[0][1:]
                name = section.split('"')[1]
                git_url = f"{self.git_url.rsplit('/')[0]}/{name}.git"
                git_branch = config[section].get("branch", "main")
                self.submodules[name] = FeedstockGitRepo(name, git_url, git_branch, path)
        else:
            try:
                with open(Path(manifest_path), "r", encoding="utf-8") as file:
                    manifest = yaml.load(file, Loader=yaml.SafeLoader)
            except FileNotFoundError as e:
                raise FileNotFoundError(f"Manifest file not found at {manifest_path}") from e
            except yaml.YAMLError as e:
                raise ValueError(f"Error parsing YAML: {manifest_path}") from e

            for name, git_info in manifest["feedstocks"].items():
                self.submodules[name] = FeedstockGitRepo(name, None, git_info["branch"], None)

        # packages, feedstocks and groups
        self.packages: dict[str, Package] = {}
        self.feedstocks: dict[str, Feedstock] = {}
        self.groups: dict[str, list[Feedstock]] = {}

    def _get_feedstock_git_repo(self, feedstock_path_rel: Path) -> Feedstock:
        """Get Feedsotck object from feedstock local path.

        :param feedstock_path_rel: Feedsotck local path.

        :returns Feedstock: Feedstock representation.
        """
        feedstock = self.submodules.get(feedstock_path_rel.name, None)
        if feedstock:
            return feedstock
        else:
            return FeedstockGitRepo(
                feedstock_path_rel.name,
                self.git_url,
                self.git_branch,
                f"./{str(feedstock_path_rel)}",
            )

    def load_local_feedstocks(
        self,
        subdir: str = "linux-64",
        python: str = "3.10",
        others: Optional[dict[str, Any]] = None,
        renderer: Optional[RendererType] = None,
    ) -> dict[str, Package]:
        """Load aggregate feedstocks.

            Only load feedstocks being on master or main branch.
            If feedstocks are already loaded, rendered packages will be merged.

            This populates attributes packages and feedstocks.

        :param subdir:     The subdir for which to load the feedstocks. Defaults to "linux-64".
        :param python:     The python version for which to load the feedstocks. Defaults to "3.10".
        :param others:     A variant dictionary. E.g. {"blas_impl" : "openblas"} Defaults to None.
        :param renderer:   Rendering engine to use to interpret YAML

        :returns:    Rendered packages contained in aggregate (also available as aggregate packages attribute).
        """

        if others is None:
            others = {"r_implementation": "r-base"}
            if subdir == "win-64":
                others["rust_compiler"] = "rust"
            else:
                others["blas_impl"] = "openblas"

        aggregate_path = self.local_path
        to_render: list[tuple[Feedstock, Path, str, str, dict[str, Any], RendererType | None]] = []
        for recipe_path in aggregate_path.glob("**/meta.yaml"):
            # base feedstock info
            feedstock_path_rel = recipe_path.relative_to(aggregate_path).parent
            if feedstock_path_rel.name == "recipe":
                feedstock_path_rel = feedstock_path_rel.parent
            feedstock_name = feedstock_path_rel.parts[0]
            feedstock_repo = self._get_feedstock_git_repo(feedstock_path_rel)

            # attempt to process only the latest feedstocks
            if (
                feedstock_repo.branch
                not in (
                    "master",
                    "main",
                )
                and not feedstock_repo.git_url.endswith("aggregate.git")
                and not feedstock_name == f"python-{python}-feedstock"
            ):
                logging.warning(
                    "Skipping feedstock %s pinned to branch %s (%s)",
                    feedstock_name,
                    feedstock_repo.branch,
                    feedstock_repo.git_url,
                )
                continue
            if feedstock_name.startswith("ctng-compilers-"):
                logging.warning(
                    "Skipping feedstock %s now replaced by binutils-feedstock and gcc_toolchain-feedstock",
                    feedstock_name,
                )
                continue
            if feedstock_name.startswith("ctng-compiler-activation-"):
                logging.warning(
                    "Skipping feedstock %s now replaced by gcc_activation-feedstock",
                    feedstock_name,
                )
                continue
            if "_cos6_" in feedstock_name or "_cos7_" in feedstock_name or "_amzn2_" in feedstock_name:
                logging.warning("Skipping cdt %s", feedstock_name)
                continue

            # add to render list
            to_render.append((feedstock_repo, recipe_path, subdir, python, others, renderer))

        # render recipes
        with Pool() as pool:
            results = pool.starmap(_render, to_render)
            for feedstock_repo, rendered_recipes in results:
                for recipe in rendered_recipes:
                    # read recipe packages info
                    if recipe and not recipe.skip:
                        for name, rendered_pkg in recipe.packages.items():
                            rendered_pkg.git_info = feedstock_repo
                            if name in self.packages:
                                logging.debug(
                                    "Merging deps of other variant %s : %s : %s",
                                    recipe.variant_id,
                                    feedstock_repo.name,
                                    name,
                                )
                                self.packages[name].merge_deps(rendered_pkg)
                            else:
                                self.packages[name] = rendered_pkg

        # process run_exports
        for rendered_pkg in self.packages.values():
            for dep in rendered_pkg.host:
                if dep.pkg in self.packages:
                    for run_export in self.packages[dep.pkg].run_exports:
                        if (
                            "*" not in rendered_pkg.ignore_run_exports
                            and run_export not in rendered_pkg.ignore_run_exports
                        ):
                            rendered_pkg.run.add(run_export)

        # fill feedstocks
        for name, rendered_pkg in self.packages.items():
            v = self.feedstocks.setdefault(
                rendered_pkg.git_info.name,
                Feedstock(
                    rendered_pkg.git_info.name,
                    rendered_pkg.git_info.git_url,
                    rendered_pkg.git_info.branch,
                    rendered_pkg.git_info.path,
                    {},
                    0,
                ),
            )
            v.packages[name] = rendered_pkg

        # fill groups
        for name, feedstock in self.feedstocks.items():
            v = self.groups.setdefault(next(iter(feedstock.packages.values())).group, [])
            v.append(feedstock)

        return self.packages

    def package_to_feedstock_path(self) -> dict[str, str]:
        """Returns a mapping of package name to feedstock path.

        :returns: Mapping of package name to feedstock path.
        """
        package_to_feedstock = {}
        for name, package in self.packages.items():
            package_to_feedstock.setdefault(name, []).append(package.git_info.path)
        return dict(sorted(package_to_feedstock.items()))

    def _build_order(self) -> dict[str, Feedstock]:
        """Computes a feedstock build order.

        :returns: An ordered dictionary of Feedstock.
        """
        # feedstock build order
        feedstocks = {}
        for pkg, node in sorted(
            PackageNode.nodes.items(),
            key=lambda x: (1.0 / (x[1].weight + 1), x[1].feedstock),
        ):
            v = feedstocks.setdefault(
                node.feedstock,
                Feedstock(
                    node.feedstock.name,
                    node.feedstock.git_url,
                    node.feedstock.branch,
                    node.feedstock.path,
                    {},
                    0,
                ),
            )
            v.weight = max(v.weight, node.weight)
            v.packages[pkg] = self.packages[pkg]
        return sorted(feedstocks.values(), key=lambda x: (1.0 / (x.weight + 1), x.name))

    def get_build_order(
        self,
        target_groups: Optional[list[str]] = None,
        target_feedstocks: Optional[list[str]] = None,
        target_packages: Optional[list[str]] = None,
        drop_noarch: bool = False,
        no_upstream: bool = False,
        walk_up_sections: tuple[str] = ("build", "host", "run"),
    ) -> dict[str, Feedstock]:
        """Creates a Feedstock builder order based on a list of leaf packages.

        :param target_groups: List of target groups.
        :param target_feedstocks: List of target feedstocks.
        :param target_packages: List of leaf package names.
        :param drop_noarch: Whether to drop noarch packages. Defaults to False.
        :param no_upstream: Whether to drop unspecified packages. Defaults to False.
        :param walk_up_sections: Walk up sections.

        :returns: An ordered dictionary of Feedstock.
        """
        if target_groups is None:
            target_groups = []
        if target_feedstocks is None:
            target_feedstocks = []
        if target_packages is None:
            target_packages = []

        PackageNode.init(self)

        # expand target_packages with packages from target_feedstocks and target_groups
        target_packages = list(target_packages)
        target_feedstocks = list(target_feedstocks)
        target_groups = list(target_groups)
        for group in target_groups:
            if group in self.groups:
                target_feedstocks.extend([f.name for f in self.groups[group]])
        for feedstock in target_feedstocks:
            if feedstock in self.feedstocks:
                target_packages.extend(self.feedstocks[feedstock].packages.keys())

        # build graph walking up from packages
        for pkg in target_packages:
            PackageNode.make_node(pkg, walk_up_sections)

        # drop graph nodes not having package as a run dependency
        if no_upstream:
            PackageNode.nodes = {k: v for k, v in PackageNode.nodes.items() if k in target_packages}

        # drop noarch graph nodes
        if drop_noarch:
            PackageNode.nodes = {k: v for k, v in PackageNode.nodes.items() if not v.package.is_noarch}

        # feedstock build order
        return self._build_order()

    def get_depends_build_order(
        self,
        target_groups: Optional[list[str]] = None,
        target_feedstocks: Optional[list[str]] = None,
        target_packages: Optional[list[str]] = None,
        package_allowlist: Optional[list[str]] = None,
        feedstock_blocklist: Optional[list[str]] = None,
        drop_noarch: bool = False,
        walk_up_sections: tuple[str] = ("build", "host", "run"),
    ) -> dict[str, Feedstock]:
        """Creates a Feedstock builder order based on packages having target as a dependency.

        :param target_groups: List of target groups.
        :param target_feedstocks: List of target feedstocks.
        :param target_packages: List of target packages.
        :param package_allowlist: List of package names to consider. Defaults to [].
        :param feedstock_blocklist: List of feedstock names to exclude. Defaults to [].
        :param drop_noarch: Whether to drop noarch packages. Defaults to False.
        :param walk_up_sections: Walk up sections

        :returns: An ordered dictionary of Feedstock.
        """
        if target_groups is None:
            target_groups = []
        if target_feedstocks is None:
            target_feedstocks = []
        if target_packages is None:
            target_packages = []
        if package_allowlist is None:
            package_allowlist = []
        if feedstock_blocklist is None:
            feedstock_blocklist = []

        PackageNode.init(self)

        # expand target_packages with packages from target_feedstocks and target_groups
        target_packages = list(target_packages)
        target_feedstocks = list(target_feedstocks)
        target_groups = list(target_groups)
        for group in target_groups:
            if group in self.groups:
                target_feedstocks.extend([f.name for f in self.groups[group]])
        for feedstock in target_feedstocks:
            if feedstock in self.feedstocks:
                target_packages.extend(self.feedstocks[feedstock].packages.keys())
        logging.info(
            "get_depends_build_order groups:%s feedstocks:%s packages:%s",
            target_groups,
            target_feedstocks,
            target_packages,
        )

        # build graph with packages having package as a dependency
        for target in target_packages:
            for name, package in self.packages.items():
                if (
                    not package_allowlist or name in package_allowlist
                ) and package.git_info.name not in feedstock_blocklist:
                    for dep in package.run:
                        if dep.pkg == target:
                            PackageNode.make_node(name, walk_up_sections, "run")

        # drop graph nodes in blocklist or not in allowlist
        PackageNode.nodes = {
            k: v
            for k, v in PackageNode.nodes.items()
            if (not package_allowlist or k in package_allowlist) and v.feedstock.name not in feedstock_blocklist
        }

        # drop graph nodes not having package as a run dependency
        PackageNode.nodes = {
            k: v
            for k, v in PackageNode.nodes.items()
            if any(v.package.has_dep("run", target) for target in target_packages)
        }

        # drop noarch graph nodes
        if drop_noarch:
            PackageNode.nodes = {k: v for k, v in PackageNode.nodes.items() if not v.package.is_noarch}

        # feedstock build order
        return self._build_order()
