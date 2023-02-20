#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f debugpy-feedstock.mark ]]; then
    if [[ -d debugpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./debugpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>debugpy-feedstock.mark ) && true) || ( (echo "debugpy-feedstock" >>failed.21 ) && (echo "debugpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "debugpy-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f ipython-feedstock.mark ]]; then
    if [[ -d ipython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipython-feedstock.mark ) && true) || ( (echo "ipython-feedstock" >>failed.21 ) && (echo "ipython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipython-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f jupyter_server-feedstock.mark ]]; then
    if [[ -d jupyter_server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_server-feedstock.mark ) && true) || ( (echo "jupyter_server-feedstock" >>failed.21 ) && (echo "jupyter_server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_server-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f numpy-feedstock.mark ]]; then
    if [[ -d numpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpy-feedstock.mark ) && true) || ( (echo "numpy-feedstock" >>failed.21 ) && (echo "numpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpy-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f numpy-1.22-feedstock.mark ]]; then
    if [[ -d numpy-1.22-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpy-1.22-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpy-1.22-feedstock.mark ) && true) || ( (echo "numpy-1.22-feedstock" >>failed.21 ) && (echo "numpy-1.22-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpy-1.22-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f ply-feedstock.mark ]]; then
    if [[ -d ply-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ply-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ply-feedstock.mark ) && true) || ( (echo "ply-feedstock" >>failed.21 ) && (echo "ply-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ply-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f psutil-feedstock.mark ]]; then
    if [[ -d psutil-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./psutil-feedstock >d 2>&1 && rm -f d && ( echo "done" >>psutil-feedstock.mark ) && true) || ( (echo "psutil-feedstock" >>failed.21 ) && (echo "psutil-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "psutil-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pytz-feedstock.mark ]]; then
    if [[ -d pytz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytz-feedstock.mark ) && true) || ( (echo "pytz-feedstock" >>failed.21 ) && (echo "pytz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytz-feedstock not present" >>failed.21
    fi
fi

