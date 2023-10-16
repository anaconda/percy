# The `.ONESHELL` and setting `SHELL` allows us to run commands that require
# `conda activate`
.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -o pipefail -o errexit
CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate
# Resolve the path to `python3` and store it in a variable. Always invoke
# `python` using this variable. This prevents a nasty scenario where the GitHub
# Actions container fails to find `python` or `python3`, when running `make`
# commands.
PYTHON3 := $(shell which python3)

.PHONY: clean clean-env clean-test clean-pyc clean-build clean-other help dev test test-debug test-cov pre-commit lint format analyze
.DEFAULT_GOAL := help

CONDA_ENV_NAME ?= percy

define BROWSER_PYSCRIPT
import os, webbrowser, sys

from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"

# For now, most tools only run on new files, not the entire project.
LINTER_FILES := percy/parser/*.py

clean: clean-cov clean-build clean-env clean-pyc clean-test clean-other ## remove all build, test, coverage and Python artifacts

clean-cov:
	@rm -rf .coverage
	@rm -rf htmlcov
	@rm -rf reports/{*.html,*.png,*.js,*.css,*.json}
	@rm -rf pytest.xml
	@rm -rf pytest-coverage.txt

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-env:					## remove conda environment
	conda remove -y -n $(CONDA_ENV_NAME) --all

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache

clean-other:
	rm -fr *.prof
	rm -fr profile.html profile.json

help:
	$(PYTHON3) -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

install: clean	## install the package to the active Python's site-packages
	pip install .

environment:    ## handles environment creation
	conda env create -f environment.yaml --name $(CONDA_ENV_NAME) --force
	conda run --name $(CONDA_ENV_NAME) pip install .

dev: clean		## install the package's development version to a fresh environment
	conda env create -f environment.yaml --name $(CONDA_ENV_NAME) --force
	conda run --name $(CONDA_ENV_NAME) pip install -e .
	$(CONDA_ACTIVATE) percy && pre-commit install

pre-commit:     ## runs pre-commit against files. NOTE: older files are disabled in the pre-commit config.
	pre-commit run --all-files

test:			## runs test cases
	$(PYTHON3) -m pytest --capture=no percy/tests/

test-debug:		## runs test cases with debugging info enabled
	$(PYTHON3) -m pytest -vv --capture=no percy/tests/

test-cov:		## checks test coverage requirements
	$(PYTHON3) -m pytest --cov-config=.coveragerc --cov=percy percy/tests/ --cov-fail-under=17 --cov-report term-missing

lint:			## runs the linter against the project
	pylint --rcfile=.pylintrc $(LINTER_FILES)

format:			## runs the code auto-formatter
	isort --profile black --line-length=120 percy
	black --line-length=120 percy

analyze:		## runs static analyzer on the project
	mypy --config-file=.mypy.ini $(LINTER_FILES)
