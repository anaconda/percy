#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cachecontrol-feedstock.mark ]]; then
    if [[ -d cachecontrol-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cachecontrol-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cachecontrol-feedstock.mark ) && true) || ( (echo "cachecontrol-feedstock" >>failed.16 ) && (echo "cachecontrol-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cachecontrol-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f debugpy-feedstock.mark ]]; then
    if [[ -d debugpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./debugpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>debugpy-feedstock.mark ) && true) || ( (echo "debugpy-feedstock" >>failed.16 ) && (echo "debugpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "debugpy-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f gobject-introspection-feedstock.mark ]]; then
    if [[ -d gobject-introspection-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gobject-introspection-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gobject-introspection-feedstock.mark ) && true) || ( (echo "gobject-introspection-feedstock" >>failed.16 ) && (echo "gobject-introspection-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gobject-introspection-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f ipython-feedstock.mark ]]; then
    if [[ -d ipython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipython-feedstock.mark ) && true) || ( (echo "ipython-feedstock" >>failed.16 ) && (echo "ipython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipython-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f jupyter_server-feedstock.mark ]]; then
    if [[ -d jupyter_server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_server-feedstock.mark ) && true) || ( (echo "jupyter_server-feedstock" >>failed.16 ) && (echo "jupyter_server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_server-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f keyring-feedstock.mark ]]; then
    if [[ -d keyring-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./keyring-feedstock >d 2>&1 && rm -f d && ( echo "done" >>keyring-feedstock.mark ) && true) || ( (echo "keyring-feedstock" >>failed.16 ) && (echo "keyring-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "keyring-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f pkginfo-feedstock.mark ]]; then
    if [[ -d pkginfo-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pkginfo-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pkginfo-feedstock.mark ) && true) || ( (echo "pkginfo-feedstock" >>failed.16 ) && (echo "pkginfo-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pkginfo-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f psutil-feedstock.mark ]]; then
    if [[ -d psutil-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./psutil-feedstock >d 2>&1 && rm -f d && ( echo "done" >>psutil-feedstock.mark ) && true) || ( (echo "psutil-feedstock" >>failed.16 ) && (echo "psutil-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "psutil-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f pyparsing-feedstock.mark ]]; then
    if [[ -d pyparsing-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyparsing-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyparsing-feedstock.mark ) && true) || ( (echo "pyparsing-feedstock" >>failed.16 ) && (echo "pyparsing-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyparsing-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f pytz-feedstock.mark ]]; then
    if [[ -d pytz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytz-feedstock.mark ) && true) || ( (echo "pytz-feedstock" >>failed.16 ) && (echo "pytz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytz-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f shellingham-feedstock.mark ]]; then
    if [[ -d shellingham-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./shellingham-feedstock >d 2>&1 && rm -f d && ( echo "done" >>shellingham-feedstock.mark ) && true) || ( (echo "shellingham-feedstock" >>failed.16 ) && (echo "shellingham-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "shellingham-feedstock not present" >>failed.16
    fi
fi


if [[ ! -f virtualenv-feedstock.mark ]]; then
    if [[ -d virtualenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./virtualenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>virtualenv-feedstock.mark ) && true) || ( (echo "virtualenv-feedstock" >>failed.16 ) && (echo "virtualenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "virtualenv-feedstock not present" >>failed.16
    fi
fi

