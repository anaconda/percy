#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f urllib3-feedstock.mark ]]; then
    if [[ -d urllib3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./urllib3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>urllib3-feedstock.mark ) && true) || ( (echo "urllib3-feedstock" >>failed.10 ) && (echo "urllib3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "urllib3-feedstock not present" >>failed.10
    fi
fi

