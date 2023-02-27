#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f black-feedstock.mark ]]; then
    if [[ -d black-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./black-feedstock >d 2>&1 && rm -f d && ( echo "done" >>black-feedstock.mark ) && true) || ( (echo "black-feedstock" >>failed.22 ) && (echo "black-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "black-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f boolean.py-feedstock.mark ]]; then
    if [[ -d boolean.py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boolean.py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boolean.py-feedstock.mark ) && true) || ( (echo "boolean.py-feedstock" >>failed.22 ) && (echo "boolean.py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boolean.py-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f botocore-feedstock.mark ]]; then
    if [[ -d botocore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./botocore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>botocore-feedstock.mark ) && true) || ( (echo "botocore-feedstock" >>failed.22 ) && (echo "botocore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "botocore-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f brotli-feedstock.mark ]]; then
    if [[ -d brotli-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./brotli-feedstock >d 2>&1 && rm -f d && ( echo "done" >>brotli-feedstock.mark ) && true) || ( (echo "brotli-feedstock" >>failed.22 ) && (echo "brotli-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "brotli-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f chardet-feedstock.mark ]]; then
    if [[ -d chardet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./chardet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>chardet-feedstock.mark ) && true) || ( (echo "chardet-feedstock" >>failed.22 ) && (echo "chardet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "chardet-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f clyent-feedstock.mark ]]; then
    if [[ -d clyent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clyent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clyent-feedstock.mark ) && true) || ( (echo "clyent-feedstock" >>failed.22 ) && (echo "clyent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clyent-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f conda-feedstock.mark ]]; then
    if [[ -d conda-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-feedstock.mark ) && true) || ( (echo "conda-feedstock" >>failed.22 ) && (echo "conda-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f cytoolz-feedstock.mark ]]; then
    if [[ -d cytoolz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cytoolz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cytoolz-feedstock.mark ) && true) || ( (echo "cytoolz-feedstock" >>failed.22 ) && (echo "cytoolz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cytoolz-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f distributed-feedstock.mark ]]; then
    if [[ -d distributed-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distributed-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distributed-feedstock.mark ) && true) || ( (echo "distributed-feedstock" >>failed.22 ) && (echo "distributed-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distributed-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f dnspython-feedstock.mark ]]; then
    if [[ -d dnspython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dnspython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dnspython-feedstock.mark ) && true) || ( (echo "dnspython-feedstock" >>failed.22 ) && (echo "dnspython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dnspython-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f findpython-feedstock.mark ]]; then
    if [[ -d findpython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./findpython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>findpython-feedstock.mark ) && true) || ( (echo "findpython-feedstock" >>failed.22 ) && (echo "findpython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "findpython-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f flake8-feedstock.mark ]]; then
    if [[ -d flake8-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flake8-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flake8-feedstock.mark ) && true) || ( (echo "flake8-feedstock" >>failed.22 ) && (echo "flake8-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flake8-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f flask-feedstock.mark ]]; then
    if [[ -d flask-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-feedstock.mark ) && true) || ( (echo "flask-feedstock" >>failed.22 ) && (echo "flask-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f flit-scm-feedstock.mark ]]; then
    if [[ -d flit-scm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flit-scm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flit-scm-feedstock.mark ) && true) || ( (echo "flit-scm-feedstock" >>failed.22 ) && (echo "flit-scm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flit-scm-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f google-api-core-feedstock.mark ]]; then
    if [[ -d google-api-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-api-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-api-core-feedstock.mark ) && true) || ( (echo "google-api-core-feedstock" >>failed.22 ) && (echo "google-api-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-api-core-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f google-crc32c-feedstock.mark ]]; then
    if [[ -d google-crc32c-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-crc32c-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-crc32c-feedstock.mark ) && true) || ( (echo "google-crc32c-feedstock" >>failed.22 ) && (echo "google-crc32c-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-crc32c-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f greenlet-feedstock.mark ]]; then
    if [[ -d greenlet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./greenlet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>greenlet-feedstock.mark ) && true) || ( (echo "greenlet-feedstock" >>failed.22 ) && (echo "greenlet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "greenlet-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f grpcio-gcp-feedstock.mark ]]; then
    if [[ -d grpcio-gcp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./grpcio-gcp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>grpcio-gcp-feedstock.mark ) && true) || ( (echo "grpcio-gcp-feedstock" >>failed.22 ) && (echo "grpcio-gcp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "grpcio-gcp-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f hdijupyterutils-feedstock.mark ]]; then
    if [[ -d hdijupyterutils-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hdijupyterutils-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hdijupyterutils-feedstock.mark ) && true) || ( (echo "hdijupyterutils-feedstock" >>failed.22 ) && (echo "hdijupyterutils-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hdijupyterutils-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f imagecodecs-feedstock.mark ]]; then
    if [[ -d imagecodecs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imagecodecs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imagecodecs-feedstock.mark ) && true) || ( (echo "imagecodecs-feedstock" >>failed.22 ) && (echo "imagecodecs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imagecodecs-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f imagesize-feedstock.mark ]]; then
    if [[ -d imagesize-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imagesize-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imagesize-feedstock.mark ) && true) || ( (echo "imagesize-feedstock" >>failed.22 ) && (echo "imagesize-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imagesize-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f lief-feedstock.mark ]]; then
    if [[ -d lief-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lief-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lief-feedstock.mark ) && true) || ( (echo "lief-feedstock" >>failed.22 ) && (echo "lief-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lief-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f lz4-feedstock.mark ]]; then
    if [[ -d lz4-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lz4-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lz4-feedstock.mark ) && true) || ( (echo "lz4-feedstock" >>failed.22 ) && (echo "lz4-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lz4-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f matplotlib-feedstock.mark ]]; then
    if [[ -d matplotlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./matplotlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>matplotlib-feedstock.mark ) && true) || ( (echo "matplotlib-feedstock" >>failed.22 ) && (echo "matplotlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "matplotlib-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f mdurl-feedstock.mark ]]; then
    if [[ -d mdurl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mdurl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mdurl-feedstock.mark ) && true) || ( (echo "mdurl-feedstock" >>failed.22 ) && (echo "mdurl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mdurl-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f networkx-feedstock.mark ]]; then
    if [[ -d networkx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./networkx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>networkx-feedstock.mark ) && true) || ( (echo "networkx-feedstock" >>failed.22 ) && (echo "networkx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "networkx-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f oauthlib-feedstock.mark ]]; then
    if [[ -d oauthlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./oauthlib-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>oauthlib-feedstock.mark ) && true) || ( (echo "oauthlib-feedstock" >>failed.22 ) && (echo "oauthlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "oauthlib-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f param-feedstock.mark ]]; then
    if [[ -d param-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./param-feedstock >d 2>&1 && rm -f d && ( echo "done" >>param-feedstock.mark ) && true) || ( (echo "param-feedstock" >>failed.22 ) && (echo "param-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "param-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f patsy-feedstock.mark ]]; then
    if [[ -d patsy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./patsy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>patsy-feedstock.mark ) && true) || ( (echo "patsy-feedstock" >>failed.22 ) && (echo "patsy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "patsy-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f plotly-feedstock.mark ]]; then
    if [[ -d plotly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./plotly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>plotly-feedstock.mark ) && true) || ( (echo "plotly-feedstock" >>failed.22 ) && (echo "plotly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "plotly-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pydocstyle-feedstock.mark ]]; then
    if [[ -d pydocstyle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydocstyle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydocstyle-feedstock.mark ) && true) || ( (echo "pydocstyle-feedstock" >>failed.22 ) && (echo "pydocstyle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydocstyle-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyjsparser-feedstock.mark ]]; then
    if [[ -d pyjsparser-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyjsparser-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyjsparser-feedstock.mark ) && true) || ( (echo "pyjsparser-feedstock" >>failed.22 ) && (echo "pyjsparser-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyjsparser-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pykerberos-feedstock.mark ]]; then
    if [[ -d pykerberos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pykerberos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pykerberos-feedstock.mark ) && true) || ( (echo "pykerberos-feedstock" >>failed.22 ) && (echo "pykerberos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pykerberos-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pylint-feedstock.mark ]]; then
    if [[ -d pylint-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pylint-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pylint-feedstock.mark ) && true) || ( (echo "pylint-feedstock" >>failed.22 ) && (echo "pylint-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pylint-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f python-dotenv-feedstock.mark ]]; then
    if [[ -d python-dotenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-dotenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-dotenv-feedstock.mark ) && true) || ( (echo "python-dotenv-feedstock" >>failed.22 ) && (echo "python-dotenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-dotenv-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f python-installer-feedstock.mark ]]; then
    if [[ -d python-installer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-installer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-installer-feedstock.mark ) && true) || ( (echo "python-installer-feedstock" >>failed.22 ) && (echo "python-installer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-installer-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pywavelets-feedstock.mark ]]; then
    if [[ -d pywavelets-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pywavelets-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pywavelets-feedstock.mark ) && true) || ( (echo "pywavelets-feedstock" >>failed.22 ) && (echo "pywavelets-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pywavelets-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f resolvelib-feedstock.mark ]]; then
    if [[ -d resolvelib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./resolvelib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>resolvelib-feedstock.mark ) && true) || ( (echo "resolvelib-feedstock" >>failed.22 ) && (echo "resolvelib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "resolvelib-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f rich-feedstock.mark ]]; then
    if [[ -d rich-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./rich-feedstock >d 2>&1 && rm -f d && ( echo "done" >>rich-feedstock.mark ) && true) || ( (echo "rich-feedstock" >>failed.22 ) && (echo "rich-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "rich-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f rope-feedstock.mark ]]; then
    if [[ -d rope-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./rope-feedstock >d 2>&1 && rm -f d && ( echo "done" >>rope-feedstock.mark ) && true) || ( (echo "rope-feedstock" >>failed.22 ) && (echo "rope-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "rope-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f scikit-build-feedstock.mark ]]; then
    if [[ -d scikit-build-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-build-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-build-feedstock.mark ) && true) || ( (echo "scikit-build-feedstock" >>failed.22 ) && (echo "scikit-build-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-build-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f scikit-learn-feedstock.mark ]]; then
    if [[ -d scikit-learn-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-learn-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-learn-feedstock.mark ) && true) || ( (echo "scikit-learn-feedstock" >>failed.22 ) && (echo "scikit-learn-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-learn-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f tangled-up-in-unicode-feedstock.mark ]]; then
    if [[ -d tangled-up-in-unicode-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tangled-up-in-unicode-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tangled-up-in-unicode-feedstock.mark ) && true) || ( (echo "tangled-up-in-unicode-feedstock" >>failed.22 ) && (echo "tangled-up-in-unicode-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tangled-up-in-unicode-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f tzlocal-feedstock.mark ]]; then
    if [[ -d tzlocal-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tzlocal-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tzlocal-feedstock.mark ) && true) || ( (echo "tzlocal-feedstock" >>failed.22 ) && (echo "tzlocal-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tzlocal-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f ukkonen-feedstock.mark ]]; then
    if [[ -d ukkonen-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ukkonen-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ukkonen-feedstock.mark ) && true) || ( (echo "ukkonen-feedstock" >>failed.22 ) && (echo "ukkonen-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ukkonen-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f unearth-feedstock.mark ]]; then
    if [[ -d unearth-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./unearth-feedstock >d 2>&1 && rm -f d && ( echo "done" >>unearth-feedstock.mark ) && true) || ( (echo "unearth-feedstock" >>failed.22 ) && (echo "unearth-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "unearth-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f whatthepatch-feedstock.mark ]]; then
    if [[ -d whatthepatch-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./whatthepatch-feedstock >d 2>&1 && rm -f d && ( echo "done" >>whatthepatch-feedstock.mark ) && true) || ( (echo "whatthepatch-feedstock" >>failed.22 ) && (echo "whatthepatch-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "whatthepatch-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f xarray-feedstock.mark ]]; then
    if [[ -d xarray-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xarray-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xarray-feedstock.mark ) && true) || ( (echo "xarray-feedstock" >>failed.22 ) && (echo "xarray-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xarray-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f zstandard-feedstock.mark ]]; then
    if [[ -d zstandard-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zstandard-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zstandard-feedstock.mark ) && true) || ( (echo "zstandard-feedstock" >>failed.22 ) && (echo "zstandard-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zstandard-feedstock not present" >>failed.22
    fi
fi

