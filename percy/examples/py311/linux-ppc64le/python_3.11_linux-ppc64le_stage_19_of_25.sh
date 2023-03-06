#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f click-feedstock.mark ]]; then
    if [[ -d click-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-feedstock.mark ) && true) || ( (echo "click-feedstock" >>failed.19 ) && (echo "click-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f cmarkgfm-feedstock.mark ]]; then
    if [[ -d cmarkgfm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cmarkgfm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cmarkgfm-feedstock.mark ) && true) || ( (echo "cmarkgfm-feedstock" >>failed.19 ) && (echo "cmarkgfm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cmarkgfm-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f distlib-feedstock.mark ]]; then
    if [[ -d distlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distlib-feedstock.mark ) && true) || ( (echo "distlib-feedstock" >>failed.19 ) && (echo "distlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distlib-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f filelock-feedstock.mark ]]; then
    if [[ -d filelock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./filelock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>filelock-feedstock.mark ) && true) || ( (echo "filelock-feedstock" >>failed.19 ) && (echo "filelock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "filelock-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f frozenlist-feedstock.mark ]]; then
    if [[ -d frozenlist-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./frozenlist-feedstock >d 2>&1 && rm -f d && ( echo "done" >>frozenlist-feedstock.mark ) && true) || ( (echo "frozenlist-feedstock" >>failed.19 ) && (echo "frozenlist-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "frozenlist-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f gobject-introspection-feedstock.mark ]]; then
    if [[ -d gobject-introspection-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gobject-introspection-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gobject-introspection-feedstock.mark ) && true) || ( (echo "gobject-introspection-feedstock" >>failed.19 ) && (echo "gobject-introspection-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gobject-introspection-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f msgpack-python-feedstock.mark ]]; then
    if [[ -d msgpack-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./msgpack-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>msgpack-python-feedstock.mark ) && true) || ( (echo "msgpack-python-feedstock" >>failed.19 ) && (echo "msgpack-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "msgpack-python-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f multidict-feedstock.mark ]]; then
    if [[ -d multidict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multidict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multidict-feedstock.mark ) && true) || ( (echo "multidict-feedstock" >>failed.19 ) && (echo "multidict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multidict-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f nbclassic-feedstock.mark ]]; then
    if [[ -d nbclassic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbclassic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbclassic-feedstock.mark ) && true) || ( (echo "nbclassic-feedstock" >>failed.19 ) && (echo "nbclassic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbclassic-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f pdm-pep517-feedstock.mark ]]; then
    if [[ -d pdm-pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-pep517-feedstock.mark ) && true) || ( (echo "pdm-pep517-feedstock" >>failed.19 ) && (echo "pdm-pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-pep517-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f pep517-feedstock.mark ]]; then
    if [[ -d pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep517-feedstock.mark ) && true) || ( (echo "pep517-feedstock" >>failed.19 ) && (echo "pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep517-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f pybind11-feedstock.mark ]]; then
    if [[ -d pybind11-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pybind11-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pybind11-feedstock.mark ) && true) || ( (echo "pybind11-feedstock" >>failed.19 ) && (echo "pybind11-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pybind11-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f secretstorage-feedstock.mark ]]; then
    if [[ -d secretstorage-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./secretstorage-feedstock >d 2>&1 && rm -f d && ( echo "done" >>secretstorage-feedstock.mark ) && true) || ( (echo "secretstorage-feedstock" >>failed.19 ) && (echo "secretstorage-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "secretstorage-feedstock not present" >>failed.19
    fi
fi

