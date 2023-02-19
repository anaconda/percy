#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f anyio-feedstock.mark ]]; then
    if [[ -d anyio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anyio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anyio-feedstock.mark ) && true) || ( (echo "anyio-feedstock" >>failed.16 ) && (echo "anyio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anyio-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f appnope-feedstock.mark ]]; then
    if [[ -d appnope-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./appnope-feedstock >d 2>&1 && rm -f d && ( echo "done" >>appnope-feedstock.mark ) && true) || ( (echo "appnope-feedstock" >>failed.16 ) && (echo "appnope-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "appnope-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f argon2_cffi-feedstock.mark ]]; then
    if [[ -d argon2_cffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./argon2_cffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>argon2_cffi-feedstock.mark ) && true) || ( (echo "argon2_cffi-feedstock" >>failed.16 ) && (echo "argon2_cffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "argon2_cffi-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f distlib-feedstock.mark ]]; then
    if [[ -d distlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distlib-feedstock.mark ) && true) || ( (echo "distlib-feedstock" >>failed.16 ) && (echo "distlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distlib-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f filelock-feedstock.mark ]]; then
    if [[ -d filelock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./filelock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>filelock-feedstock.mark ) && true) || ( (echo "filelock-feedstock" >>failed.16 ) && (echo "filelock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "filelock-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f jedi-feedstock.mark ]]; then
    if [[ -d jedi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jedi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jedi-feedstock.mark ) && true) || ( (echo "jedi-feedstock" >>failed.16 ) && (echo "jedi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jedi-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f jupyter-packaging-feedstock.mark ]]; then
    if [[ -d jupyter-packaging-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter-packaging-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter-packaging-feedstock.mark ) && true) || ( (echo "jupyter-packaging-feedstock" >>failed.16 ) && (echo "jupyter-packaging-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter-packaging-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f matplotlib-inline-feedstock.mark ]]; then
    if [[ -d matplotlib-inline-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./matplotlib-inline-feedstock >d 2>&1 && rm -f d && ( echo "done" >>matplotlib-inline-feedstock.mark ) && true) || ( (echo "matplotlib-inline-feedstock" >>failed.16 ) && (echo "matplotlib-inline-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "matplotlib-inline-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f meson-feedstock.mark ]]; then
    if [[ -d meson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./meson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>meson-feedstock.mark ) && true) || ( (echo "meson-feedstock" >>failed.16 ) && (echo "meson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "meson-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f msgpack-python-feedstock.mark ]]; then
    if [[ -d msgpack-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./msgpack-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>msgpack-python-feedstock.mark ) && true) || ( (echo "msgpack-python-feedstock" >>failed.16 ) && (echo "msgpack-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "msgpack-python-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f nbconvert-feedstock.mark ]]; then
    if [[ -d nbconvert-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbconvert-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbconvert-feedstock.mark ) && true) || ( (echo "nbconvert-feedstock" >>failed.16 ) && (echo "nbconvert-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbconvert-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f prometheus_client-feedstock.mark ]]; then
    if [[ -d prometheus_client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prometheus_client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prometheus_client-feedstock.mark ) && true) || ( (echo "prometheus_client-feedstock" >>failed.16 ) && (echo "prometheus_client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prometheus_client-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f prompt_toolkit-feedstock.mark ]]; then
    if [[ -d prompt_toolkit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prompt_toolkit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prompt_toolkit-feedstock.mark ) && true) || ( (echo "prompt_toolkit-feedstock" >>failed.16 ) && (echo "prompt_toolkit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prompt_toolkit-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f terminado-feedstock.mark ]]; then
    if [[ -d terminado-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./terminado-feedstock >d 2>&1 && rm -f d && ( echo "done" >>terminado-feedstock.mark ) && true) || ( (echo "terminado-feedstock" >>failed.16 ) && (echo "terminado-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "terminado-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f websocket-client-feedstock.mark ]]; then
    if [[ -d websocket-client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./websocket-client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>websocket-client-feedstock.mark ) && true) || ( (echo "websocket-client-feedstock" >>failed.16 ) && (echo "websocket-client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "websocket-client-feedstock not present" >>failed.16
    fi
fi

