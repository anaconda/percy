#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f wheel-feedstock.mark ]]; then
    if [[ -d wheel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wheel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wheel-feedstock.mark ) && true) || ( (echo "wheel-feedstock" >>failed.4 ) && (echo "wheel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wheel-feedstock not present" >>failed.4
    fi
fi

