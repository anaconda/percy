#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f cppy-feedstock.mark ]]; then
    if [[ -d cppy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cppy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cppy-feedstock.mark ) && true) || ( (echo "cppy-feedstock" >>failed.22 ) && (echo "cppy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cppy-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f dbus-python-feedstock.mark ]]; then
    if [[ -d dbus-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dbus-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dbus-python-feedstock.mark ) && true) || ( (echo "dbus-python-feedstock" >>failed.22 ) && (echo "dbus-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dbus-python-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f frozenlist-feedstock.mark ]]; then
    if [[ -d frozenlist-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./frozenlist-feedstock >d 2>&1 && rm -f d && ( echo "done" >>frozenlist-feedstock.mark ) && true) || ( (echo "frozenlist-feedstock" >>failed.22 ) && (echo "frozenlist-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "frozenlist-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f multidict-feedstock.mark ]]; then
    if [[ -d multidict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multidict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multidict-feedstock.mark ) && true) || ( (echo "multidict-feedstock" >>failed.22 ) && (echo "multidict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multidict-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f nbclassic-feedstock.mark ]]; then
    if [[ -d nbclassic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbclassic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbclassic-feedstock.mark ) && true) || ( (echo "nbclassic-feedstock" >>failed.22 ) && (echo "nbclassic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbclassic-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyqt-builder-feedstock.mark ]]; then
    if [[ -d pyqt-builder-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyqt-builder-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyqt-builder-feedstock.mark ) && true) || ( (echo "pyqt-builder-feedstock" >>failed.22 ) && (echo "pyqt-builder-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyqt-builder-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyqt-feedstock.mark ]]; then
    if [[ -d pyqt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyqt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyqt-feedstock.mark ) && true) || ( (echo "pyqt-feedstock" >>failed.22 ) && (echo "pyqt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyqt-feedstock not present" >>failed.22
    fi
fi

