# Percy

## Table of Contents
<!-- TOC -->

- [Percy](#percy)
    - [Table of Contents](#table-of-contents)
    - [Overview](#overview)
- [Getting Started](#getting-started)
    - [General Installation](#general-installation)
        - [Install into your current environment](#install-into-your-current-environment)
        - [Install into a custom percy environment](#install-into-a-custom-percy-environment)
- [Developer Notes](#developer-notes)
        - [Running pre-commit checks](#running-pre-commit-checks)
    - [Command line examples](#command-line-examples)
    - [Release process](#release-process)
    - [Other examples](#other-examples)
        - [Recipe patching](#recipe-patching)
        - [Build order examples](#build-order-examples)
        - [Test install examples](#test-install-examples)
        - [Find pinning issues in aggregate](#find-pinning-issues-in-aggregate)

<!-- /TOC -->
## Overview

This library is able to render recipes for all variants (subdir, python... combination).
When given a directory of feedstocks (aggregate), it can produce a rough build order.
It can be used as a command line tool but is mostly intended to be used as a library.

Why not using conda build to render?
conda build resolves dependencies to qualify versions and process run_exports and other keys.
This library renders without querying a channel, and is more suited for development phase.

Percy is used by:

- https://github.com/anaconda/anaconda-linter as a recipe processor.
- https://github.com/anaconda/perseverance-python-buildout as a build order generator.

**NOTE: The `parser/` module has moved and will be eventually deprecated from this project.**
**The module now resides in [conda-incubator](https://github.com/conda-incubator/conda-recipe-manager).**

# Getting Started

## General Installation

### Install into a pre-made environment using distro tools
```sh
conda install distro-tooling::percy -y
```
or
```sh
conda install -c distro-tooling percy -y
```

### Install into your current environment
```sh
make install
```

### Install into a custom percy environment
```sh
make environment
conda activate percy
```

# Developer Notes
```sh
make dev
conda activate percy
```
The `dev` recipe will configure a `conda` environment named `percy` with
development tools installed.

`pre-commit` is automatically installed and configured for you to run a number
of automated checks on each commit.

**NOTE:** As of writing, only a handful of files are checked by the linter and
`pre-commit`. **ANY NEW FILES** should be added to these checks.

### Running pre-commit checks
The provided `Makefile` also provides a handful of convenience recipes for
running all or part of the `pre-commit` automations:
1. `make test`: Runs all the unit tests
1. `make test-cov`: Reports the current test coverage percentage and indicates
   which lines are currently untested.
1. `make lint`: Runs our `pylint` configuration, based on Google's Python
   standards.
1. `make format`: Automatically formats code
1. `make analyze`: Runs the static analyzer, `mypy`.
1. `make pre-commit`: Runs all the `pre-commit` checks

## Command line examples

From within a feedstock:

  percy recipe --help

- Render the recipe

        percy recipe render --help
        percy recipe render -s linux-64 -p 3.10 -k blas_impl openblas

- Update the recipe

        percy recipe sync

- Identify if the feedstock is pinned to the latest, compared to defautls:

        percy recipe outdated --help
        percy recipe outdated

From within aggregate:

Queries can be performed on feedstock names (-f), package names (-pkg) and group names (-g).
A group name corresponds to the github/gitlab... organization name, extracted from dev_url.

  percy aggregate --help

- When updating a package pinned in cbc, show rebuild order:

        percy aggregate downstream --help
        percy aggregate downstream -f libxml2-feedstock

- When working on a group of packages, show build order:

        percy aggregate order --help
        percy aggregate order -f dask-feedstock -f dask-core-feedstock -f distributed-feedstock
        percy aggregate order -g dask

- When building from scratch, show what to build based on leaf packages:

        percy aggregate upstream --help
        percy aggregate upstream -f pytorch-feedstock

- Identify which feedstocks are not pinned to the latest, compared to defautls:

        percy aggregate outdated --help
        percy aggregate outdated

## Release process
Here is a rough outline of how to conduct a release of this project:
1. Update `CHANGELOG.md`
1. Update the version number in `pyproject.toml`
1. Ensure `environment.yaml` is up to date with the latest dependencies
1. Create a new release on GitHub with a version tag.
1. The Anaconda packaging team will need to update
[the feedstock](https://github.com/AnacondaRecipes/percy-feedstock)
and [aggregate](https://github.com/AnacondaRecipes/aggregate) and publish to `distro-tooling`

## Other examples

### Recipe patching

See percy/examples/patch

### Build order examples

See percy/examples/blts

### Test install examples

  pytest -n auto --junit-xml="test_install.xml" --html="test_install.html" --self-contained-html ./percy/examples/preinstall/test_install.py --feedstock=./gensim-feedstock


### Find pinning issues in aggregate

  python ./percy/examples/aggregate_deps_issue_finder/aggregate_deps_issue_finder.py
