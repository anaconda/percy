#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f babel-feedstock.mark ]]; then
    if [[ -d babel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./babel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>babel-feedstock.mark ) && true) || ( (echo "babel-feedstock" >>failed.18 ) && (echo "babel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "babel-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f click-feedstock.mark ]]; then
    if [[ -d click-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-feedstock.mark ) && true) || ( (echo "click-feedstock" >>failed.18 ) && (echo "click-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f distlib-feedstock.mark ]]; then
    if [[ -d distlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distlib-feedstock.mark ) && true) || ( (echo "distlib-feedstock" >>failed.18 ) && (echo "distlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distlib-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f filelock-feedstock.mark ]]; then
    if [[ -d filelock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./filelock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>filelock-feedstock.mark ) && true) || ( (echo "filelock-feedstock" >>failed.18 ) && (echo "filelock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "filelock-feedstock not present" >>failed.18
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


if [[ ! -f msgpack-python-feedstock.mark ]]; then
    if [[ -d msgpack-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./msgpack-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>msgpack-python-feedstock.mark ) && true) || ( (echo "msgpack-python-feedstock" >>failed.18 ) && (echo "msgpack-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "msgpack-python-feedstock not present" >>failed.18
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


if [[ ! -f pdm-pep517-feedstock.mark ]]; then
    if [[ -d pdm-pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-pep517-feedstock.mark ) && true) || ( (echo "pdm-pep517-feedstock" >>failed.18 ) && (echo "pdm-pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-pep517-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f pep517-feedstock.mark ]]; then
    if [[ -d pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep517-feedstock.mark ) && true) || ( (echo "pep517-feedstock" >>failed.18 ) && (echo "pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep517-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f pybind11-feedstock.mark ]]; then
    if [[ -d pybind11-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pybind11-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pybind11-feedstock.mark ) && true) || ( (echo "pybind11-feedstock" >>failed.18 ) && (echo "pybind11-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pybind11-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f sip-feedstock.mark ]]; then
    if [[ -d sip-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sip-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sip-feedstock.mark ) && true) || ( (echo "sip-feedstock" >>failed.18 ) && (echo "sip-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sip-feedstock not present" >>failed.18
    fi
fi

