#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cython-feedstock.mark ]]; then
    if [[ -d cython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cython-feedstock.mark ) && true) || ( (echo "cython-feedstock" >>failed.13 ) && (echo "cython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cython-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f docutils-feedstock.mark ]]; then
    if [[ -d docutils-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docutils-feedstock >d 2>&1 && rm -f d && ( echo "done" >>docutils-feedstock.mark ) && true) || ( (echo "docutils-feedstock" >>failed.13 ) && (echo "docutils-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docutils-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f platformdirs-feedstock.mark ]]; then
    if [[ -d platformdirs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./platformdirs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>platformdirs-feedstock.mark ) && true) || ( (echo "platformdirs-feedstock" >>failed.13 ) && (echo "platformdirs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "platformdirs-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f pyrsistent-feedstock.mark ]]; then
    if [[ -d pyrsistent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyrsistent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyrsistent-feedstock.mark ) && true) || ( (echo "pyrsistent-feedstock" >>failed.13 ) && (echo "pyrsistent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyrsistent-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f requests-feedstock.mark ]]; then
    if [[ -d requests-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-feedstock.mark ) && true) || ( (echo "requests-feedstock" >>failed.13 ) && (echo "requests-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f traitlets-feedstock.mark ]]; then
    if [[ -d traitlets-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./traitlets-feedstock >d 2>&1 && rm -f d && ( echo "done" >>traitlets-feedstock.mark ) && true) || ( (echo "traitlets-feedstock" >>failed.13 ) && (echo "traitlets-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "traitlets-feedstock not present" >>failed.13
    fi
fi

