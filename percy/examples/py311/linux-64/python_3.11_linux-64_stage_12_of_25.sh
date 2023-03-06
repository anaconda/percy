#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cython-feedstock.mark ]]; then
    if [[ -d cython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cython-feedstock.mark ) && true) || ( (echo "cython-feedstock" >>failed.12 ) && (echo "cython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cython-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f nose-feedstock.mark ]]; then
    if [[ -d nose-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nose-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nose-feedstock.mark ) && true) || ( (echo "nose-feedstock" >>failed.12 ) && (echo "nose-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nose-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f platformdirs-feedstock.mark ]]; then
    if [[ -d platformdirs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./platformdirs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>platformdirs-feedstock.mark ) && true) || ( (echo "platformdirs-feedstock" >>failed.12 ) && (echo "platformdirs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "platformdirs-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f poetry-core-feedstock.mark ]]; then
    if [[ -d poetry-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./poetry-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>poetry-core-feedstock.mark ) && true) || ( (echo "poetry-core-feedstock" >>failed.12 ) && (echo "poetry-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "poetry-core-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f pyrsistent-feedstock.mark ]]; then
    if [[ -d pyrsistent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyrsistent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyrsistent-feedstock.mark ) && true) || ( (echo "pyrsistent-feedstock" >>failed.12 ) && (echo "pyrsistent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyrsistent-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f traitlets-feedstock.mark ]]; then
    if [[ -d traitlets-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./traitlets-feedstock >d 2>&1 && rm -f d && ( echo "done" >>traitlets-feedstock.mark ) && true) || ( (echo "traitlets-feedstock" >>failed.12 ) && (echo "traitlets-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "traitlets-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f urllib3-feedstock.mark ]]; then
    if [[ -d urllib3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./urllib3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>urllib3-feedstock.mark ) && true) || ( (echo "urllib3-feedstock" >>failed.12 ) && (echo "urllib3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "urllib3-feedstock not present" >>failed.12
    fi
fi

