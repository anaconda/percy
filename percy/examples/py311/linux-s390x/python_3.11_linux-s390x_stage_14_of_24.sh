#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f jupyter_client-feedstock.mark ]]; then
    if [[ -d jupyter_client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_client-feedstock.mark ) && true) || ( (echo "jupyter_client-feedstock" >>failed.14 ) && (echo "jupyter_client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_client-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f markupsafe-feedstock.mark ]]; then
    if [[ -d markupsafe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markupsafe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markupsafe-feedstock.mark ) && true) || ( (echo "markupsafe-feedstock" >>failed.14 ) && (echo "markupsafe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markupsafe-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f nbformat-feedstock.mark ]]; then
    if [[ -d nbformat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbformat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbformat-feedstock.mark ) && true) || ( (echo "nbformat-feedstock" >>failed.14 ) && (echo "nbformat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbformat-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f poetry-core-feedstock.mark ]]; then
    if [[ -d poetry-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./poetry-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>poetry-core-feedstock.mark ) && true) || ( (echo "poetry-core-feedstock" >>failed.14 ) && (echo "poetry-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "poetry-core-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f soupsieve-feedstock.mark ]]; then
    if [[ -d soupsieve-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./soupsieve-feedstock >d 2>&1 && rm -f d && ( echo "done" >>soupsieve-feedstock.mark ) && true) || ( (echo "soupsieve-feedstock" >>failed.14 ) && (echo "soupsieve-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "soupsieve-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f webencodings-feedstock.mark ]]; then
    if [[ -d webencodings-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./webencodings-feedstock >d 2>&1 && rm -f d && ( echo "done" >>webencodings-feedstock.mark ) && true) || ( (echo "webencodings-feedstock" >>failed.14 ) && (echo "webencodings-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "webencodings-feedstock not present" >>failed.14
    fi
fi

