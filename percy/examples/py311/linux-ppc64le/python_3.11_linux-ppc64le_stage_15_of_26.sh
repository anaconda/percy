#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cython-feedstock.mark ]]; then
    if [[ -d cython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cython-feedstock.mark ) && true) || ( (echo "cython-feedstock" >>failed.15 ) && (echo "cython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cython-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f importlib_metadata-feedstock.mark ]]; then
    if [[ -d importlib_metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./importlib_metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>importlib_metadata-feedstock.mark ) && true) || ( (echo "importlib_metadata-feedstock" >>failed.15 ) && (echo "importlib_metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "importlib_metadata-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f jupyter_client-feedstock.mark ]]; then
    if [[ -d jupyter_client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_client-feedstock.mark ) && true) || ( (echo "jupyter_client-feedstock" >>failed.15 ) && (echo "jupyter_client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_client-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f markupsafe-feedstock.mark ]]; then
    if [[ -d markupsafe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markupsafe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markupsafe-feedstock.mark ) && true) || ( (echo "markupsafe-feedstock" >>failed.15 ) && (echo "markupsafe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markupsafe-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f nbformat-feedstock.mark ]]; then
    if [[ -d nbformat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbformat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbformat-feedstock.mark ) && true) || ( (echo "nbformat-feedstock" >>failed.15 ) && (echo "nbformat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbformat-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f poetry-core-feedstock.mark ]]; then
    if [[ -d poetry-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./poetry-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>poetry-core-feedstock.mark ) && true) || ( (echo "poetry-core-feedstock" >>failed.15 ) && (echo "poetry-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "poetry-core-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f soupsieve-feedstock.mark ]]; then
    if [[ -d soupsieve-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./soupsieve-feedstock >d 2>&1 && rm -f d && ( echo "done" >>soupsieve-feedstock.mark ) && true) || ( (echo "soupsieve-feedstock" >>failed.15 ) && (echo "soupsieve-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "soupsieve-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f webencodings-feedstock.mark ]]; then
    if [[ -d webencodings-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./webencodings-feedstock >d 2>&1 && rm -f d && ( echo "done" >>webencodings-feedstock.mark ) && true) || ( (echo "webencodings-feedstock" >>failed.15 ) && (echo "webencodings-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "webencodings-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f xcb-proto-feedstock.mark ]]; then
    if [[ -d xcb-proto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xcb-proto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xcb-proto-feedstock.mark ) && true) || ( (echo "xcb-proto-feedstock" >>failed.15 ) && (echo "xcb-proto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xcb-proto-feedstock not present" >>failed.15
    fi
fi

