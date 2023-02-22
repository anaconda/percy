#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f async-timeout-feedstock.mark ]]; then
    if [[ -d async-timeout-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./async-timeout-feedstock >d 2>&1 && rm -f d && ( echo "done" >>async-timeout-feedstock.mark ) && true) || ( (echo "async-timeout-feedstock" >>failed.21 ) && (echo "async-timeout-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "async-timeout-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f botocore-feedstock.mark ]]; then
    if [[ -d botocore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./botocore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>botocore-feedstock.mark ) && true) || ( (echo "botocore-feedstock" >>failed.21 ) && (echo "botocore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "botocore-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f bottleneck-feedstock.mark ]]; then
    if [[ -d bottleneck-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bottleneck-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bottleneck-feedstock.mark ) && true) || ( (echo "bottleneck-feedstock" >>failed.21 ) && (echo "bottleneck-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bottleneck-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f colorama-feedstock.mark ]]; then
    if [[ -d colorama-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colorama-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colorama-feedstock.mark ) && true) || ( (echo "colorama-feedstock" >>failed.21 ) && (echo "colorama-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colorama-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f jupyterlab_server-feedstock.mark ]]; then
    if [[ -d jupyterlab_server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterlab_server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterlab_server-feedstock.mark ) && true) || ( (echo "jupyterlab_server-feedstock" >>failed.21 ) && (echo "jupyterlab_server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterlab_server-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f locket-feedstock.mark ]]; then
    if [[ -d locket-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./locket-feedstock >d 2>&1 && rm -f d && ( echo "done" >>locket-feedstock.mark ) && true) || ( (echo "locket-feedstock" >>failed.21 ) && (echo "locket-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "locket-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f notebook-feedstock.mark ]]; then
    if [[ -d notebook-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./notebook-feedstock >d 2>&1 && rm -f d && ( echo "done" >>notebook-feedstock.mark ) && true) || ( (echo "notebook-feedstock" >>failed.21 ) && (echo "notebook-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "notebook-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f numexpr-feedstock.mark ]]; then
    if [[ -d numexpr-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numexpr-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numexpr-feedstock.mark ) && true) || ( (echo "numexpr-feedstock" >>failed.21 ) && (echo "numexpr-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numexpr-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f ply-feedstock.mark ]]; then
    if [[ -d ply-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ply-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ply-feedstock.mark ) && true) || ( (echo "ply-feedstock" >>failed.21 ) && (echo "ply-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ply-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f toolz-feedstock.mark ]]; then
    if [[ -d toolz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./toolz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>toolz-feedstock.mark ) && true) || ( (echo "toolz-feedstock" >>failed.21 ) && (echo "toolz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "toolz-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f tqdm-feedstock.mark ]]; then
    if [[ -d tqdm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tqdm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tqdm-feedstock.mark ) && true) || ( (echo "tqdm-feedstock" >>failed.21 ) && (echo "tqdm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tqdm-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f yarl-feedstock.mark ]]; then
    if [[ -d yarl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./yarl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>yarl-feedstock.mark ) && true) || ( (echo "yarl-feedstock" >>failed.21 ) && (echo "yarl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "yarl-feedstock not present" >>failed.21
    fi
fi

