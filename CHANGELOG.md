# Changelog
Note: version releases in the 0.x.y range may introduce breaking changes.

## 0.2.0
- Remove previous parser tree code and depend on conda-recipe-manager instead.
- Remove `get_read_only_parser()` function.

## 0.1.7
- Revert exclusion of `clang-compiler-activation-feedstock` from locally loaded feedstocks since it's actually active and needed.

## 0.1.6
- Exclude `ctng-compiler-activation-feedstock`, `llvm-compilers-feedstock`, `clang-compilers-feedstock` and `clang-compiler-activation-feedstock` from locally loaded feedstocks because they are superseeded by other feedstocks.

## 0.1.5
- Adds `get_read_only_parser()` function.
- Fixes some comments.

## 0.1.4
- Adds 4 new functions to the `percy` parser
  - 2 of these make it easier to work with dependencies
  - 2 of these make it easier to manipulate selectors
- Fixes bug with `get_value()` and related functions that caused a list of 1 primitive value to return as a primitive
  value. This provides better type safety, even if it is likely against the YAML spec.

## 0.1.3
- Limiting the project to Python >=3.11 for easier maintenance
- Fixes and improves our GitHub Actions workflows to our latest standards
- Removes the current recipe file in favor of using the feedstock as our source of truth.

## 0.1.2
- Fixes bug with reporting typing (`py.typed` was in the wrong location)
- Fixes and improves infrastructure

## 0.1.1
- Adds `CHANGELOG.md`
- Bug fixes
- README updates
