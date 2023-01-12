# Percy

  This library is able to render recipes for all variants (subdir, python... combination). 
  When given a directory of feedstocks (aggregate), it can produce a rough build order.
  It can be used as a command line tool but is mostly intended to be used as a library.
  
  Why not using conda build to render? 
  conda build can only render for the architecture it is being run from. 
  conda build resolves dependencies to qualify versions and process run_exports and other keys.
  This library renders without querying a channel, and is more suited for development phase.


  ## Installation
  
    pip install .
    
  ## Render examples
  
    prender --help
    prender ./numpy-feedstock/recipe/meta.yaml
    prender ./numpy-feedstock/recipe/meta.yaml -p 3.10 -s linux-aarch64
    prender ./numpy-feedstock/recipe/meta.yaml -p 3.10 -s linux-64 -s osx-64 -s win-64 -k blas_impl mkl

  ## Build order examples

    See percy/examples/blts and percy/examples/py311
