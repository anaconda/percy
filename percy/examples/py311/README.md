
    <arch> is one of linux-64, linux-aarch64, linux-s390x, linux-ppc64le, osx-64, osx-arm64, win-64

# Building a new python - ALREADY DONE for all architectures and uploaded to defaults
  
- Open a PR on python for the new python major release. Example: https://github.com/AnacondaRecipes/python-feedstock/pull/88
- Update the recipe, build scripts...
- Update conda_build_config.yaml
- Configure a release channel in abs.yaml
- Set bootstrap mode in meta.yaml
- Build python 
- Then, build in order: wincertstore, certifi, setuptools, wheel, pip.
  - https://github.com/AnacondaRecipes/wincertstore-feedstock/pull/2
  - https://github.com/AnacondaRecipes/certifi-feedstock/pull/8
  - https://github.com/AnacondaRecipes/setuptools-feedstock/pull/48
  - https://github.com/AnacondaRecipes/wheel-feedstock/pull/4
  - https://github.com/AnacondaRecipes/pip-feedstock/pull/14
- Unset bootstrap mode in meta.yaml
- Build python a final time.

**The resulting packages are in py311_bs/label/release.**

# Building packages depending on python

## Connect to a dev-instance and set up a private key for github
    ssh -i ~/.ssh/id_ed25519 ec2-user@3.238.25.29

## Get a remove checkout of aggregate
    conda create -n percy git python=3.10
    conda activate percy
    git clone git@github.com:AnacondaRecipes/aggregate.git
    cd aggregate
    git checkout py311-buildout
    git submodule update --init --recursive

## Generate new python build scripts
    
    Given a local aggregate checkout of branch py311-buildout at ../../../aggregate/

    cd percy/examples/py311/
    python gen_python_build_order.py -a ../../../aggregate/ -s <arch> -r 3.10 -p 3.11 -n 1.22
    chmod +x <arch>/*.sh
    cp <arch>/* to aggregate/ checkout on target architecture.

## Start a docker instance
    cd ~ && docker run -ti --rm -v `pwd`:/work public.ecr.aws/y0o4y9o3/anaconda-pkg-build:latest /bin/bash
    [root@9ad2d267fbd4 /]# conda init bash
    [root@9ad2d267fbd4 /]# bash 
    (base) [root@9ad2d267fbd4 /]# cd work/aggregate/

## Run the build
    (base) [root@9ad2d267fbd4 aggregate]# ./python_3.11_<arch>_build_all.sh
    (base) [root@9ad2d267fbd4 aggregate]# more failed.*
    
    
### Fix any occurring issues

It may be that the package does not support 3.11. Either update to a new version if available, or add to the block list in config.py.

It may be that a package depends on an older version of another package. Add a submodule pinned to that version and update extra versions in config.py.

## Test packages

  Execute the tests of each built package. If the test passes, move it to a separate fodler e.g.: /root/ci_py311_tested/.
  
  This is done by running the test package script. Example:
  
    (base) [root@9ad2d267fbd4 aggregate]# ./test_packages.sh ../ci_py311/<arch>/ ../ci_py311_tested/

## Show current progress
 
    (base) [root@9ad2d267fbd4 aggregate]# ./tally.sh

## Test that packages are installable

  conda install pytest pytest-xdist pytest-html pyyaml
  pytest -n auto --junit-xml="test_install.xml" --html="test_install.html" --self-contained-html test_install.py

## Save packages

  Transmute tar.bz2 packages in ci_py311_tested/ to .conda
  (base) [root@9ad2d267fbd4 /]# cd work/ci_py311_tested/
  (base) [root@9ad2d267fbd4 ci_py311_tested]# cph -t .tar.bz2 .conda
  
  Copy packages to zeus at /var/perserverance/py311/<arch>/.

## Upload packages

  Once all architectures are present, upload all packages to default.

## Final status report

  Get a final list of packages not build out (obsolete, not 3.11 ready, too heavy, added to default after buildout...).
