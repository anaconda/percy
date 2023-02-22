#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f comm-feedstock.mark ]]; then
    if [[ -d comm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./comm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>comm-feedstock.mark ) && true) || ( (echo "comm-feedstock" >>failed.18 ) && (echo "comm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "comm-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f debugpy-feedstock.mark ]]; then
    if [[ -d debugpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./debugpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>debugpy-feedstock.mark ) && true) || ( (echo "debugpy-feedstock" >>failed.18 ) && (echo "debugpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "debugpy-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f ipython-feedstock.mark ]]; then
    if [[ -d ipython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipython-feedstock.mark ) && true) || ( (echo "ipython-feedstock" >>failed.18 ) && (echo "ipython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipython-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f jupyter_server-feedstock.mark ]]; then
    if [[ -d jupyter_server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_server-feedstock.mark ) && true) || ( (echo "jupyter_server-feedstock" >>failed.18 ) && (echo "jupyter_server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_server-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f poetry-feedstock.mark ]]; then
    if [[ -d poetry-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./poetry-feedstock >d 2>&1 && rm -f d && ( echo "done" >>poetry-feedstock.mark ) && true) || ( (echo "poetry-feedstock" >>failed.18 ) && (echo "poetry-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "poetry-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f psutil-feedstock.mark ]]; then
    if [[ -d psutil-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./psutil-feedstock >d 2>&1 && rm -f d && ( echo "done" >>psutil-feedstock.mark ) && true) || ( (echo "psutil-feedstock" >>failed.18 ) && (echo "psutil-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "psutil-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f pytz-feedstock.mark ]]; then
    if [[ -d pytz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytz-feedstock.mark ) && true) || ( (echo "pytz-feedstock" >>failed.18 ) && (echo "pytz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytz-feedstock not present" >>failed.18
    fi
fi

