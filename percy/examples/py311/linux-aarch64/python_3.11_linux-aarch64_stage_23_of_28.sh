#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f anyjson-feedstock.mark ]]; then
    if [[ -d anyjson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anyjson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anyjson-feedstock.mark ) && true) || ( (echo "anyjson-feedstock" >>failed.23 ) && (echo "anyjson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anyjson-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f arrow-feedstock.mark ]]; then
    if [[ -d arrow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./arrow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>arrow-feedstock.mark ) && true) || ( (echo "arrow-feedstock" >>failed.23 ) && (echo "arrow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "arrow-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f async-timeout-feedstock.mark ]]; then
    if [[ -d async-timeout-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./async-timeout-feedstock >d 2>&1 && rm -f d && ( echo "done" >>async-timeout-feedstock.mark ) && true) || ( (echo "async-timeout-feedstock" >>failed.23 ) && (echo "async-timeout-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "async-timeout-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f botocore-feedstock.mark ]]; then
    if [[ -d botocore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./botocore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>botocore-feedstock.mark ) && true) || ( (echo "botocore-feedstock" >>failed.23 ) && (echo "botocore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "botocore-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f bottleneck-feedstock.mark ]]; then
    if [[ -d bottleneck-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bottleneck-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bottleneck-feedstock.mark ) && true) || ( (echo "bottleneck-feedstock" >>failed.23 ) && (echo "bottleneck-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bottleneck-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f colorama-feedstock.mark ]]; then
    if [[ -d colorama-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colorama-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colorama-feedstock.mark ) && true) || ( (echo "colorama-feedstock" >>failed.23 ) && (echo "colorama-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colorama-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f colour-feedstock.mark ]]; then
    if [[ -d colour-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colour-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colour-feedstock.mark ) && true) || ( (echo "colour-feedstock" >>failed.23 ) && (echo "colour-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colour-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f contourpy-feedstock.mark ]]; then
    if [[ -d contourpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./contourpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>contourpy-feedstock.mark ) && true) || ( (echo "contourpy-feedstock" >>failed.23 ) && (echo "contourpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "contourpy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f email-validator-feedstock.mark ]]; then
    if [[ -d email-validator-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./email-validator-feedstock >d 2>&1 && rm -f d && ( echo "done" >>email-validator-feedstock.mark ) && true) || ( (echo "email-validator-feedstock" >>failed.23 ) && (echo "email-validator-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "email-validator-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f flake8-feedstock.mark ]]; then
    if [[ -d flake8-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flake8-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flake8-feedstock.mark ) && true) || ( (echo "flake8-feedstock" >>failed.23 ) && (echo "flake8-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flake8-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f flask-feedstock.mark ]]; then
    if [[ -d flask-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-feedstock.mark ) && true) || ( (echo "flask-feedstock" >>failed.23 ) && (echo "flask-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f flit-scm-feedstock.mark ]]; then
    if [[ -d flit-scm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flit-scm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flit-scm-feedstock.mark ) && true) || ( (echo "flit-scm-feedstock" >>failed.23 ) && (echo "flit-scm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flit-scm-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f future-feedstock.mark ]]; then
    if [[ -d future-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./future-feedstock >d 2>&1 && rm -f d && ( echo "done" >>future-feedstock.mark ) && true) || ( (echo "future-feedstock" >>failed.23 ) && (echo "future-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "future-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f h2-feedstock.mark ]]; then
    if [[ -d h2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./h2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>h2-feedstock.mark ) && true) || ( (echo "h2-feedstock" >>failed.23 ) && (echo "h2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "h2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f intervals-feedstock.mark ]]; then
    if [[ -d intervals-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./intervals-feedstock >d 2>&1 && rm -f d && ( echo "done" >>intervals-feedstock.mark ) && true) || ( (echo "intervals-feedstock" >>failed.23 ) && (echo "intervals-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "intervals-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f jupyterlab_server-feedstock.mark ]]; then
    if [[ -d jupyterlab_server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterlab_server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterlab_server-feedstock.mark ) && true) || ( (echo "jupyterlab_server-feedstock" >>failed.23 ) && (echo "jupyterlab_server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterlab_server-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f kiwisolver-feedstock.mark ]]; then
    if [[ -d kiwisolver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./kiwisolver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>kiwisolver-feedstock.mark ) && true) || ( (echo "kiwisolver-feedstock" >>failed.23 ) && (echo "kiwisolver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "kiwisolver-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f lazy-object-proxy-feedstock.mark ]]; then
    if [[ -d lazy-object-proxy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lazy-object-proxy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lazy-object-proxy-feedstock.mark ) && true) || ( (echo "lazy-object-proxy-feedstock" >>failed.23 ) && (echo "lazy-object-proxy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lazy-object-proxy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f locket-feedstock.mark ]]; then
    if [[ -d locket-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./locket-feedstock >d 2>&1 && rm -f d && ( echo "done" >>locket-feedstock.mark ) && true) || ( (echo "locket-feedstock" >>failed.23 ) && (echo "locket-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "locket-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mdurl-feedstock.mark ]]; then
    if [[ -d mdurl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mdurl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mdurl-feedstock.mark ) && true) || ( (echo "mdurl-feedstock" >>failed.23 ) && (echo "mdurl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mdurl-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f notebook-feedstock.mark ]]; then
    if [[ -d notebook-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./notebook-feedstock >d 2>&1 && rm -f d && ( echo "done" >>notebook-feedstock.mark ) && true) || ( (echo "notebook-feedstock" >>failed.23 ) && (echo "notebook-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "notebook-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f numexpr-feedstock.mark ]]; then
    if [[ -d numexpr-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numexpr-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numexpr-feedstock.mark ) && true) || ( (echo "numexpr-feedstock" >>failed.23 ) && (echo "numexpr-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numexpr-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pdm-pep517-feedstock.mark ]]; then
    if [[ -d pdm-pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-pep517-feedstock.mark ) && true) || ( (echo "pdm-pep517-feedstock" >>failed.23 ) && (echo "pdm-pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-pep517-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pillow-feedstock.mark ]]; then
    if [[ -d pillow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pillow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pillow-feedstock.mark ) && true) || ( (echo "pillow-feedstock" >>failed.23 ) && (echo "pillow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pillow-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyjwt-feedstock.mark ]]; then
    if [[ -d pyjwt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyjwt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyjwt-feedstock.mark ) && true) || ( (echo "pyjwt-feedstock" >>failed.23 ) && (echo "pyjwt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyjwt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pythran-feedstock.mark ]]; then
    if [[ -d pythran-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pythran-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pythran-feedstock.mark ) && true) || ( (echo "pythran-feedstock" >>failed.23 ) && (echo "pythran-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pythran-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyyaml-feedstock.mark ]]; then
    if [[ -d pyyaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyyaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyyaml-feedstock.mark ) && true) || ( (echo "pyyaml-feedstock" >>failed.23 ) && (echo "pyyaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyyaml-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f qtpy-feedstock.mark ]]; then
    if [[ -d qtpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./qtpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>qtpy-feedstock.mark ) && true) || ( (echo "qtpy-feedstock" >>failed.23 ) && (echo "qtpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "qtpy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f setuptools_scm_git_archive-feedstock.mark ]]; then
    if [[ -d setuptools_scm_git_archive-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools_scm_git_archive-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools_scm_git_archive-feedstock.mark ) && true) || ( (echo "setuptools_scm_git_archive-feedstock" >>failed.23 ) && (echo "setuptools_scm_git_archive-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools_scm_git_archive-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sqlalchemy-feedstock.mark ]]; then
    if [[ -d sqlalchemy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sqlalchemy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sqlalchemy-feedstock.mark ) && true) || ( (echo "sqlalchemy-feedstock" >>failed.23 ) && (echo "sqlalchemy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sqlalchemy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f toolz-feedstock.mark ]]; then
    if [[ -d toolz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./toolz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>toolz-feedstock.mark ) && true) || ( (echo "toolz-feedstock" >>failed.23 ) && (echo "toolz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "toolz-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f tqdm-feedstock.mark ]]; then
    if [[ -d tqdm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tqdm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tqdm-feedstock.mark ) && true) || ( (echo "tqdm-feedstock" >>failed.23 ) && (echo "tqdm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tqdm-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f widgetsnbextension-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-feedstock.mark ) && true) || ( (echo "widgetsnbextension-feedstock" >>failed.23 ) && (echo "widgetsnbextension-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f widgetsnbextension-3.5.2-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-3.5.2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-3.5.2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-3.5.2-feedstock.mark ) && true) || ( (echo "widgetsnbextension-3.5.2-feedstock" >>failed.23 ) && (echo "widgetsnbextension-3.5.2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-3.5.2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f wrapt-feedstock.mark ]]; then
    if [[ -d wrapt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wrapt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wrapt-feedstock.mark ) && true) || ( (echo "wrapt-feedstock" >>failed.23 ) && (echo "wrapt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wrapt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f yarl-feedstock.mark ]]; then
    if [[ -d yarl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./yarl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>yarl-feedstock.mark ) && true) || ( (echo "yarl-feedstock" >>failed.23 ) && (echo "yarl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "yarl-feedstock not present" >>failed.23
    fi
fi

