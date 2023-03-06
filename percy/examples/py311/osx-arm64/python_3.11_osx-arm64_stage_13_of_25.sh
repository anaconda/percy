#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f docutils-feedstock.mark ]]; then
    if [[ -d docutils-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docutils-feedstock >d 2>&1 && rm -f d && ( echo "done" >>docutils-feedstock.mark ) && true) || ( (echo "docutils-feedstock" >>failed.13 ) && (echo "docutils-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docutils-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f entrypoints-feedstock.mark ]]; then
    if [[ -d entrypoints-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./entrypoints-feedstock >d 2>&1 && rm -f d && ( echo "done" >>entrypoints-feedstock.mark ) && true) || ( (echo "entrypoints-feedstock" >>failed.13 ) && (echo "entrypoints-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "entrypoints-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f hatch-nodejs-version-feedstock.mark ]]; then
    if [[ -d hatch-nodejs-version-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-nodejs-version-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-nodejs-version-feedstock.mark ) && true) || ( (echo "hatch-nodejs-version-feedstock" >>failed.13 ) && (echo "hatch-nodejs-version-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-nodejs-version-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f jsonschema-feedstock.mark ]]; then
    if [[ -d jsonschema-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jsonschema-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jsonschema-feedstock.mark ) && true) || ( (echo "jsonschema-feedstock" >>failed.13 ) && (echo "jsonschema-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jsonschema-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f jupyter_core-feedstock.mark ]]; then
    if [[ -d jupyter_core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_core-feedstock.mark ) && true) || ( (echo "jupyter_core-feedstock" >>failed.13 ) && (echo "jupyter_core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_core-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f meson-feedstock.mark ]]; then
    if [[ -d meson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./meson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>meson-feedstock.mark ) && true) || ( (echo "meson-feedstock" >>failed.13 ) && (echo "meson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "meson-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f nest-asyncio-feedstock.mark ]]; then
    if [[ -d nest-asyncio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nest-asyncio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nest-asyncio-feedstock.mark ) && true) || ( (echo "nest-asyncio-feedstock" >>failed.13 ) && (echo "nest-asyncio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nest-asyncio-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f pkgconfig-feedstock.mark ]]; then
    if [[ -d pkgconfig-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pkgconfig-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pkgconfig-feedstock.mark ) && true) || ( (echo "pkgconfig-feedstock" >>failed.13 ) && (echo "pkgconfig-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pkgconfig-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f python-fastjsonschema-feedstock.mark ]]; then
    if [[ -d python-fastjsonschema-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-fastjsonschema-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-fastjsonschema-feedstock.mark ) && true) || ( (echo "python-fastjsonschema-feedstock" >>failed.13 ) && (echo "python-fastjsonschema-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-fastjsonschema-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f pyzmq-feedstock.mark ]]; then
    if [[ -d pyzmq-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyzmq-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyzmq-feedstock.mark ) && true) || ( (echo "pyzmq-feedstock" >>failed.13 ) && (echo "pyzmq-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyzmq-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f requests-feedstock.mark ]]; then
    if [[ -d requests-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-feedstock.mark ) && true) || ( (echo "requests-feedstock" >>failed.13 ) && (echo "requests-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-feedstock not present" >>failed.13
    fi
fi


if [[ ! -f tornado-feedstock.mark ]]; then
    if [[ -d tornado-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tornado-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tornado-feedstock.mark ) && true) || ( (echo "tornado-feedstock" >>failed.13 ) && (echo "tornado-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tornado-feedstock not present" >>failed.13
    fi
fi

