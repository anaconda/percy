#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f agate-feedstock.mark ]]; then
    if [[ -d agate-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./agate-feedstock >d 2>&1 && rm -f d && ( echo "done" >>agate-feedstock.mark ) && true) || ( (echo "agate-feedstock" >>failed.22 ) && (echo "agate-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "agate-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f asn1crypto-feedstock.mark ]]; then
    if [[ -d asn1crypto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asn1crypto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asn1crypto-feedstock.mark ) && true) || ( (echo "asn1crypto-feedstock" >>failed.22 ) && (echo "asn1crypto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asn1crypto-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f bitarray-feedstock.mark ]]; then
    if [[ -d bitarray-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bitarray-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bitarray-feedstock.mark ) && true) || ( (echo "bitarray-feedstock" >>failed.22 ) && (echo "bitarray-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bitarray-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f black-feedstock.mark ]]; then
    if [[ -d black-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./black-feedstock >d 2>&1 && rm -f d && ( echo "done" >>black-feedstock.mark ) && true) || ( (echo "black-feedstock" >>failed.22 ) && (echo "black-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "black-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f blessings-feedstock.mark ]]; then
    if [[ -d blessings-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./blessings-feedstock >d 2>&1 && rm -f d && ( echo "done" >>blessings-feedstock.mark ) && true) || ( (echo "blessings-feedstock" >>failed.22 ) && (echo "blessings-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "blessings-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f boolean.py-feedstock.mark ]]; then
    if [[ -d boolean.py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boolean.py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boolean.py-feedstock.mark ) && true) || ( (echo "boolean.py-feedstock" >>failed.22 ) && (echo "boolean.py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boolean.py-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f brotli-feedstock.mark ]]; then
    if [[ -d brotli-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./brotli-feedstock >d 2>&1 && rm -f d && ( echo "done" >>brotli-feedstock.mark ) && true) || ( (echo "brotli-feedstock" >>failed.22 ) && (echo "brotli-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "brotli-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f clyent-feedstock.mark ]]; then
    if [[ -d clyent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clyent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clyent-feedstock.mark ) && true) || ( (echo "clyent-feedstock" >>failed.22 ) && (echo "clyent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clyent-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f colorcet-feedstock.mark ]]; then
    if [[ -d colorcet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colorcet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colorcet-feedstock.mark ) && true) || ( (echo "colorcet-feedstock" >>failed.22 ) && (echo "colorcet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colorcet-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f conda-feedstock.mark ]]; then
    if [[ -d conda-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-feedstock.mark ) && true) || ( (echo "conda-feedstock" >>failed.22 ) && (echo "conda-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f constantly-feedstock.mark ]]; then
    if [[ -d constantly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./constantly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>constantly-feedstock.mark ) && true) || ( (echo "constantly-feedstock" >>failed.22 ) && (echo "constantly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "constantly-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f cython-blis-feedstock.mark ]]; then
    if [[ -d cython-blis-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cython-blis-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cython-blis-feedstock.mark ) && true) || ( (echo "cython-blis-feedstock" >>failed.22 ) && (echo "cython-blis-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cython-blis-feedstock not present" >>failed.22
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


if [[ ! -f docopt-feedstock.mark ]]; then
    if [[ -d docopt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docopt-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>docopt-feedstock.mark ) && true) || ( (echo "docopt-feedstock" >>failed.22 ) && (echo "docopt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docopt-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f fastavro-feedstock.mark ]]; then
    if [[ -d fastavro-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastavro-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastavro-feedstock.mark ) && true) || ( (echo "fastavro-feedstock" >>failed.22 ) && (echo "fastavro-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastavro-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f findpython-feedstock.mark ]]; then
    if [[ -d findpython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./findpython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>findpython-feedstock.mark ) && true) || ( (echo "findpython-feedstock" >>failed.22 ) && (echo "findpython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "findpython-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f gmpy2-feedstock.mark ]]; then
    if [[ -d gmpy2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gmpy2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gmpy2-feedstock.mark ) && true) || ( (echo "gmpy2-feedstock" >>failed.22 ) && (echo "gmpy2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gmpy2-feedstock not present" >>failed.22
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


if [[ ! -f grpcio-gcp-feedstock.mark ]]; then
    if [[ -d grpcio-gcp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./grpcio-gcp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>grpcio-gcp-feedstock.mark ) && true) || ( (echo "grpcio-gcp-feedstock" >>failed.22 ) && (echo "grpcio-gcp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "grpcio-gcp-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f huggingface_hub-feedstock.mark ]]; then
    if [[ -d huggingface_hub-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./huggingface_hub-feedstock >d 2>&1 && rm -f d && ( echo "done" >>huggingface_hub-feedstock.mark ) && true) || ( (echo "huggingface_hub-feedstock" >>failed.22 ) && (echo "huggingface_hub-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "huggingface_hub-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f imagesize-feedstock.mark ]]; then
    if [[ -d imagesize-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imagesize-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imagesize-feedstock.mark ) && true) || ( (echo "imagesize-feedstock" >>failed.22 ) && (echo "imagesize-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imagesize-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f ipyparallel-feedstock.mark ]]; then
    if [[ -d ipyparallel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipyparallel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipyparallel-feedstock.mark ) && true) || ( (echo "ipyparallel-feedstock" >>failed.22 ) && (echo "ipyparallel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipyparallel-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f jaraco.text-feedstock.mark ]]; then
    if [[ -d jaraco.text-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jaraco.text-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jaraco.text-feedstock.mark ) && true) || ( (echo "jaraco.text-feedstock" >>failed.22 ) && (echo "jaraco.text-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jaraco.text-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f jupyter-feedstock.mark ]]; then
    if [[ -d jupyter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter-feedstock.mark ) && true) || ( (echo "jupyter-feedstock" >>failed.22 ) && (echo "jupyter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f lief-feedstock.mark ]]; then
    if [[ -d lief-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lief-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lief-feedstock.mark ) && true) || ( (echo "lief-feedstock" >>failed.22 ) && (echo "lief-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lief-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f matplotlib-feedstock.mark ]]; then
    if [[ -d matplotlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./matplotlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>matplotlib-feedstock.mark ) && true) || ( (echo "matplotlib-feedstock" >>failed.22 ) && (echo "matplotlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "matplotlib-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f mpmath-feedstock.mark ]]; then
    if [[ -d mpmath-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mpmath-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mpmath-feedstock.mark ) && true) || ( (echo "mpmath-feedstock" >>failed.22 ) && (echo "mpmath-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mpmath-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f multiprocess-feedstock.mark ]]; then
    if [[ -d multiprocess-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multiprocess-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multiprocess-feedstock.mark ) && true) || ( (echo "multiprocess-feedstock" >>failed.22 ) && (echo "multiprocess-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multiprocess-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f netcdf4-feedstock.mark ]]; then
    if [[ -d netcdf4-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./netcdf4-feedstock >d 2>&1 && rm -f d && ( echo "done" >>netcdf4-feedstock.mark ) && true) || ( (echo "netcdf4-feedstock" >>failed.22 ) && (echo "netcdf4-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "netcdf4-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f networkx-feedstock.mark ]]; then
    if [[ -d networkx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./networkx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>networkx-feedstock.mark ) && true) || ( (echo "networkx-feedstock" >>failed.22 ) && (echo "networkx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "networkx-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f numcodecs-feedstock.mark ]]; then
    if [[ -d numcodecs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numcodecs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numcodecs-feedstock.mark ) && true) || ( (echo "numcodecs-feedstock" >>failed.22 ) && (echo "numcodecs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numcodecs-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f oauthlib-feedstock.mark ]]; then
    if [[ -d oauthlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./oauthlib-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>oauthlib-feedstock.mark ) && true) || ( (echo "oauthlib-feedstock" >>failed.22 ) && (echo "oauthlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "oauthlib-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f onnxconverter-common-feedstock.mark ]]; then
    if [[ -d onnxconverter-common-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./onnxconverter-common-feedstock >d 2>&1 && rm -f d && ( echo "done" >>onnxconverter-common-feedstock.mark ) && true) || ( (echo "onnxconverter-common-feedstock" >>failed.22 ) && (echo "onnxconverter-common-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "onnxconverter-common-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f openpyxl-feedstock.mark ]]; then
    if [[ -d openpyxl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./openpyxl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>openpyxl-feedstock.mark ) && true) || ( (echo "openpyxl-feedstock" >>failed.22 ) && (echo "openpyxl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "openpyxl-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f panel-feedstock.mark ]]; then
    if [[ -d panel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./panel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>panel-feedstock.mark ) && true) || ( (echo "panel-feedstock" >>failed.22 ) && (echo "panel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "panel-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pathlib2-feedstock.mark ]]; then
    if [[ -d pathlib2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pathlib2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pathlib2-feedstock.mark ) && true) || ( (echo "pathlib2-feedstock" >>failed.22 ) && (echo "pathlib2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pathlib2-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f patsy-feedstock.mark ]]; then
    if [[ -d patsy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./patsy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>patsy-feedstock.mark ) && true) || ( (echo "patsy-feedstock" >>failed.22 ) && (echo "patsy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "patsy-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pkgconfig-feedstock.mark ]]; then
    if [[ -d pkgconfig-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pkgconfig-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pkgconfig-feedstock.mark ) && true) || ( (echo "pkgconfig-feedstock" >>failed.22 ) && (echo "pkgconfig-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pkgconfig-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f portalocker-feedstock.mark ]]; then
    if [[ -d portalocker-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./portalocker-feedstock >d 2>&1 && rm -f d && ( echo "done" >>portalocker-feedstock.mark ) && true) || ( (echo "portalocker-feedstock" >>failed.22 ) && (echo "portalocker-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "portalocker-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f preshed-feedstock.mark ]]; then
    if [[ -d preshed-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./preshed-feedstock >d 2>&1 && rm -f d && ( echo "done" >>preshed-feedstock.mark ) && true) || ( (echo "preshed-feedstock" >>failed.22 ) && (echo "preshed-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "preshed-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyarrow-feedstock.mark ]]; then
    if [[ -d pyarrow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyarrow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyarrow-feedstock.mark ) && true) || ( (echo "pyarrow-feedstock" >>failed.22 ) && (echo "pyarrow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyarrow-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pycares-feedstock.mark ]]; then
    if [[ -d pycares-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycares-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycares-feedstock.mark ) && true) || ( (echo "pycares-feedstock" >>failed.22 ) && (echo "pycares-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycares-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pycryptodome-feedstock.mark ]]; then
    if [[ -d pycryptodome-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycryptodome-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycryptodome-feedstock.mark ) && true) || ( (echo "pycryptodome-feedstock" >>failed.22 ) && (echo "pycryptodome-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycryptodome-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pycurl-feedstock.mark ]]; then
    if [[ -d pycurl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycurl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycurl-feedstock.mark ) && true) || ( (echo "pycurl-feedstock" >>failed.22 ) && (echo "pycurl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycurl-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pydantic-feedstock.mark ]]; then
    if [[ -d pydantic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydantic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydantic-feedstock.mark ) && true) || ( (echo "pydantic-feedstock" >>failed.22 ) && (echo "pydantic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydantic-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pydocstyle-feedstock.mark ]]; then
    if [[ -d pydocstyle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydocstyle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydocstyle-feedstock.mark ) && true) || ( (echo "pydocstyle-feedstock" >>failed.22 ) && (echo "pydocstyle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydocstyle-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyinstaller-feedstock.mark ]]; then
    if [[ -d pyinstaller-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyinstaller-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyinstaller-feedstock.mark ) && true) || ( (echo "pyinstaller-feedstock" >>failed.22 ) && (echo "pyinstaller-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyinstaller-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyjsparser-feedstock.mark ]]; then
    if [[ -d pyjsparser-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyjsparser-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyjsparser-feedstock.mark ) && true) || ( (echo "pyjsparser-feedstock" >>failed.22 ) && (echo "pyjsparser-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyjsparser-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pylint-feedstock.mark ]]; then
    if [[ -d pylint-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pylint-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pylint-feedstock.mark ) && true) || ( (echo "pylint-feedstock" >>failed.22 ) && (echo "pylint-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pylint-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pynacl-feedstock.mark ]]; then
    if [[ -d pynacl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pynacl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pynacl-feedstock.mark ) && true) || ( (echo "pynacl-feedstock" >>failed.22 ) && (echo "pynacl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pynacl-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pyproj-feedstock.mark ]]; then
    if [[ -d pyproj-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyproj-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyproj-feedstock.mark ) && true) || ( (echo "pyproj-feedstock" >>failed.22 ) && (echo "pyproj-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyproj-feedstock not present" >>failed.22
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


if [[ ! -f python-snappy-feedstock.mark ]]; then
    if [[ -d python-snappy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-snappy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-snappy-feedstock.mark ) && true) || ( (echo "python-snappy-feedstock" >>failed.22 ) && (echo "python-snappy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-snappy-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f python-xxhash-feedstock.mark ]]; then
    if [[ -d python-xxhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-xxhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-xxhash-feedstock.mark ) && true) || ( (echo "python-xxhash-feedstock" >>failed.22 ) && (echo "python-xxhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-xxhash-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f pywavelets-feedstock.mark ]]; then
    if [[ -d pywavelets-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pywavelets-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pywavelets-feedstock.mark ) && true) || ( (echo "pywavelets-feedstock" >>failed.22 ) && (echo "pywavelets-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pywavelets-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f requests-kerberos-feedstock.mark ]]; then
    if [[ -d requests-kerberos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-kerberos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-kerberos-feedstock.mark ) && true) || ( (echo "requests-kerberos-feedstock" >>failed.22 ) && (echo "requests-kerberos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-kerberos-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f resolvelib-feedstock.mark ]]; then
    if [[ -d resolvelib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./resolvelib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>resolvelib-feedstock.mark ) && true) || ( (echo "resolvelib-feedstock" >>failed.22 ) && (echo "resolvelib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "resolvelib-feedstock not present" >>failed.22
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


if [[ ! -f shapely-feedstock.mark ]]; then
    if [[ -d shapely-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./shapely-feedstock >d 2>&1 && rm -f d && ( echo "done" >>shapely-feedstock.mark ) && true) || ( (echo "shapely-feedstock" >>failed.22 ) && (echo "shapely-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "shapely-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f smart_open-feedstock.mark ]]; then
    if [[ -d smart_open-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./smart_open-feedstock >d 2>&1 && rm -f d && ( echo "done" >>smart_open-feedstock.mark ) && true) || ( (echo "smart_open-feedstock" >>failed.22 ) && (echo "smart_open-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "smart_open-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f srsly-feedstock.mark ]]; then
    if [[ -d srsly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./srsly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>srsly-feedstock.mark ) && true) || ( (echo "srsly-feedstock" >>failed.22 ) && (echo "srsly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "srsly-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f tangled-up-in-unicode-feedstock.mark ]]; then
    if [[ -d tangled-up-in-unicode-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tangled-up-in-unicode-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tangled-up-in-unicode-feedstock.mark ) && true) || ( (echo "tangled-up-in-unicode-feedstock" >>failed.22 ) && (echo "tangled-up-in-unicode-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tangled-up-in-unicode-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f typer-feedstock.mark ]]; then
    if [[ -d typer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typer-feedstock.mark ) && true) || ( (echo "typer-feedstock" >>failed.22 ) && (echo "typer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typer-feedstock not present" >>failed.22
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


if [[ ! -f virtualenv-clone-feedstock.mark ]]; then
    if [[ -d virtualenv-clone-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./virtualenv-clone-feedstock >d 2>&1 && rm -f d && ( echo "done" >>virtualenv-clone-feedstock.mark ) && true) || ( (echo "virtualenv-clone-feedstock" >>failed.22 ) && (echo "virtualenv-clone-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "virtualenv-clone-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f wasabi-feedstock.mark ]]; then
    if [[ -d wasabi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wasabi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wasabi-feedstock.mark ) && true) || ( (echo "wasabi-feedstock" >>failed.22 ) && (echo "wasabi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wasabi-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f xarray-feedstock.mark ]]; then
    if [[ -d xarray-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xarray-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xarray-feedstock.mark ) && true) || ( (echo "xarray-feedstock" >>failed.22 ) && (echo "xarray-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xarray-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f zope.interface-feedstock.mark ]]; then
    if [[ -d zope.interface-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zope.interface-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zope.interface-feedstock.mark ) && true) || ( (echo "zope.interface-feedstock" >>failed.22 ) && (echo "zope.interface-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zope.interface-feedstock not present" >>failed.22
    fi
fi


if [[ ! -f zstandard-feedstock.mark ]]; then
    if [[ -d zstandard-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zstandard-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zstandard-feedstock.mark ) && true) || ( (echo "zstandard-feedstock" >>failed.22 ) && (echo "zstandard-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zstandard-feedstock not present" >>failed.22
    fi
fi

