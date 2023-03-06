#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cryptography-feedstock.mark ]]; then
    if [[ -d cryptography-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cryptography-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cryptography-feedstock.mark ) && true) || ( (echo "cryptography-feedstock" >>failed.10 ) && (echo "cryptography-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cryptography-feedstock not present" >>failed.10
    fi
fi


if [[ ! -f hatchling-feedstock.mark ]]; then
    if [[ -d hatchling-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatchling-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatchling-feedstock.mark ) && true) || ( (echo "hatchling-feedstock" >>failed.10 ) && (echo "hatchling-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatchling-feedstock not present" >>failed.10
    fi
fi


if [[ ! -f pytest-feedstock.mark ]]; then
    if [[ -d pytest-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-feedstock.mark ) && true) || ( (echo "pytest-feedstock" >>failed.10 ) && (echo "pytest-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-feedstock not present" >>failed.10
    fi
fi


if [[ ! -f pytest-6-feedstock.mark ]]; then
    if [[ -d pytest-6-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-6-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-6-feedstock.mark ) && true) || ( (echo "pytest-6-feedstock" >>failed.10 ) && (echo "pytest-6-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-6-feedstock not present" >>failed.10
    fi
fi

