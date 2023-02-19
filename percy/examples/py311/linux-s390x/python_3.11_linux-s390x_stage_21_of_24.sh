#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f altgraph-feedstock.mark ]]; then
    if [[ -d altgraph-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./altgraph-feedstock >d 2>&1 && rm -f d && ( echo "done" >>altgraph-feedstock.mark ) && true) || ( (echo "altgraph-feedstock" >>failed.21 ) && (echo "altgraph-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "altgraph-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f astroid-feedstock.mark ]]; then
    if [[ -d astroid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./astroid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>astroid-feedstock.mark ) && true) || ( (echo "astroid-feedstock" >>failed.21 ) && (echo "astroid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "astroid-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f blinker-feedstock.mark ]]; then
    if [[ -d blinker-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./blinker-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>blinker-feedstock.mark ) && true) || ( (echo "blinker-feedstock" >>failed.21 ) && (echo "blinker-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "blinker-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f click-feedstock.mark ]]; then
    if [[ -d click-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-feedstock.mark ) && true) || ( (echo "click-feedstock" >>failed.21 ) && (echo "click-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f conda-package-handling-feedstock.mark ]]; then
    if [[ -d conda-package-handling-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-package-handling-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-package-handling-feedstock.mark ) && true) || ( (echo "conda-package-handling-feedstock" >>failed.21 ) && (echo "conda-package-handling-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-package-handling-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f contourpy-feedstock.mark ]]; then
    if [[ -d contourpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./contourpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>contourpy-feedstock.mark ) && true) || ( (echo "contourpy-feedstock" >>failed.21 ) && (echo "contourpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "contourpy-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f dask-core-feedstock.mark ]]; then
    if [[ -d dask-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-core-feedstock.mark ) && true) || ( (echo "dask-core-feedstock" >>failed.21 ) && (echo "dask-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-core-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f dill-feedstock.mark ]]; then
    if [[ -d dill-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dill-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dill-feedstock.mark ) && true) || ( (echo "dill-feedstock" >>failed.21 ) && (echo "dill-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dill-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f googleapis-common-protos-feedstock.mark ]]; then
    if [[ -d googleapis-common-protos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./googleapis-common-protos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>googleapis-common-protos-feedstock.mark ) && true) || ( (echo "googleapis-common-protos-feedstock" >>failed.21 ) && (echo "googleapis-common-protos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "googleapis-common-protos-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f grpcio-feedstock.mark ]]; then
    if [[ -d grpcio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./grpcio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>grpcio-feedstock.mark ) && true) || ( (echo "grpcio-feedstock" >>failed.21 ) && (echo "grpcio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "grpcio-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f joblib-feedstock.mark ]]; then
    if [[ -d joblib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./joblib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>joblib-feedstock.mark ) && true) || ( (echo "joblib-feedstock" >>failed.21 ) && (echo "joblib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "joblib-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f jupyter-feedstock.mark ]]; then
    if [[ -d jupyter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter-feedstock.mark ) && true) || ( (echo "jupyter-feedstock" >>failed.21 ) && (echo "jupyter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f kiwisolver-feedstock.mark ]]; then
    if [[ -d kiwisolver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./kiwisolver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>kiwisolver-feedstock.mark ) && true) || ( (echo "kiwisolver-feedstock" >>failed.21 ) && (echo "kiwisolver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "kiwisolver-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f mccabe-feedstock.mark ]]; then
    if [[ -d mccabe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-feedstock.mark ) && true) || ( (echo "mccabe-feedstock" >>failed.21 ) && (echo "mccabe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f mccabe-0.6.1-feedstock.mark ]]; then
    if [[ -d mccabe-0.6.1-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-0.6.1-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-0.6.1-feedstock.mark ) && true) || ( (echo "mccabe-0.6.1-feedstock" >>failed.21 ) && (echo "mccabe-0.6.1-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-0.6.1-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f mypy_extensions-feedstock.mark ]]; then
    if [[ -d mypy_extensions-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mypy_extensions-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mypy_extensions-feedstock.mark ) && true) || ( (echo "mypy_extensions-feedstock" >>failed.21 ) && (echo "mypy_extensions-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mypy_extensions-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f onnx-feedstock.mark ]]; then
    if [[ -d onnx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./onnx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>onnx-feedstock.mark ) && true) || ( (echo "onnx-feedstock" >>failed.21 ) && (echo "onnx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "onnx-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pandas-feedstock.mark ]]; then
    if [[ -d pandas-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandas-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandas-feedstock.mark ) && true) || ( (echo "pandas-feedstock" >>failed.21 ) && (echo "pandas-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandas-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pdm-pep517-feedstock.mark ]]; then
    if [[ -d pdm-pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-pep517-feedstock.mark ) && true) || ( (echo "pdm-pep517-feedstock" >>failed.21 ) && (echo "pdm-pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-pep517-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pillow-feedstock.mark ]]; then
    if [[ -d pillow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pillow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pillow-feedstock.mark ) && true) || ( (echo "pillow-feedstock" >>failed.21 ) && (echo "pillow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pillow-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f poetry-feedstock.mark ]]; then
    if [[ -d poetry-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./poetry-feedstock >d 2>&1 && rm -f d && ( echo "done" >>poetry-feedstock.mark ) && true) || ( (echo "poetry-feedstock" >>failed.21 ) && (echo "poetry-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "poetry-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pycodestyle-feedstock.mark ]]; then
    if [[ -d pycodestyle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycodestyle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycodestyle-feedstock.mark ) && true) || ( (echo "pycodestyle-feedstock" >>failed.21 ) && (echo "pycodestyle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycodestyle-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pycosat-feedstock.mark ]]; then
    if [[ -d pycosat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycosat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycosat-feedstock.mark ) && true) || ( (echo "pycosat-feedstock" >>failed.21 ) && (echo "pycosat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycosat-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pyflakes-feedstock.mark ]]; then
    if [[ -d pyflakes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyflakes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyflakes-feedstock.mark ) && true) || ( (echo "pyflakes-feedstock" >>failed.21 ) && (echo "pyflakes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyflakes-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pyinstaller-hooks-contrib-feedstock.mark ]]; then
    if [[ -d pyinstaller-hooks-contrib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyinstaller-hooks-contrib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyinstaller-hooks-contrib-feedstock.mark ) && true) || ( (echo "pyinstaller-hooks-contrib-feedstock" >>failed.21 ) && (echo "pyinstaller-hooks-contrib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyinstaller-hooks-contrib-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f pyjwt-feedstock.mark ]]; then
    if [[ -d pyjwt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyjwt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyjwt-feedstock.mark ) && true) || ( (echo "pyjwt-feedstock" >>failed.21 ) && (echo "pyjwt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyjwt-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f ruamel.yaml-feedstock.mark ]]; then
    if [[ -d ruamel.yaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel.yaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel.yaml-feedstock.mark ) && true) || ( (echo "ruamel.yaml-feedstock" >>failed.21 ) && (echo "ruamel.yaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel.yaml-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f scipy-feedstock.mark ]]; then
    if [[ -d scipy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scipy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scipy-feedstock.mark ) && true) || ( (echo "scipy-feedstock" >>failed.21 ) && (echo "scipy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scipy-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f setuptools_scm_git_archive-feedstock.mark ]]; then
    if [[ -d setuptools_scm_git_archive-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools_scm_git_archive-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools_scm_git_archive-feedstock.mark ) && true) || ( (echo "setuptools_scm_git_archive-feedstock" >>failed.21 ) && (echo "setuptools_scm_git_archive-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools_scm_git_archive-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f tenacity-feedstock.mark ]]; then
    if [[ -d tenacity-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tenacity-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tenacity-feedstock.mark ) && true) || ( (echo "tenacity-feedstock" >>failed.21 ) && (echo "tenacity-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tenacity-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f ujson-feedstock.mark ]]; then
    if [[ -d ujson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ujson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ujson-feedstock.mark ) && true) || ( (echo "ujson-feedstock" >>failed.21 ) && (echo "ujson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ujson-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f waf-feedstock.mark ]]; then
    if [[ -d waf-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./waf-feedstock >d 2>&1 && rm -f d && ( echo "done" >>waf-feedstock.mark ) && true) || ( (echo "waf-feedstock" >>failed.21 ) && (echo "waf-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "waf-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f werkzeug-feedstock.mark ]]; then
    if [[ -d werkzeug-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./werkzeug-feedstock >d 2>&1 && rm -f d && ( echo "done" >>werkzeug-feedstock.mark ) && true) || ( (echo "werkzeug-feedstock" >>failed.21 ) && (echo "werkzeug-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "werkzeug-feedstock not present" >>failed.21
    fi
fi


if [[ ! -f zict-feedstock.mark ]]; then
    if [[ -d zict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zict-feedstock.mark ) && true) || ( (echo "zict-feedstock" >>failed.21 ) && (echo "zict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zict-feedstock not present" >>failed.21
    fi
fi

