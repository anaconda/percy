#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f setuptools-feedstock.mark ]]; then
    if [[ -d setuptools-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-feedstock.mark ) && true) || ( (echo "setuptools-feedstock" >>failed.4 ) && (echo "setuptools-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-feedstock not present" >>failed.4
    fi
fi


if [[ ! -f setuptools-52.0.0-feedstock.mark ]]; then
    if [[ -d setuptools-52.0.0-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-52.0.0-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-52.0.0-feedstock.mark ) && true) || ( (echo "setuptools-52.0.0-feedstock" >>failed.4 ) && (echo "setuptools-52.0.0-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-52.0.0-feedstock not present" >>failed.4
    fi
fi

