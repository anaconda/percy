#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f blinker-feedstock.mark ]]; then
    if [[ -d blinker-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./blinker-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>blinker-feedstock.mark ) && true) || ( (echo "blinker-feedstock" >>failed.19 ) && (echo "blinker-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "blinker-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f cachecontrol-feedstock.mark ]]; then
    if [[ -d cachecontrol-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cachecontrol-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cachecontrol-feedstock.mark ) && true) || ( (echo "cachecontrol-feedstock" >>failed.19 ) && (echo "cachecontrol-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cachecontrol-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f cmarkgfm-feedstock.mark ]]; then
    if [[ -d cmarkgfm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cmarkgfm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cmarkgfm-feedstock.mark ) && true) || ( (echo "cmarkgfm-feedstock" >>failed.19 ) && (echo "cmarkgfm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cmarkgfm-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f cppy-feedstock.mark ]]; then
    if [[ -d cppy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cppy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cppy-feedstock.mark ) && true) || ( (echo "cppy-feedstock" >>failed.19 ) && (echo "cppy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cppy-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f dbus-python-feedstock.mark ]]; then
    if [[ -d dbus-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dbus-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dbus-python-feedstock.mark ) && true) || ( (echo "dbus-python-feedstock" >>failed.19 ) && (echo "dbus-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dbus-python-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f findpython-feedstock.mark ]]; then
    if [[ -d findpython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./findpython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>findpython-feedstock.mark ) && true) || ( (echo "findpython-feedstock" >>failed.19 ) && (echo "findpython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "findpython-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f frozenlist-feedstock.mark ]]; then
    if [[ -d frozenlist-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./frozenlist-feedstock >d 2>&1 && rm -f d && ( echo "done" >>frozenlist-feedstock.mark ) && true) || ( (echo "frozenlist-feedstock" >>failed.19 ) && (echo "frozenlist-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "frozenlist-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f mkl_fft-feedstock.mark ]]; then
    if [[ -d mkl_fft-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mkl_fft-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mkl_fft-feedstock.mark ) && true) || ( (echo "mkl_fft-feedstock" >>failed.19 ) && (echo "mkl_fft-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mkl_fft-feedstock not present" >>failed.19
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


if [[ ! -f pyqt-builder-feedstock.mark ]]; then
    if [[ -d pyqt-builder-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyqt-builder-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyqt-builder-feedstock.mark ) && true) || ( (echo "pyqt-builder-feedstock" >>failed.19 ) && (echo "pyqt-builder-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyqt-builder-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f pyqt-feedstock.mark ]]; then
    if [[ -d pyqt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyqt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyqt-feedstock.mark ) && true) || ( (echo "pyqt-feedstock" >>failed.19 ) && (echo "pyqt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyqt-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f python-dotenv-feedstock.mark ]]; then
    if [[ -d python-dotenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-dotenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-dotenv-feedstock.mark ) && true) || ( (echo "python-dotenv-feedstock" >>failed.19 ) && (echo "python-dotenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-dotenv-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f python-installer-feedstock.mark ]]; then
    if [[ -d python-installer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-installer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-installer-feedstock.mark ) && true) || ( (echo "python-installer-feedstock" >>failed.19 ) && (echo "python-installer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-installer-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f resolvelib-feedstock.mark ]]; then
    if [[ -d resolvelib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./resolvelib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>resolvelib-feedstock.mark ) && true) || ( (echo "resolvelib-feedstock" >>failed.19 ) && (echo "resolvelib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "resolvelib-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f rich-feedstock.mark ]]; then
    if [[ -d rich-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./rich-feedstock >d 2>&1 && rm -f d && ( echo "done" >>rich-feedstock.mark ) && true) || ( (echo "rich-feedstock" >>failed.19 ) && (echo "rich-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "rich-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f shellingham-feedstock.mark ]]; then
    if [[ -d shellingham-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./shellingham-feedstock >d 2>&1 && rm -f d && ( echo "done" >>shellingham-feedstock.mark ) && true) || ( (echo "shellingham-feedstock" >>failed.19 ) && (echo "shellingham-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "shellingham-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f unearth-feedstock.mark ]]; then
    if [[ -d unearth-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./unearth-feedstock >d 2>&1 && rm -f d && ( echo "done" >>unearth-feedstock.mark ) && true) || ( (echo "unearth-feedstock" >>failed.19 ) && (echo "unearth-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "unearth-feedstock not present" >>failed.19
    fi
fi


if [[ ! -f virtualenv-feedstock.mark ]]; then
    if [[ -d virtualenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./virtualenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>virtualenv-feedstock.mark ) && true) || ( (echo "virtualenv-feedstock" >>failed.19 ) && (echo "virtualenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "virtualenv-feedstock not present" >>failed.19
    fi
fi

