#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cffi-feedstock.mark ]]; then
    if [[ -d cffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cffi-feedstock.mark ) && true) || ( (echo "cffi-feedstock" >>failed.7 ) && (echo "cffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cffi-feedstock not present" >>failed.7
    fi
fi


if [[ ! -f packaging-feedstock.mark ]]; then
    if [[ -d packaging-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./packaging-feedstock >d 2>&1 && rm -f d && ( echo "done" >>packaging-feedstock.mark ) && true) || ( (echo "packaging-feedstock" >>failed.7 ) && (echo "packaging-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "packaging-feedstock not present" >>failed.7
    fi
fi


if [[ ! -f setuptools-rust-feedstock.mark ]]; then
    if [[ -d setuptools-rust-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-rust-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-rust-feedstock.mark ) && true) || ( (echo "setuptools-rust-feedstock" >>failed.7 ) && (echo "setuptools-rust-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-rust-feedstock not present" >>failed.7
    fi
fi


if [[ ! -f tomli-feedstock.mark ]]; then
    if [[ -d tomli-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tomli-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tomli-feedstock.mark ) && true) || ( (echo "tomli-feedstock" >>failed.7 ) && (echo "tomli-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tomli-feedstock not present" >>failed.7
    fi
fi

