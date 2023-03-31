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
    percy recipe render --help
    percy recipe outdated --help
    percy aggregate downstream --help
    percy aggregate order --help
    percy aggregate upstream --help
    percy aggregate outdated --help

  ## Other examples
  
  ### Python 3.11 buildout

  See percy/examples/py311 [here](percy/examples/py311/README.md)

  ### Build order examples

  See percy/examples/blts

  ### Test install examples

    pytest -n auto --junit-xml="test_install.xml" --html="test_install.html" --self-contained-html ./percy/examples/preinstall/test_install.py --feedstock=./gensim-feedstock


  ### Find pinning issues in aggregate

    python ./percy/examples/aggregate_deps_issue_finder/aggregate_deps_issue_finder.py
