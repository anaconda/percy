#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f async-timeout-feedstock.mark ]]; then
    if [[ -d async-timeout-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./async-timeout-feedstock >d 2>&1 && rm -f d && ( echo "done" >>async-timeout-feedstock.mark ) && true) || ( (echo "async-timeout-feedstock" >>failed.18 ) && (echo "async-timeout-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "async-timeout-feedstock not present" >>failed.18
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


if [[ ! -f gobject-introspection-feedstock.mark ]]; then
    if [[ -d gobject-introspection-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gobject-introspection-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gobject-introspection-feedstock.mark ) && true) || ( (echo "gobject-introspection-feedstock" >>failed.18 ) && (echo "gobject-introspection-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gobject-introspection-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f locket-feedstock.mark ]]; then
    if [[ -d locket-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./locket-feedstock >d 2>&1 && rm -f d && ( echo "done" >>locket-feedstock.mark ) && true) || ( (echo "locket-feedstock" >>failed.18 ) && (echo "locket-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "locket-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f msgpack-python-feedstock.mark ]]; then
    if [[ -d msgpack-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./msgpack-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>msgpack-python-feedstock.mark ) && true) || ( (echo "msgpack-python-feedstock" >>failed.18 ) && (echo "msgpack-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "msgpack-python-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f nbclassic-feedstock.mark ]]; then
    if [[ -d nbclassic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbclassic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbclassic-feedstock.mark ) && true) || ( (echo "nbclassic-feedstock" >>failed.18 ) && (echo "nbclassic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbclassic-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f pep517-feedstock.mark ]]; then
    if [[ -d pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep517-feedstock.mark ) && true) || ( (echo "pep517-feedstock" >>failed.18 ) && (echo "pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep517-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f ply-feedstock.mark ]]; then
    if [[ -d ply-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ply-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ply-feedstock.mark ) && true) || ( (echo "ply-feedstock" >>failed.18 ) && (echo "ply-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ply-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f pybind11-feedstock.mark ]]; then
    if [[ -d pybind11-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pybind11-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pybind11-feedstock.mark ) && true) || ( (echo "pybind11-feedstock" >>failed.18 ) && (echo "pybind11-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pybind11-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f secretstorage-feedstock.mark ]]; then
    if [[ -d secretstorage-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./secretstorage-feedstock >d 2>&1 && rm -f d && ( echo "done" >>secretstorage-feedstock.mark ) && true) || ( (echo "secretstorage-feedstock" >>failed.18 ) && (echo "secretstorage-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "secretstorage-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f toolz-feedstock.mark ]]; then
    if [[ -d toolz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./toolz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>toolz-feedstock.mark ) && true) || ( (echo "toolz-feedstock" >>failed.18 ) && (echo "toolz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "toolz-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f widgetsnbextension-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-feedstock.mark ) && true) || ( (echo "widgetsnbextension-feedstock" >>failed.18 ) && (echo "widgetsnbextension-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f widgetsnbextension-3.5.2-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-3.5.2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-3.5.2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-3.5.2-feedstock.mark ) && true) || ( (echo "widgetsnbextension-3.5.2-feedstock" >>failed.18 ) && (echo "widgetsnbextension-3.5.2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-3.5.2-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f yarl-feedstock.mark ]]; then
    if [[ -d yarl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./yarl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>yarl-feedstock.mark ) && true) || ( (echo "yarl-feedstock" >>failed.18 ) && (echo "yarl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "yarl-feedstock not present" >>failed.18
    fi
fi

