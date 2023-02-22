#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f aiohttp-feedstock.mark ]]; then
    if [[ -d aiohttp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aiohttp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aiohttp-feedstock.mark ) && true) || ( (echo "aiohttp-feedstock" >>failed.22 ) && (echo "aiohttp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aiohttp-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f contourpy-feedstock.mark ]]; then
    if [[ -d contourpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./contourpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>contourpy-feedstock.mark ) && true) || ( (echo "contourpy-feedstock" >>failed.22 ) && (echo "contourpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "contourpy-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f coverage-feedstock.mark ]]; then
    if [[ -d coverage-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./coverage-feedstock >d 2>&1 && rm -f d && ( echo "done" >>coverage-feedstock.mark ) && true) || ( (echo "coverage-feedstock" >>failed.22 ) && (echo "coverage-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "coverage-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f cppy-feedstock.mark ]]; then
    if [[ -d cppy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cppy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cppy-feedstock.mark ) && true) || ( (echo "cppy-feedstock" >>failed.22 ) && (echo "cppy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cppy-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f filesystem-spec-feedstock.mark ]]; then
    if [[ -d filesystem-spec-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./filesystem-spec-feedstock >d 2>&1 && rm -f d && ( echo "done" >>filesystem-spec-feedstock.mark ) && true) || ( (echo "filesystem-spec-feedstock" >>failed.22 ) && (echo "filesystem-spec-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "filesystem-spec-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f future-feedstock.mark ]]; then
    if [[ -d future-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./future-feedstock >d 2>&1 && rm -f d && ( echo "done" >>future-feedstock.mark ) && true) || ( (echo "future-feedstock" >>failed.22 ) && (echo "future-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "future-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f greenlet-feedstock.mark ]]; then
    if [[ -d greenlet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./greenlet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>greenlet-feedstock.mark ) && true) || ( (echo "greenlet-feedstock" >>failed.22 ) && (echo "greenlet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "greenlet-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f jupyterlab-feedstock.mark ]]; then
    if [[ -d jupyterlab-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterlab-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterlab-feedstock.mark ) && true) || ( (echo "jupyterlab-feedstock" >>failed.22 ) && (echo "jupyterlab-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterlab-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f lazy-object-proxy-feedstock.mark ]]; then
    if [[ -d lazy-object-proxy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lazy-object-proxy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lazy-object-proxy-feedstock.mark ) && true) || ( (echo "lazy-object-proxy-feedstock" >>failed.22 ) && (echo "lazy-object-proxy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lazy-object-proxy-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pandas-feedstock.mark ]]; then
    if [[ -d pandas-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandas-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandas-feedstock.mark ) && true) || ( (echo "pandas-feedstock" >>failed.22 ) && (echo "pandas-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandas-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f param-feedstock.mark ]]; then
    if [[ -d param-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./param-feedstock >d 2>&1 && rm -f d && ( echo "done" >>param-feedstock.mark ) && true) || ( (echo "param-feedstock" >>failed.22 ) && (echo "param-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "param-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pillow-feedstock.mark ]]; then
    if [[ -d pillow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pillow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pillow-feedstock.mark ) && true) || ( (echo "pillow-feedstock" >>failed.22 ) && (echo "pillow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pillow-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f protobuf-feedstock.mark ]]; then
    if [[ -d protobuf-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./protobuf-feedstock >d 2>&1 && rm -f d && ( echo "done" >>protobuf-feedstock.mark ) && true) || ( (echo "protobuf-feedstock" >>failed.22 ) && (echo "protobuf-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "protobuf-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pythran-feedstock.mark ]]; then
    if [[ -d pythran-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pythran-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pythran-feedstock.mark ) && true) || ( (echo "pythran-feedstock" >>failed.22 ) && (echo "pythran-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pythran-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyyaml-feedstock.mark ]]; then
    if [[ -d pyyaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyyaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyyaml-feedstock.mark ) && true) || ( (echo "pyyaml-feedstock" >>failed.22 ) && (echo "pyyaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyyaml-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f ruamel-feedstock.mark ]]; then
    if [[ -d ruamel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel-feedstock.mark ) && true) || ( (echo "ruamel-feedstock" >>failed.22 ) && (echo "ruamel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f ruamel.yaml.clib-feedstock.mark ]]; then
    if [[ -d ruamel.yaml.clib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel.yaml.clib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel.yaml.clib-feedstock.mark ) && true) || ( (echo "ruamel.yaml.clib-feedstock" >>failed.22 ) && (echo "ruamel.yaml.clib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel.yaml.clib-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f s3transfer-feedstock.mark ]]; then
    if [[ -d s3transfer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./s3transfer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>s3transfer-feedstock.mark ) && true) || ( (echo "s3transfer-feedstock" >>failed.22 ) && (echo "s3transfer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "s3transfer-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f setuptools-git-versioning-feedstock.mark ]]; then
    if [[ -d setuptools-git-versioning-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-git-versioning-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-git-versioning-feedstock.mark ) && true) || ( (echo "setuptools-git-versioning-feedstock" >>failed.22 ) && (echo "setuptools-git-versioning-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-git-versioning-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f widgetsnbextension-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-feedstock.mark ) && true) || ( (echo "widgetsnbextension-feedstock" >>failed.22 ) && (echo "widgetsnbextension-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f widgetsnbextension-3.5.2-feedstock.mark ]]; then
    if [[ -d widgetsnbextension-3.5.2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./widgetsnbextension-3.5.2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>widgetsnbextension-3.5.2-feedstock.mark ) && true) || ( (echo "widgetsnbextension-3.5.2-feedstock" >>failed.22 ) && (echo "widgetsnbextension-3.5.2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "widgetsnbextension-3.5.2-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f wrapt-feedstock.mark ]]; then
    if [[ -d wrapt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wrapt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wrapt-feedstock.mark ) && true) || ( (echo "wrapt-feedstock" >>failed.22 ) && (echo "wrapt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wrapt-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f xyzservices-feedstock.mark ]]; then
    if [[ -d xyzservices-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xyzservices-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xyzservices-feedstock.mark ) && true) || ( (echo "xyzservices-feedstock" >>failed.22 ) && (echo "xyzservices-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xyzservices-feedstock not present" >>failed.22
    fi
fi

