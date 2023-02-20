#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f docutils-feedstock.mark ]]; then
    if [[ -d docutils-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docutils-feedstock >d 2>&1 && rm -f d && ( echo "done" >>docutils-feedstock.mark ) && true) || ( (echo "docutils-feedstock" >>failed.11 ) && (echo "docutils-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docutils-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f hatchling-feedstock.mark ]]; then
    if [[ -d hatchling-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatchling-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatchling-feedstock.mark ) && true) || ( (echo "hatchling-feedstock" >>failed.11 ) && (echo "hatchling-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatchling-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f pytest-feedstock.mark ]]; then
    if [[ -d pytest-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-feedstock.mark ) && true) || ( (echo "pytest-feedstock" >>failed.11 ) && (echo "pytest-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f pytest-6-feedstock.mark ]]; then
    if [[ -d pytest-6-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-6-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-6-feedstock.mark ) && true) || ( (echo "pytest-6-feedstock" >>failed.11 ) && (echo "pytest-6-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-6-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f requests-feedstock.mark ]]; then
    if [[ -d requests-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-feedstock.mark ) && true) || ( (echo "requests-feedstock" >>failed.11 ) && (echo "requests-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f zipp-feedstock.mark ]]; then
    if [[ -d zipp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zipp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zipp-feedstock.mark ) && true) || ( (echo "zipp-feedstock" >>failed.11 ) && (echo "zipp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zipp-feedstock not present" >>failed.11
    fi
fi

