#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f pip-feedstock.mark ]]; then
    if [[ -d pip-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pip-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pip-feedstock.mark ) && true) || ( (echo "pip-feedstock" >>failed.5 ) && (echo "pip-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pip-feedstock not present" >>failed.5
    fi
fi

