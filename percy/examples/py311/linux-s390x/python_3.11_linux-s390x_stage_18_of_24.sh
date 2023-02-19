#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f babel-feedstock.mark ]]; then
    if [[ -d babel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./babel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>babel-feedstock.mark ) && true) || ( (echo "babel-feedstock" >>failed.18 ) && (echo "babel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "babel-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f frozenlist-feedstock.mark ]]; then
    if [[ -d frozenlist-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./frozenlist-feedstock >d 2>&1 && rm -f d && ( echo "done" >>frozenlist-feedstock.mark ) && true) || ( (echo "frozenlist-feedstock" >>failed.18 ) && (echo "frozenlist-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "frozenlist-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f importlib_metadata-feedstock.mark ]]; then
    if [[ -d importlib_metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./importlib_metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>importlib_metadata-feedstock.mark ) && true) || ( (echo "importlib_metadata-feedstock" >>failed.18 ) && (echo "importlib_metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "importlib_metadata-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f ipykernel-feedstock.mark ]]; then
    if [[ -d ipykernel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipykernel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipykernel-feedstock.mark ) && true) || ( (echo "ipykernel-feedstock" >>failed.18 ) && (echo "ipykernel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipykernel-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f meson-feedstock.mark ]]; then
    if [[ -d meson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./meson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>meson-feedstock.mark ) && true) || ( (echo "meson-feedstock" >>failed.18 ) && (echo "meson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "meson-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f multidict-feedstock.mark ]]; then
    if [[ -d multidict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multidict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multidict-feedstock.mark ) && true) || ( (echo "multidict-feedstock" >>failed.18 ) && (echo "multidict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multidict-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f notebook-shim-feedstock.mark ]]; then
    if [[ -d notebook-shim-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./notebook-shim-feedstock >d 2>&1 && rm -f d && ( echo "done" >>notebook-shim-feedstock.mark ) && true) || ( (echo "notebook-shim-feedstock" >>failed.18 ) && (echo "notebook-shim-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "notebook-shim-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f numpy-feedstock.mark ]]; then
    if [[ -d numpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpy-feedstock.mark ) && true) || ( (echo "numpy-feedstock" >>failed.18 ) && (echo "numpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpy-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f numpy-1.22-feedstock.mark ]]; then
    if [[ -d numpy-1.22-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpy-1.22-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpy-1.22-feedstock.mark ) && true) || ( (echo "numpy-1.22-feedstock" >>failed.18 ) && (echo "numpy-1.22-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpy-1.22-feedstock not present" >>failed.18
    fi
fi

