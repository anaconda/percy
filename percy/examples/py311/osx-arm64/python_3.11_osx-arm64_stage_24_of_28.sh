#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f aiohttp-feedstock.mark ]]; then
    if [[ -d aiohttp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aiohttp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aiohttp-feedstock.mark ) && true) || ( (echo "aiohttp-feedstock" >>failed.24 ) && (echo "aiohttp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aiohttp-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f astroid-feedstock.mark ]]; then
    if [[ -d astroid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./astroid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>astroid-feedstock.mark ) && true) || ( (echo "astroid-feedstock" >>failed.24 ) && (echo "astroid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "astroid-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f coverage-feedstock.mark ]]; then
    if [[ -d coverage-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./coverage-feedstock >d 2>&1 && rm -f d && ( echo "done" >>coverage-feedstock.mark ) && true) || ( (echo "coverage-feedstock" >>failed.24 ) && (echo "coverage-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "coverage-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f dill-feedstock.mark ]]; then
    if [[ -d dill-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dill-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dill-feedstock.mark ) && true) || ( (echo "dill-feedstock" >>failed.24 ) && (echo "dill-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dill-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f filesystem-spec-feedstock.mark ]]; then
    if [[ -d filesystem-spec-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./filesystem-spec-feedstock >d 2>&1 && rm -f d && ( echo "done" >>filesystem-spec-feedstock.mark ) && true) || ( (echo "filesystem-spec-feedstock" >>failed.24 ) && (echo "filesystem-spec-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "filesystem-spec-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f future-feedstock.mark ]]; then
    if [[ -d future-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./future-feedstock >d 2>&1 && rm -f d && ( echo "done" >>future-feedstock.mark ) && true) || ( (echo "future-feedstock" >>failed.24 ) && (echo "future-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "future-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f greenlet-feedstock.mark ]]; then
    if [[ -d greenlet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./greenlet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>greenlet-feedstock.mark ) && true) || ( (echo "greenlet-feedstock" >>failed.24 ) && (echo "greenlet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "greenlet-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f imagecodecs-feedstock.mark ]]; then
    if [[ -d imagecodecs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imagecodecs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imagecodecs-feedstock.mark ) && true) || ( (echo "imagecodecs-feedstock" >>failed.24 ) && (echo "imagecodecs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imagecodecs-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jupyter_console-feedstock.mark ]]; then
    if [[ -d jupyter_console-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_console-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_console-feedstock.mark ) && true) || ( (echo "jupyter_console-feedstock" >>failed.24 ) && (echo "jupyter_console-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_console-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jupyterlab-feedstock.mark ]]; then
    if [[ -d jupyterlab-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterlab-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterlab-feedstock.mark ) && true) || ( (echo "jupyterlab-feedstock" >>failed.24 ) && (echo "jupyterlab-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterlab-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f matplotlib-feedstock.mark ]]; then
    if [[ -d matplotlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./matplotlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>matplotlib-feedstock.mark ) && true) || ( (echo "matplotlib-feedstock" >>failed.24 ) && (echo "matplotlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "matplotlib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mccabe-feedstock.mark ]]; then
    if [[ -d mccabe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-feedstock.mark ) && true) || ( (echo "mccabe-feedstock" >>failed.24 ) && (echo "mccabe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mccabe-0.6.1-feedstock.mark ]]; then
    if [[ -d mccabe-0.6.1-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-0.6.1-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-0.6.1-feedstock.mark ) && true) || ( (echo "mccabe-0.6.1-feedstock" >>failed.24 ) && (echo "mccabe-0.6.1-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-0.6.1-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pandas-feedstock.mark ]]; then
    if [[ -d pandas-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandas-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandas-feedstock.mark ) && true) || ( (echo "pandas-feedstock" >>failed.24 ) && (echo "pandas-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandas-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f param-feedstock.mark ]]; then
    if [[ -d param-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./param-feedstock >d 2>&1 && rm -f d && ( echo "done" >>param-feedstock.mark ) && true) || ( (echo "param-feedstock" >>failed.24 ) && (echo "param-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "param-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f protobuf-feedstock.mark ]]; then
    if [[ -d protobuf-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./protobuf-feedstock >d 2>&1 && rm -f d && ( echo "done" >>protobuf-feedstock.mark ) && true) || ( (echo "protobuf-feedstock" >>failed.24 ) && (echo "protobuf-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "protobuf-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pycodestyle-feedstock.mark ]]; then
    if [[ -d pycodestyle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycodestyle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycodestyle-feedstock.mark ) && true) || ( (echo "pycodestyle-feedstock" >>failed.24 ) && (echo "pycodestyle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycodestyle-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyflakes-feedstock.mark ]]; then
    if [[ -d pyflakes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyflakes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyflakes-feedstock.mark ) && true) || ( (echo "pyflakes-feedstock" >>failed.24 ) && (echo "pyflakes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyflakes-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyobjc-framework-cocoa-feedstock.mark ]]; then
    if [[ -d pyobjc-framework-cocoa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyobjc-framework-cocoa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyobjc-framework-cocoa-feedstock.mark ) && true) || ( (echo "pyobjc-framework-cocoa-feedstock" >>failed.24 ) && (echo "pyobjc-framework-cocoa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyobjc-framework-cocoa-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyyaml-feedstock.mark ]]; then
    if [[ -d pyyaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyyaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyyaml-feedstock.mark ) && true) || ( (echo "pyyaml-feedstock" >>failed.24 ) && (echo "pyyaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyyaml-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f qtconsole-feedstock.mark ]]; then
    if [[ -d qtconsole-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./qtconsole-feedstock >d 2>&1 && rm -f d && ( echo "done" >>qtconsole-feedstock.mark ) && true) || ( (echo "qtconsole-feedstock" >>failed.24 ) && (echo "qtconsole-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "qtconsole-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ruamel-feedstock.mark ]]; then
    if [[ -d ruamel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel-feedstock.mark ) && true) || ( (echo "ruamel-feedstock" >>failed.24 ) && (echo "ruamel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ruamel.yaml.clib-feedstock.mark ]]; then
    if [[ -d ruamel.yaml.clib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel.yaml.clib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel.yaml.clib-feedstock.mark ) && true) || ( (echo "ruamel.yaml.clib-feedstock" >>failed.24 ) && (echo "ruamel.yaml.clib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel.yaml.clib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f s3transfer-feedstock.mark ]]; then
    if [[ -d s3transfer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./s3transfer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>s3transfer-feedstock.mark ) && true) || ( (echo "s3transfer-feedstock" >>failed.24 ) && (echo "s3transfer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "s3transfer-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f scipy-feedstock.mark ]]; then
    if [[ -d scipy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scipy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scipy-feedstock.mark ) && true) || ( (echo "scipy-feedstock" >>failed.24 ) && (echo "scipy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scipy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f setuptools-git-versioning-feedstock.mark ]]; then
    if [[ -d setuptools-git-versioning-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-git-versioning-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-git-versioning-feedstock.mark ) && true) || ( (echo "setuptools-git-versioning-feedstock" >>failed.24 ) && (echo "setuptools-git-versioning-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-git-versioning-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ujson-feedstock.mark ]]; then
    if [[ -d ujson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ujson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ujson-feedstock.mark ) && true) || ( (echo "ujson-feedstock" >>failed.24 ) && (echo "ujson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ujson-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f xyzservices-feedstock.mark ]]; then
    if [[ -d xyzservices-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xyzservices-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xyzservices-feedstock.mark ) && true) || ( (echo "xyzservices-feedstock" >>failed.24 ) && (echo "xyzservices-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xyzservices-feedstock not present" >>failed.24
    fi
fi

