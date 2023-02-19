#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f gobject-introspection-feedstock.mark ]]; then
    if [[ -d gobject-introspection-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gobject-introspection-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gobject-introspection-feedstock.mark ) && true) || ( (echo "gobject-introspection-feedstock" >>failed.18 ) && (echo "gobject-introspection-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gobject-introspection-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f jupyter_client-feedstock.mark ]]; then
    if [[ -d jupyter_client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_client-feedstock.mark ) && true) || ( (echo "jupyter_client-feedstock" >>failed.18 ) && (echo "jupyter_client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_client-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f markupsafe-feedstock.mark ]]; then
    if [[ -d markupsafe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markupsafe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markupsafe-feedstock.mark ) && true) || ( (echo "markupsafe-feedstock" >>failed.18 ) && (echo "markupsafe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markupsafe-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f nbformat-feedstock.mark ]]; then
    if [[ -d nbformat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbformat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbformat-feedstock.mark ) && true) || ( (echo "nbformat-feedstock" >>failed.18 ) && (echo "nbformat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbformat-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f soupsieve-feedstock.mark ]]; then
    if [[ -d soupsieve-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./soupsieve-feedstock >d 2>&1 && rm -f d && ( echo "done" >>soupsieve-feedstock.mark ) && true) || ( (echo "soupsieve-feedstock" >>failed.18 ) && (echo "soupsieve-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "soupsieve-feedstock not present" >>failed.18
    fi
fi

