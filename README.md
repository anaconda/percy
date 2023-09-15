# Percy

  This library is able to render recipes for all variants (subdir, python... combination).
  When given a directory of feedstocks (aggregate), it can produce a rough build order.
  It can be used as a command line tool but is mostly intended to be used as a library.

  Why not using conda build to render?
  conda build resolves dependencies to qualify versions and process run_exports and other keys.
  This library renders without querying a channel, and is more suited for development phase.


  ## Installation

    conda create -n percy -c cbouss/label/percy percy

  ## Installation for development

    conda env create -f environment.yaml --name percy
    conda activate percy
    pip install -e .

  ## Command line examples

  From within a feedstock:

    percy recipe --help

  - Render the recipe

          percy recipe render --help
          percy recipe render -s linux-64 -p 3.10 -k blas_impl openblas

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

  ## Other examples

  ### Recipe patching

  See percy/examples/patch

  ### Python 3.11 buildout

  See percy/examples/py311 [here](percy/examples/py311/README.md)

  ### Build order examples

  See percy/examples/blts

  ### Test install examples

    pytest -n auto --junit-xml="test_install.xml" --html="test_install.html" --self-contained-html ./percy/examples/preinstall/test_install.py --feedstock=./gensim-feedstock


  ### Find pinning issues in aggregate

    python ./percy/examples/aggregate_deps_issue_finder/aggregate_deps_issue_finder.py
