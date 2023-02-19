#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f platformdirs-feedstock.mark ]]; then
    if [[ -d platformdirs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./platformdirs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>platformdirs-feedstock.mark ) && true) || ( (echo "platformdirs-feedstock" >>failed.12 ) && (echo "platformdirs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "platformdirs-feedstock not present" >>failed.12
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

