# Percy

  Installation
  
    pip install .
    
  Render examples
  
    prender --help
    prender ./numpy-feedstock/recipe/meta.yaml
    prender ./numpy-feedstock/recipe/meta.yaml -p 3.10 -s linux-aarch64
    prender ./numpy-feedstock/recipe/meta.yaml -p 3.10 -s linux-64 -s osx-64 -s win-64 -k blas_impl mkl

  Build order examples

    See percy/examples/blts and percy/examples/py311