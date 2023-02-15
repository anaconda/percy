#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cffi-feedstock.mark ]]; then
    if [[ -d cffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cffi-feedstock.mark ) && true) || ( (echo "cffi-feedstock" >>failed.6 ) && (echo "cffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cffi-feedstock not present" >>failed.6
    fi
fi


if [[ ! -f setuptools-rust-feedstock.mark ]]; then
    if [[ -d setuptools-rust-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-rust-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-rust-feedstock.mark ) && true) || ( (echo "setuptools-rust-feedstock" >>failed.6 ) && (echo "setuptools-rust-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-rust-feedstock not present" >>failed.6
    fi
fi

