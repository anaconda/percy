#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f hatch-vcs-feedstock.mark ]]; then
    if [[ -d hatch-vcs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-vcs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-vcs-feedstock.mark ) && true) || ( (echo "hatch-vcs-feedstock" >>failed.12 ) && (echo "hatch-vcs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-vcs-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f pytest-runner-feedstock.mark ]]; then
    if [[ -d pytest-runner-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-runner-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-runner-feedstock.mark ) && true) || ( (echo "pytest-runner-feedstock" >>failed.12 ) && (echo "pytest-runner-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-runner-feedstock not present" >>failed.12
    fi
fi


if [[ ! -f urllib3-feedstock.mark ]]; then
    if [[ -d urllib3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./urllib3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>urllib3-feedstock.mark ) && true) || ( (echo "urllib3-feedstock" >>failed.12 ) && (echo "urllib3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "urllib3-feedstock not present" >>failed.12
    fi
fi

