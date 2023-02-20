#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cython-feedstock.mark ]]; then
    if [[ -d cython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cython-feedstock.mark ) && true) || ( (echo "cython-feedstock" >>failed.12 ) && (echo "cython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cython-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f hatch-vcs-feedstock.mark ]]; then
    if [[ -d hatch-vcs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-vcs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-vcs-feedstock.mark ) && true) || ( (echo "hatch-vcs-feedstock" >>failed.12 ) && (echo "hatch-vcs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-vcs-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f importlib_metadata-feedstock.mark ]]; then
    if [[ -d importlib_metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./importlib_metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>importlib_metadata-feedstock.mark ) && true) || ( (echo "importlib_metadata-feedstock" >>failed.12 ) && (echo "importlib_metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "importlib_metadata-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f pytest-runner-feedstock.mark ]]; then
    if [[ -d pytest-runner-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-runner-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-runner-feedstock.mark ) && true) || ( (echo "pytest-runner-feedstock" >>failed.12 ) && (echo "pytest-runner-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-runner-feedstock not present" >>failed.12
    fi
fi

