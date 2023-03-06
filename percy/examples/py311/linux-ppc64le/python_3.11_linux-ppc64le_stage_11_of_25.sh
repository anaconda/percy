#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f brotlipy-feedstock.mark ]]; then
    if [[ -d brotlipy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./brotlipy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>brotlipy-feedstock.mark ) && true) || ( (echo "brotlipy-feedstock" >>failed.11 ) && (echo "brotlipy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "brotlipy-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f hatch-vcs-feedstock.mark ]]; then
    if [[ -d hatch-vcs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-vcs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-vcs-feedstock.mark ) && true) || ( (echo "hatch-vcs-feedstock" >>failed.11 ) && (echo "hatch-vcs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-vcs-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f idna-feedstock.mark ]]; then
    if [[ -d idna-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./idna-feedstock >d 2>&1 && rm -f d && ( echo "done" >>idna-feedstock.mark ) && true) || ( (echo "idna-feedstock" >>failed.11 ) && (echo "idna-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "idna-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f pyopenssl-feedstock.mark ]]; then
    if [[ -d pyopenssl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyopenssl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyopenssl-feedstock.mark ) && true) || ( (echo "pyopenssl-feedstock" >>failed.11 ) && (echo "pyopenssl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyopenssl-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f pysocks-feedstock.mark ]]; then
    if [[ -d pysocks-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pysocks-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pysocks-feedstock.mark ) && true) || ( (echo "pysocks-feedstock" >>failed.11 ) && (echo "pysocks-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pysocks-feedstock not present" >>failed.11
    fi
fi


if [[ ! -f pytest-runner-feedstock.mark ]]; then
    if [[ -d pytest-runner-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-runner-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-runner-feedstock.mark ) && true) || ( (echo "pytest-runner-feedstock" >>failed.11 ) && (echo "pytest-runner-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-runner-feedstock not present" >>failed.11
    fi
fi

