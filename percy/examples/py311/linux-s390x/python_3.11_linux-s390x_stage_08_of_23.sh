#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f attrs-feedstock.mark ]]; then
    if [[ -d attrs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./attrs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>attrs-feedstock.mark ) && true) || ( (echo "attrs-feedstock" >>failed.8 ) && (echo "attrs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "attrs-feedstock not present" >>failed.8
    fi
fi


if [[ ! -f cffi-feedstock.mark ]]; then
    if [[ -d cffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cffi-feedstock.mark ) && true) || ( (echo "cffi-feedstock" >>failed.8 ) && (echo "cffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cffi-feedstock not present" >>failed.8
    fi
fi


if [[ ! -f editables-feedstock.mark ]]; then
    if [[ -d editables-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./editables-feedstock >d 2>&1 && rm -f d && ( echo "done" >>editables-feedstock.mark ) && true) || ( (echo "editables-feedstock" >>failed.8 ) && (echo "editables-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "editables-feedstock not present" >>failed.8
    fi
fi


if [[ ! -f pathspec-feedstock.mark ]]; then
    if [[ -d pathspec-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pathspec-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pathspec-feedstock.mark ) && true) || ( (echo "pathspec-feedstock" >>failed.8 ) && (echo "pathspec-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pathspec-feedstock not present" >>failed.8
    fi
fi


if [[ ! -f pluggy-feedstock.mark ]]; then
    if [[ -d pluggy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pluggy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pluggy-feedstock.mark ) && true) || ( (echo "pluggy-feedstock" >>failed.8 ) && (echo "pluggy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pluggy-feedstock not present" >>failed.8
    fi
fi


if [[ ! -f setuptools-rust-feedstock.mark ]]; then
    if [[ -d setuptools-rust-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-rust-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-rust-feedstock.mark ) && true) || ( (echo "setuptools-rust-feedstock" >>failed.8 ) && (echo "setuptools-rust-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-rust-feedstock not present" >>failed.8
    fi
fi

