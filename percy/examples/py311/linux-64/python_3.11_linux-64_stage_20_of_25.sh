#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f async-timeout-feedstock.mark ]]; then
    if [[ -d async-timeout-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./async-timeout-feedstock >d 2>&1 && rm -f d && ( echo "done" >>async-timeout-feedstock.mark ) && true) || ( (echo "async-timeout-feedstock" >>failed.20 ) && (echo "async-timeout-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "async-timeout-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f botocore-feedstock.mark ]]; then
    if [[ -d botocore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./botocore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>botocore-feedstock.mark ) && true) || ( (echo "botocore-feedstock" >>failed.20 ) && (echo "botocore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "botocore-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f bottleneck-feedstock.mark ]]; then
    if [[ -d bottleneck-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bottleneck-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bottleneck-feedstock.mark ) && true) || ( (echo "bottleneck-feedstock" >>failed.20 ) && (echo "bottleneck-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bottleneck-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f colorama-feedstock.mark ]]; then
    if [[ -d colorama-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colorama-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colorama-feedstock.mark ) && true) || ( (echo "colorama-feedstock" >>failed.20 ) && (echo "colorama-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colorama-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f contourpy-feedstock.mark ]]; then
    if [[ -d contourpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./contourpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>contourpy-feedstock.mark ) && true) || ( (echo "contourpy-feedstock" >>failed.20 ) && (echo "contourpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "contourpy-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f jupyterlab_server-feedstock.mark ]]; then
    if [[ -d jupyterlab_server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterlab_server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterlab_server-feedstock.mark ) && true) || ( (echo "jupyterlab_server-feedstock" >>failed.20 ) && (echo "jupyterlab_server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterlab_server-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f keyring-feedstock.mark ]]; then
    if [[ -d keyring-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./keyring-feedstock >d 2>&1 && rm -f d && ( echo "done" >>keyring-feedstock.mark ) && true) || ( (echo "keyring-feedstock" >>failed.20 ) && (echo "keyring-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "keyring-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f kiwisolver-feedstock.mark ]]; then
    if [[ -d kiwisolver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./kiwisolver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>kiwisolver-feedstock.mark ) && true) || ( (echo "kiwisolver-feedstock" >>failed.20 ) && (echo "kiwisolver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "kiwisolver-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f lazy-object-proxy-feedstock.mark ]]; then
    if [[ -d lazy-object-proxy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lazy-object-proxy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lazy-object-proxy-feedstock.mark ) && true) || ( (echo "lazy-object-proxy-feedstock" >>failed.20 ) && (echo "lazy-object-proxy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lazy-object-proxy-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f locket-feedstock.mark ]]; then
    if [[ -d locket-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./locket-feedstock >d 2>&1 && rm -f d && ( echo "done" >>locket-feedstock.mark ) && true) || ( (echo "locket-feedstock" >>failed.20 ) && (echo "locket-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "locket-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f lockfile-feedstock.mark ]]; then
    if [[ -d lockfile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lockfile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lockfile-feedstock.mark ) && true) || ( (echo "lockfile-feedstock" >>failed.20 ) && (echo "lockfile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lockfile-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f mkl_random-feedstock.mark ]]; then
    if [[ -d mkl_random-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mkl_random-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mkl_random-feedstock.mark ) && true) || ( (echo "mkl_random-feedstock" >>failed.20 ) && (echo "mkl_random-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mkl_random-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f notebook-feedstock.mark ]]; then
    if [[ -d notebook-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./notebook-feedstock >d 2>&1 && rm -f d && ( echo "done" >>notebook-feedstock.mark ) && true) || ( (echo "notebook-feedstock" >>failed.20 ) && (echo "notebook-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "notebook-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f numexpr-feedstock.mark ]]; then
    if [[ -d numexpr-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numexpr-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numexpr-feedstock.mark ) && true) || ( (echo "numexpr-feedstock" >>failed.20 ) && (echo "numexpr-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numexpr-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f pdm-feedstock.mark ]]; then
    if [[ -d pdm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-feedstock.mark ) && true) || ( (echo "pdm-feedstock" >>failed.20 ) && (echo "pdm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f pillow-feedstock.mark ]]; then
    if [[ -d pillow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pillow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pillow-feedstock.mark ) && true) || ( (echo "pillow-feedstock" >>failed.20 ) && (echo "pillow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pillow-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f pkginfo-feedstock.mark ]]; then
    if [[ -d pkginfo-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pkginfo-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pkginfo-feedstock.mark ) && true) || ( (echo "pkginfo-feedstock" >>failed.20 ) && (echo "pkginfo-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pkginfo-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f pyparsing-feedstock.mark ]]; then
    if [[ -d pyparsing-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyparsing-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyparsing-feedstock.mark ) && true) || ( (echo "pyparsing-feedstock" >>failed.20 ) && (echo "pyparsing-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyparsing-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f pythran-feedstock.mark ]]; then
    if [[ -d pythran-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pythran-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pythran-feedstock.mark ) && true) || ( (echo "pythran-feedstock" >>failed.20 ) && (echo "pythran-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pythran-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f qtpy-feedstock.mark ]]; then
    if [[ -d qtpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./qtpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>qtpy-feedstock.mark ) && true) || ( (echo "qtpy-feedstock" >>failed.20 ) && (echo "qtpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "qtpy-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f readme_renderer-feedstock.mark ]]; then
    if [[ -d readme_renderer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./readme_renderer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>readme_renderer-feedstock.mark ) && true) || ( (echo "readme_renderer-feedstock" >>failed.20 ) && (echo "readme_renderer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "readme_renderer-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f setuptools_scm_git_archive-feedstock.mark ]]; then
    if [[ -d setuptools_scm_git_archive-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools_scm_git_archive-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools_scm_git_archive-feedstock.mark ) && true) || ( (echo "setuptools_scm_git_archive-feedstock" >>failed.20 ) && (echo "setuptools_scm_git_archive-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools_scm_git_archive-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f toolz-feedstock.mark ]]; then
    if [[ -d toolz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./toolz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>toolz-feedstock.mark ) && true) || ( (echo "toolz-feedstock" >>failed.20 ) && (echo "toolz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "toolz-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f tqdm-feedstock.mark ]]; then
    if [[ -d tqdm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tqdm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tqdm-feedstock.mark ) && true) || ( (echo "tqdm-feedstock" >>failed.20 ) && (echo "tqdm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tqdm-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f widgetsnbextension-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-feedstock.mark ) && true) || ( (echo "widgetsnbextension-feedstock" >>failed.20 ) && (echo "widgetsnbextension-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f widgetsnbextension-3.5.2-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-3.5.2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-3.5.2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-3.5.2-feedstock.mark ) && true) || ( (echo "widgetsnbextension-3.5.2-feedstock" >>failed.20 ) && (echo "widgetsnbextension-3.5.2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-3.5.2-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f wrapt-feedstock.mark ]]; then
    if [[ -d wrapt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wrapt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wrapt-feedstock.mark ) && true) || ( (echo "wrapt-feedstock" >>failed.20 ) && (echo "wrapt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wrapt-feedstock not present" >>failed.20
    fi
fi


if [[ ! -f yarl-feedstock.mark ]]; then
    if [[ -d yarl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./yarl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>yarl-feedstock.mark ) && true) || ( (echo "yarl-feedstock" >>failed.20 ) && (echo "yarl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "yarl-feedstock not present" >>failed.20
    fi
fi
