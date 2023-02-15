#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f typing_extensions-feedstock.mark ]]; then
    if [[ -d typing_extensions-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typing_extensions-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typing_extensions-feedstock.mark ) && true) || ( (echo "typing_extensions-feedstock" >>failed.5 ) && (echo "typing_extensions-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typing_extensions-feedstock not present" >>failed.5
    fi
fi

