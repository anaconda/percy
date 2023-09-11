.PHONY: clean clean-test clean-pyc clean-build clean-other help test test-cov pre-commit lint format analyze
.DEFAULT_GOAL := help

SHELL := /bin/bash -o pipefail -o errexit

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
LINTER_FILES := percy/render/recipe_parser.py

clean: clean-build clean-cov clean-docs clean-pyc clean-test clean-other ## remove all build, test, coverage and Python artifacts

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
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

install: clean	## install the package to the active Python's site-packages
	pip install .

dev: clean  	## install the package's development version
	pip install -e .

pre-commit:     ## runs pre-commit against files
	pre-commit run --all-files

test:			## runs test cases
	python3 -m pytest --capture=no percy/tests/

test-cov:		## checks test coverage requirements
	python3 -m pytest --cov-config=.coveragerc --cov=percy percy/tests/ --cov-fail-under=10 --cov-report term-missing

lint:			## runs the linter against the project
	pylint --rcfile=.pylintrc $(LINTER_FILES)

format:			## runs the code auto-formatter
	isort --profile black --line-length=80 $(LINTER_FILES)
	black --line-length=80 $(LINTER_FILES)

analyze:		## runs static analyzer on the project
	mypy --config-file=.mypy.ini $(LINTER_FILES)
