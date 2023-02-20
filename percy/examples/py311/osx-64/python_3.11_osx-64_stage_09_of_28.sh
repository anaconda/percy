#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f brotlipy-feedstock.mark ]]; then
    if [[ -d brotlipy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./brotlipy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>brotlipy-feedstock.mark ) && true) || ( (echo "brotlipy-feedstock" >>failed.9 ) && (echo "brotlipy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "brotlipy-feedstock not present" >>failed.9
    fi
fi


if [[ ! -f idna-feedstock.mark ]]; then
    if [[ -d idna-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./idna-feedstock >d 2>&1 && rm -f d && ( echo "done" >>idna-feedstock.mark ) && true) || ( (echo "idna-feedstock" >>failed.9 ) && (echo "idna-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "idna-feedstock not present" >>failed.9
    fi
fi


if [[ ! -f pysocks-feedstock.mark ]]; then
    if [[ -d pysocks-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pysocks-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pysocks-feedstock.mark ) && true) || ( (echo "pysocks-feedstock" >>failed.9 ) && (echo "pysocks-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pysocks-feedstock not present" >>failed.9
    fi
fi

