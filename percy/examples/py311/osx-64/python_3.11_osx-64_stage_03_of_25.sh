#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f certifi-feedstock.mark ]]; then
    if [[ -d certifi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./certifi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>certifi-feedstock.mark ) && true) || ( (echo "certifi-feedstock" >>failed.3 ) && (echo "certifi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "certifi-feedstock not present" >>failed.3
    fi
fi

