#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f anyio-feedstock.mark ]]; then
    if [[ -d anyio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anyio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anyio-feedstock.mark ) && true) || ( (echo "anyio-feedstock" >>failed.17 ) && (echo "anyio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anyio-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f cachecontrol-feedstock.mark ]]; then
    if [[ -d cachecontrol-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cachecontrol-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cachecontrol-feedstock.mark ) && true) || ( (echo "cachecontrol-feedstock" >>failed.17 ) && (echo "cachecontrol-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cachecontrol-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f jedi-feedstock.mark ]]; then
    if [[ -d jedi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jedi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jedi-feedstock.mark ) && true) || ( (echo "jedi-feedstock" >>failed.17 ) && (echo "jedi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jedi-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f jupyter-packaging-feedstock.mark ]]; then
    if [[ -d jupyter-packaging-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter-packaging-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter-packaging-feedstock.mark ) && true) || ( (echo "jupyter-packaging-feedstock" >>failed.17 ) && (echo "jupyter-packaging-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter-packaging-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f keyring-feedstock.mark ]]; then
    if [[ -d keyring-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./keyring-feedstock >d 2>&1 && rm -f d && ( echo "done" >>keyring-feedstock.mark ) && true) || ( (echo "keyring-feedstock" >>failed.17 ) && (echo "keyring-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "keyring-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f matplotlib-inline-feedstock.mark ]]; then
    if [[ -d matplotlib-inline-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./matplotlib-inline-feedstock >d 2>&1 && rm -f d && ( echo "done" >>matplotlib-inline-feedstock.mark ) && true) || ( (echo "matplotlib-inline-feedstock" >>failed.17 ) && (echo "matplotlib-inline-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "matplotlib-inline-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f nbconvert-feedstock.mark ]]; then
    if [[ -d nbconvert-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbconvert-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbconvert-feedstock.mark ) && true) || ( (echo "nbconvert-feedstock" >>failed.17 ) && (echo "nbconvert-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbconvert-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f pkginfo-feedstock.mark ]]; then
    if [[ -d pkginfo-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pkginfo-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pkginfo-feedstock.mark ) && true) || ( (echo "pkginfo-feedstock" >>failed.17 ) && (echo "pkginfo-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pkginfo-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f prometheus_client-feedstock.mark ]]; then
    if [[ -d prometheus_client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prometheus_client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prometheus_client-feedstock.mark ) && true) || ( (echo "prometheus_client-feedstock" >>failed.17 ) && (echo "prometheus_client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prometheus_client-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f prompt_toolkit-feedstock.mark ]]; then
    if [[ -d prompt_toolkit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prompt_toolkit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prompt_toolkit-feedstock.mark ) && true) || ( (echo "prompt_toolkit-feedstock" >>failed.17 ) && (echo "prompt_toolkit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prompt_toolkit-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f pyparsing-feedstock.mark ]]; then
    if [[ -d pyparsing-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyparsing-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyparsing-feedstock.mark ) && true) || ( (echo "pyparsing-feedstock" >>failed.17 ) && (echo "pyparsing-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyparsing-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f shellingham-feedstock.mark ]]; then
    if [[ -d shellingham-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./shellingham-feedstock >d 2>&1 && rm -f d && ( echo "done" >>shellingham-feedstock.mark ) && true) || ( (echo "shellingham-feedstock" >>failed.17 ) && (echo "shellingham-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "shellingham-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f terminado-feedstock.mark ]]; then
    if [[ -d terminado-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./terminado-feedstock >d 2>&1 && rm -f d && ( echo "done" >>terminado-feedstock.mark ) && true) || ( (echo "terminado-feedstock" >>failed.17 ) && (echo "terminado-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "terminado-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f virtualenv-feedstock.mark ]]; then
    if [[ -d virtualenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./virtualenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>virtualenv-feedstock.mark ) && true) || ( (echo "virtualenv-feedstock" >>failed.17 ) && (echo "virtualenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "virtualenv-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f websocket-client-feedstock.mark ]]; then
    if [[ -d websocket-client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./websocket-client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>websocket-client-feedstock.mark ) && true) || ( (echo "websocket-client-feedstock" >>failed.17 ) && (echo "websocket-client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "websocket-client-feedstock not present" >>failed.17
    fi
fi


if [[ ! -f xcb-proto-feedstock.mark ]]; then
    if [[ -d xcb-proto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xcb-proto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xcb-proto-feedstock.mark ) && true) || ( (echo "xcb-proto-feedstock" >>failed.17 ) && (echo "xcb-proto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xcb-proto-feedstock not present" >>failed.17
    fi
fi

