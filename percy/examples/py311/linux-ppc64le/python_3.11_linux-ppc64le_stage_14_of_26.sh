#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f entrypoints-feedstock.mark ]]; then
    if [[ -d entrypoints-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./entrypoints-feedstock >d 2>&1 && rm -f d && ( echo "done" >>entrypoints-feedstock.mark ) && true) || ( (echo "entrypoints-feedstock" >>failed.14 ) && (echo "entrypoints-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "entrypoints-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f hatch-nodejs-version-feedstock.mark ]]; then
    if [[ -d hatch-nodejs-version-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-nodejs-version-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-nodejs-version-feedstock.mark ) && true) || ( (echo "hatch-nodejs-version-feedstock" >>failed.14 ) && (echo "hatch-nodejs-version-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-nodejs-version-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f jsonschema-feedstock.mark ]]; then
    if [[ -d jsonschema-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jsonschema-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jsonschema-feedstock.mark ) && true) || ( (echo "jsonschema-feedstock" >>failed.14 ) && (echo "jsonschema-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jsonschema-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f jupyter_core-feedstock.mark ]]; then
    if [[ -d jupyter_core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_core-feedstock.mark ) && true) || ( (echo "jupyter_core-feedstock" >>failed.14 ) && (echo "jupyter_core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_core-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f nest-asyncio-feedstock.mark ]]; then
    if [[ -d nest-asyncio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nest-asyncio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nest-asyncio-feedstock.mark ) && true) || ( (echo "nest-asyncio-feedstock" >>failed.14 ) && (echo "nest-asyncio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nest-asyncio-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f python-fastjsonschema-feedstock.mark ]]; then
    if [[ -d python-fastjsonschema-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-fastjsonschema-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-fastjsonschema-feedstock.mark ) && true) || ( (echo "python-fastjsonschema-feedstock" >>failed.14 ) && (echo "python-fastjsonschema-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-fastjsonschema-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f tornado-feedstock.mark ]]; then
    if [[ -d tornado-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tornado-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tornado-feedstock.mark ) && true) || ( (echo "tornado-feedstock" >>failed.14 ) && (echo "tornado-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tornado-feedstock not present" >>failed.14
    fi
fi


if [[ ! -f zipp-feedstock.mark ]]; then
    if [[ -d zipp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zipp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zipp-feedstock.mark ) && true) || ( (echo "zipp-feedstock" >>failed.14 ) && (echo "zipp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zipp-feedstock not present" >>failed.14
    fi
fi

