#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f babel-feedstock.mark ]]; then
    if [[ -d babel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./babel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>babel-feedstock.mark ) && true) || ( (echo "babel-feedstock" >>failed.19 ) && (echo "babel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "babel-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f ipykernel-feedstock.mark ]]; then
    if [[ -d ipykernel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipykernel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipykernel-feedstock.mark ) && true) || ( (echo "ipykernel-feedstock" >>failed.19 ) && (echo "ipykernel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipykernel-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f meson-feedstock.mark ]]; then
    if [[ -d meson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./meson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>meson-feedstock.mark ) && true) || ( (echo "meson-feedstock" >>failed.19 ) && (echo "meson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "meson-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f notebook-shim-feedstock.mark ]]; then
    if [[ -d notebook-shim-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./notebook-shim-feedstock >d 2>&1 && rm -f d && ( echo "done" >>notebook-shim-feedstock.mark ) && true) || ( (echo "notebook-shim-feedstock" >>failed.19 ) && (echo "notebook-shim-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "notebook-shim-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f numpy-feedstock.mark ]]; then
    if [[ -d numpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpy-feedstock.mark ) && true) || ( (echo "numpy-feedstock" >>failed.19 ) && (echo "numpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpy-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f numpy-1.22-feedstock.mark ]]; then
    if [[ -d numpy-1.22-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpy-1.22-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpy-1.22-feedstock.mark ) && true) || ( (echo "numpy-1.22-feedstock" >>failed.19 ) && (echo "numpy-1.22-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpy-1.22-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f pkgconfig-feedstock.mark ]]; then
    if [[ -d pkgconfig-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pkgconfig-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pkgconfig-feedstock.mark ) && true) || ( (echo "pkgconfig-feedstock" >>failed.19 ) && (echo "pkgconfig-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pkgconfig-feedstock not present" >>failed.19
    fi
fi

