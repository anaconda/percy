#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f distlib-feedstock.mark ]]; then
    if [[ -d distlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distlib-feedstock.mark ) && true) || ( (echo "distlib-feedstock" >>failed.13 ) && (echo "distlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distlib-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f filelock-feedstock.mark ]]; then
    if [[ -d filelock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./filelock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>filelock-feedstock.mark ) && true) || ( (echo "filelock-feedstock" >>failed.13 ) && (echo "filelock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "filelock-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f msgpack-python-feedstock.mark ]]; then
    if [[ -d msgpack-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./msgpack-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>msgpack-python-feedstock.mark ) && true) || ( (echo "msgpack-python-feedstock" >>failed.13 ) && (echo "msgpack-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "msgpack-python-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f platformdirs-feedstock.mark ]]; then
    if [[ -d platformdirs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./platformdirs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>platformdirs-feedstock.mark ) && true) || ( (echo "platformdirs-feedstock" >>failed.13 ) && (echo "platformdirs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "platformdirs-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f poetry-core-feedstock.mark ]]; then
    if [[ -d poetry-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./poetry-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>poetry-core-feedstock.mark ) && true) || ( (echo "poetry-core-feedstock" >>failed.13 ) && (echo "poetry-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "poetry-core-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f pyrsistent-feedstock.mark ]]; then
    if [[ -d pyrsistent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyrsistent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyrsistent-feedstock.mark ) && true) || ( (echo "pyrsistent-feedstock" >>failed.13 ) && (echo "pyrsistent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyrsistent-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f secretstorage-feedstock.mark ]]; then
    if [[ -d secretstorage-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./secretstorage-feedstock >d 2>&1 && rm -f d && ( echo "done" >>secretstorage-feedstock.mark ) && true) || ( (echo "secretstorage-feedstock" >>failed.13 ) && (echo "secretstorage-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "secretstorage-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f webencodings-feedstock.mark ]]; then
    if [[ -d webencodings-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./webencodings-feedstock >d 2>&1 && rm -f d && ( echo "done" >>webencodings-feedstock.mark ) && true) || ( (echo "webencodings-feedstock" >>failed.13 ) && (echo "webencodings-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "webencodings-feedstock not present" >>failed.13
    fi
fi

