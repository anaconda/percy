#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f bcrypt-feedstock.mark ]]; then
    if [[ -d bcrypt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bcrypt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bcrypt-feedstock.mark ) && true) || ( (echo "bcrypt-feedstock" >>failed.18 ) && (echo "bcrypt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bcrypt-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f click-feedstock.mark ]]; then
    if [[ -d click-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-feedstock.mark ) && true) || ( (echo "click-feedstock" >>failed.18 ) && (echo "click-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f dnspython-feedstock.mark ]]; then
    if [[ -d dnspython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dnspython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dnspython-feedstock.mark ) && true) || ( (echo "dnspython-feedstock" >>failed.18 ) && (echo "dnspython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dnspython-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f frozenlist-feedstock.mark ]]; then
    if [[ -d frozenlist-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./frozenlist-feedstock >d 2>&1 && rm -f d && ( echo "done" >>frozenlist-feedstock.mark ) && true) || ( (echo "frozenlist-feedstock" >>failed.18 ) && (echo "frozenlist-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "frozenlist-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f greenlet-feedstock.mark ]]; then
    if [[ -d greenlet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./greenlet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>greenlet-feedstock.mark ) && true) || ( (echo "greenlet-feedstock" >>failed.18 ) && (echo "greenlet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "greenlet-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f infinity-feedstock.mark ]]; then
    if [[ -d infinity-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./infinity-feedstock >d 2>&1 && rm -f d && ( echo "done" >>infinity-feedstock.mark ) && true) || ( (echo "infinity-feedstock" >>failed.18 ) && (echo "infinity-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "infinity-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f mccabe-feedstock.mark ]]; then
    if [[ -d mccabe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-feedstock.mark ) && true) || ( (echo "mccabe-feedstock" >>failed.18 ) && (echo "mccabe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f mccabe-0.6.1-feedstock.mark ]]; then
    if [[ -d mccabe-0.6.1-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-0.6.1-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-0.6.1-feedstock.mark ) && true) || ( (echo "mccabe-0.6.1-feedstock" >>failed.18 ) && (echo "mccabe-0.6.1-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-0.6.1-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f multidict-feedstock.mark ]]; then
    if [[ -d multidict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multidict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multidict-feedstock.mark ) && true) || ( (echo "multidict-feedstock" >>failed.18 ) && (echo "multidict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multidict-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f nbclassic-feedstock.mark ]]; then
    if [[ -d nbclassic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbclassic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbclassic-feedstock.mark ) && true) || ( (echo "nbclassic-feedstock" >>failed.18 ) && (echo "nbclassic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbclassic-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f orderedmultidict-feedstock.mark ]]; then
    if [[ -d orderedmultidict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./orderedmultidict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>orderedmultidict-feedstock.mark ) && true) || ( (echo "orderedmultidict-feedstock" >>failed.18 ) && (echo "orderedmultidict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "orderedmultidict-feedstock not present" >>failed.18
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


if [[ ! -f pycodestyle-feedstock.mark ]]; then
    if [[ -d pycodestyle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycodestyle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycodestyle-feedstock.mark ) && true) || ( (echo "pycodestyle-feedstock" >>failed.18 ) && (echo "pycodestyle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycodestyle-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f pyflakes-feedstock.mark ]]; then
    if [[ -d pyflakes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyflakes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyflakes-feedstock.mark ) && true) || ( (echo "pyflakes-feedstock" >>failed.18 ) && (echo "pyflakes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyflakes-feedstock not present" >>failed.18
    fi
fi


if [[ ! -f werkzeug-feedstock.mark ]]; then
    if [[ -d werkzeug-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./werkzeug-feedstock >d 2>&1 && rm -f d && ( echo "done" >>werkzeug-feedstock.mark ) && true) || ( (echo "werkzeug-feedstock" >>failed.18 ) && (echo "werkzeug-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "werkzeug-feedstock not present" >>failed.18
    fi
fi

