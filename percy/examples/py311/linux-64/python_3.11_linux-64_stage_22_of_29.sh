#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f babel-feedstock.mark ]]; then
    if [[ -d babel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./babel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>babel-feedstock.mark ) && true) || ( (echo "babel-feedstock" >>failed.22 ) && (echo "babel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "babel-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f ipykernel-feedstock.mark ]]; then
    if [[ -d ipykernel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipykernel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipykernel-feedstock.mark ) && true) || ( (echo "ipykernel-feedstock" >>failed.22 ) && (echo "ipykernel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipykernel-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f notebook-shim-feedstock.mark ]]; then
    if [[ -d notebook-shim-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./notebook-shim-feedstock >d 2>&1 && rm -f d && ( echo "done" >>notebook-shim-feedstock.mark ) && true) || ( (echo "notebook-shim-feedstock" >>failed.22 ) && (echo "notebook-shim-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "notebook-shim-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pep517-feedstock.mark ]]; then
    if [[ -d pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep517-feedstock.mark ) && true) || ( (echo "pep517-feedstock" >>failed.22 ) && (echo "pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep517-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pybind11-feedstock.mark ]]; then
    if [[ -d pybind11-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pybind11-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pybind11-feedstock.mark ) && true) || ( (echo "pybind11-feedstock" >>failed.22 ) && (echo "pybind11-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pybind11-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f sip-feedstock.mark ]]; then
    if [[ -d sip-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sip-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sip-feedstock.mark ) && true) || ( (echo "sip-feedstock" >>failed.22 ) && (echo "sip-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sip-feedstock not present" >>failed.22
    fi
fi

