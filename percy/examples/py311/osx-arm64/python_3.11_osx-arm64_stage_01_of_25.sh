#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f ninja-feedstock.mark ]]; then
    if [[ -d ninja-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ninja-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ninja-feedstock.mark ) && true) || ( (echo "ninja-feedstock" >>failed.1 ) && (echo "ninja-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ninja-feedstock not present" >>failed.1
    fi
fi

