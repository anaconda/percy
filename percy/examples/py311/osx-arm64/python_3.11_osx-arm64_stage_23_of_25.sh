#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f absl-py-feedstock.mark ]]; then
    if [[ -d absl-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./absl-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>absl-py-feedstock.mark ) && true) || ( (echo "absl-py-feedstock" >>failed.23 ) && (echo "absl-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "absl-py-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f agate-feedstock.mark ]]; then
    if [[ -d agate-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./agate-feedstock >d 2>&1 && rm -f d && ( echo "done" >>agate-feedstock.mark ) && true) || ( (echo "agate-feedstock" >>failed.23 ) && (echo "agate-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "agate-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f alembic-feedstock.mark ]]; then
    if [[ -d alembic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./alembic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>alembic-feedstock.mark ) && true) || ( (echo "alembic-feedstock" >>failed.23 ) && (echo "alembic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "alembic-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f altgraph-feedstock.mark ]]; then
    if [[ -d altgraph-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./altgraph-feedstock >d 2>&1 && rm -f d && ( echo "done" >>altgraph-feedstock.mark ) && true) || ( (echo "altgraph-feedstock" >>failed.23 ) && (echo "altgraph-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "altgraph-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f anyjson-feedstock.mark ]]; then
    if [[ -d anyjson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anyjson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anyjson-feedstock.mark ) && true) || ( (echo "anyjson-feedstock" >>failed.23 ) && (echo "anyjson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anyjson-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f anyqt-feedstock.mark ]]; then
    if [[ -d anyqt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anyqt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anyqt-feedstock.mark ) && true) || ( (echo "anyqt-feedstock" >>failed.23 ) && (echo "anyqt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anyqt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f asn1crypto-feedstock.mark ]]; then
    if [[ -d asn1crypto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asn1crypto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asn1crypto-feedstock.mark ) && true) || ( (echo "asn1crypto-feedstock" >>failed.23 ) && (echo "asn1crypto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asn1crypto-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f astropy-feedstock.mark ]]; then
    if [[ -d astropy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./astropy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>astropy-feedstock.mark ) && true) || ( (echo "astropy-feedstock" >>failed.23 ) && (echo "astropy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "astropy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f black-feedstock.mark ]]; then
    if [[ -d black-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./black-feedstock >d 2>&1 && rm -f d && ( echo "done" >>black-feedstock.mark ) && true) || ( (echo "black-feedstock" >>failed.23 ) && (echo "black-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "black-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f blessings-feedstock.mark ]]; then
    if [[ -d blessings-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./blessings-feedstock >d 2>&1 && rm -f d && ( echo "done" >>blessings-feedstock.mark ) && true) || ( (echo "blessings-feedstock" >>failed.23 ) && (echo "blessings-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "blessings-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f boolean.py-feedstock.mark ]]; then
    if [[ -d boolean.py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boolean.py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boolean.py-feedstock.mark ) && true) || ( (echo "boolean.py-feedstock" >>failed.23 ) && (echo "boolean.py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boolean.py-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f brotli-feedstock.mark ]]; then
    if [[ -d brotli-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./brotli-feedstock >d 2>&1 && rm -f d && ( echo "done" >>brotli-feedstock.mark ) && true) || ( (echo "brotli-feedstock" >>failed.23 ) && (echo "brotli-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "brotli-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f cftime-feedstock.mark ]]; then
    if [[ -d cftime-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cftime-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cftime-feedstock.mark ) && true) || ( (echo "cftime-feedstock" >>failed.23 ) && (echo "cftime-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cftime-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f clyent-feedstock.mark ]]; then
    if [[ -d clyent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clyent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clyent-feedstock.mark ) && true) || ( (echo "clyent-feedstock" >>failed.23 ) && (echo "clyent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clyent-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f colorcet-feedstock.mark ]]; then
    if [[ -d colorcet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colorcet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colorcet-feedstock.mark ) && true) || ( (echo "colorcet-feedstock" >>failed.23 ) && (echo "colorcet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colorcet-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f colour-feedstock.mark ]]; then
    if [[ -d colour-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colour-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colour-feedstock.mark ) && true) || ( (echo "colour-feedstock" >>failed.23 ) && (echo "colour-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colour-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f conda-feedstock.mark ]]; then
    if [[ -d conda-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-feedstock.mark ) && true) || ( (echo "conda-feedstock" >>failed.23 ) && (echo "conda-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f constantly-feedstock.mark ]]; then
    if [[ -d constantly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./constantly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>constantly-feedstock.mark ) && true) || ( (echo "constantly-feedstock" >>failed.23 ) && (echo "constantly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "constantly-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f cython-blis-feedstock.mark ]]; then
    if [[ -d cython-blis-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cython-blis-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cython-blis-feedstock.mark ) && true) || ( (echo "cython-blis-feedstock" >>failed.23 ) && (echo "cython-blis-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cython-blis-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f distributed-feedstock.mark ]]; then
    if [[ -d distributed-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distributed-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distributed-feedstock.mark ) && true) || ( (echo "distributed-feedstock" >>failed.23 ) && (echo "distributed-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distributed-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f dm-tree-feedstock.mark ]]; then
    if [[ -d dm-tree-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dm-tree-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dm-tree-feedstock.mark ) && true) || ( (echo "dm-tree-feedstock" >>failed.23 ) && (echo "dm-tree-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dm-tree-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f ecdsa-feedstock.mark ]]; then
    if [[ -d ecdsa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ecdsa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ecdsa-feedstock.mark ) && true) || ( (echo "ecdsa-feedstock" >>failed.23 ) && (echo "ecdsa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ecdsa-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f email-validator-feedstock.mark ]]; then
    if [[ -d email-validator-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./email-validator-feedstock >d 2>&1 && rm -f d && ( echo "done" >>email-validator-feedstock.mark ) && true) || ( (echo "email-validator-feedstock" >>failed.23 ) && (echo "email-validator-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "email-validator-feedstock not present" >>failed.23
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


if [[ ! -f gmpy2-feedstock.mark ]]; then
    if [[ -d gmpy2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gmpy2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gmpy2-feedstock.mark ) && true) || ( (echo "gmpy2-feedstock" >>failed.23 ) && (echo "gmpy2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gmpy2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f google-api-core-feedstock.mark ]]; then
    if [[ -d google-api-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-api-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-api-core-feedstock.mark ) && true) || ( (echo "google-api-core-feedstock" >>failed.23 ) && (echo "google-api-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-api-core-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f google-crc32c-feedstock.mark ]]; then
    if [[ -d google-crc32c-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-crc32c-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-crc32c-feedstock.mark ) && true) || ( (echo "google-crc32c-feedstock" >>failed.23 ) && (echo "google-crc32c-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-crc32c-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f grpcio-gcp-feedstock.mark ]]; then
    if [[ -d grpcio-gcp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./grpcio-gcp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>grpcio-gcp-feedstock.mark ) && true) || ( (echo "grpcio-gcp-feedstock" >>failed.23 ) && (echo "grpcio-gcp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "grpcio-gcp-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f h2-feedstock.mark ]]; then
    if [[ -d h2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./h2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>h2-feedstock.mark ) && true) || ( (echo "h2-feedstock" >>failed.23 ) && (echo "h2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "h2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f h5py-feedstock.mark ]]; then
    if [[ -d h5py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./h5py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>h5py-feedstock.mark ) && true) || ( (echo "h5py-feedstock" >>failed.23 ) && (echo "h5py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "h5py-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f hdijupyterutils-feedstock.mark ]]; then
    if [[ -d hdijupyterutils-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hdijupyterutils-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hdijupyterutils-feedstock.mark ) && true) || ( (echo "hdijupyterutils-feedstock" >>failed.23 ) && (echo "hdijupyterutils-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hdijupyterutils-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f hsluv-feedstock.mark ]]; then
    if [[ -d hsluv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hsluv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hsluv-feedstock.mark ) && true) || ( (echo "hsluv-feedstock" >>failed.23 ) && (echo "hsluv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hsluv-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f huggingface_hub-feedstock.mark ]]; then
    if [[ -d huggingface_hub-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./huggingface_hub-feedstock >d 2>&1 && rm -f d && ( echo "done" >>huggingface_hub-feedstock.mark ) && true) || ( (echo "huggingface_hub-feedstock" >>failed.23 ) && (echo "huggingface_hub-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "huggingface_hub-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f inflection-feedstock.mark ]]; then
    if [[ -d inflection-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./inflection-feedstock >d 2>&1 && rm -f d && ( echo "done" >>inflection-feedstock.mark ) && true) || ( (echo "inflection-feedstock" >>failed.23 ) && (echo "inflection-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "inflection-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f intervals-feedstock.mark ]]; then
    if [[ -d intervals-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./intervals-feedstock >d 2>&1 && rm -f d && ( echo "done" >>intervals-feedstock.mark ) && true) || ( (echo "intervals-feedstock" >>failed.23 ) && (echo "intervals-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "intervals-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f jaraco.text-feedstock.mark ]]; then
    if [[ -d jaraco.text-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jaraco.text-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jaraco.text-feedstock.mark ) && true) || ( (echo "jaraco.text-feedstock" >>failed.23 ) && (echo "jaraco.text-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jaraco.text-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f jax-feedstock.mark ]]; then
    if [[ -d jax-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jax-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jax-feedstock.mark ) && true) || ( (echo "jax-feedstock" >>failed.23 ) && (echo "jax-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jax-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f lief-feedstock.mark ]]; then
    if [[ -d lief-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lief-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lief-feedstock.mark ) && true) || ( (echo "lief-feedstock" >>failed.23 ) && (echo "lief-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lief-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f lz4-feedstock.mark ]]; then
    if [[ -d lz4-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lz4-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lz4-feedstock.mark ) && true) || ( (echo "lz4-feedstock" >>failed.23 ) && (echo "lz4-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lz4-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mdurl-feedstock.mark ]]; then
    if [[ -d mdurl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mdurl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mdurl-feedstock.mark ) && true) || ( (echo "mdurl-feedstock" >>failed.23 ) && (echo "mdurl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mdurl-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mpmath-feedstock.mark ]]; then
    if [[ -d mpmath-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mpmath-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mpmath-feedstock.mark ) && true) || ( (echo "mpmath-feedstock" >>failed.23 ) && (echo "mpmath-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mpmath-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f multiprocess-feedstock.mark ]]; then
    if [[ -d multiprocess-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multiprocess-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multiprocess-feedstock.mark ) && true) || ( (echo "multiprocess-feedstock" >>failed.23 ) && (echo "multiprocess-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multiprocess-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f numcodecs-feedstock.mark ]]; then
    if [[ -d numcodecs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numcodecs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numcodecs-feedstock.mark ) && true) || ( (echo "numcodecs-feedstock" >>failed.23 ) && (echo "numcodecs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numcodecs-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f openpyxl-feedstock.mark ]]; then
    if [[ -d openpyxl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./openpyxl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>openpyxl-feedstock.mark ) && true) || ( (echo "openpyxl-feedstock" >>failed.23 ) && (echo "openpyxl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "openpyxl-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f panel-feedstock.mark ]]; then
    if [[ -d panel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./panel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>panel-feedstock.mark ) && true) || ( (echo "panel-feedstock" >>failed.23 ) && (echo "panel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "panel-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f parsel-feedstock.mark ]]; then
    if [[ -d parsel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./parsel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>parsel-feedstock.mark ) && true) || ( (echo "parsel-feedstock" >>failed.23 ) && (echo "parsel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "parsel-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pathlib2-feedstock.mark ]]; then
    if [[ -d pathlib2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pathlib2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pathlib2-feedstock.mark ) && true) || ( (echo "pathlib2-feedstock" >>failed.23 ) && (echo "pathlib2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pathlib2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f patsy-feedstock.mark ]]; then
    if [[ -d patsy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./patsy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>patsy-feedstock.mark ) && true) || ( (echo "patsy-feedstock" >>failed.23 ) && (echo "patsy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "patsy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f plotly-feedstock.mark ]]; then
    if [[ -d plotly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./plotly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>plotly-feedstock.mark ) && true) || ( (echo "plotly-feedstock" >>failed.23 ) && (echo "plotly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "plotly-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f preshed-feedstock.mark ]]; then
    if [[ -d preshed-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./preshed-feedstock >d 2>&1 && rm -f d && ( echo "done" >>preshed-feedstock.mark ) && true) || ( (echo "preshed-feedstock" >>failed.23 ) && (echo "preshed-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "preshed-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyarrow-feedstock.mark ]]; then
    if [[ -d pyarrow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyarrow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyarrow-feedstock.mark ) && true) || ( (echo "pyarrow-feedstock" >>failed.23 ) && (echo "pyarrow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyarrow-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pycryptodome-feedstock.mark ]]; then
    if [[ -d pycryptodome-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycryptodome-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycryptodome-feedstock.mark ) && true) || ( (echo "pycryptodome-feedstock" >>failed.23 ) && (echo "pycryptodome-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycryptodome-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pydantic-feedstock.mark ]]; then
    if [[ -d pydantic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydantic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydantic-feedstock.mark ) && true) || ( (echo "pydantic-feedstock" >>failed.23 ) && (echo "pydantic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydantic-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyjsparser-feedstock.mark ]]; then
    if [[ -d pyjsparser-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyjsparser-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyjsparser-feedstock.mark ) && true) || ( (echo "pyjsparser-feedstock" >>failed.23 ) && (echo "pyjsparser-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyjsparser-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pykerberos-feedstock.mark ]]; then
    if [[ -d pykerberos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pykerberos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pykerberos-feedstock.mark ) && true) || ( (echo "pykerberos-feedstock" >>failed.23 ) && (echo "pykerberos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pykerberos-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pynacl-feedstock.mark ]]; then
    if [[ -d pynacl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pynacl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pynacl-feedstock.mark ) && true) || ( (echo "pynacl-feedstock" >>failed.23 ) && (echo "pynacl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pynacl-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyobjc-framework-coreservices-feedstock.mark ]]; then
    if [[ -d pyobjc-framework-coreservices-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyobjc-framework-coreservices-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyobjc-framework-coreservices-feedstock.mark ) && true) || ( (echo "pyobjc-framework-coreservices-feedstock" >>failed.23 ) && (echo "pyobjc-framework-coreservices-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyobjc-framework-coreservices-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyproj-feedstock.mark ]]; then
    if [[ -d pyproj-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyproj-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyproj-feedstock.mark ) && true) || ( (echo "pyproj-feedstock" >>failed.23 ) && (echo "pyproj-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyproj-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyramid-feedstock.mark ]]; then
    if [[ -d pyramid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyramid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyramid-feedstock.mark ) && true) || ( (echo "pyramid-feedstock" >>failed.23 ) && (echo "pyramid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyramid-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f python-lsp-server-feedstock.mark ]]; then
    if [[ -d python-lsp-server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-lsp-server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-lsp-server-feedstock.mark ) && true) || ( (echo "python-lsp-server-feedstock" >>failed.23 ) && (echo "python-lsp-server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-lsp-server-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f python-snappy-feedstock.mark ]]; then
    if [[ -d python-snappy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-snappy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-snappy-feedstock.mark ) && true) || ( (echo "python-snappy-feedstock" >>failed.23 ) && (echo "python-snappy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-snappy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f python-xxhash-feedstock.mark ]]; then
    if [[ -d python-xxhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-xxhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-xxhash-feedstock.mark ) && true) || ( (echo "python-xxhash-feedstock" >>failed.23 ) && (echo "python-xxhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-xxhash-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f python.app-feedstock.old.mark ]]; then
    if [[ -d python.app-feedstock.old ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python.app-feedstock.old >d 2>&1 && rm -f d && ( echo "done" >>python.app-feedstock.old.mark ) && true) || ( (echo "python.app-feedstock.old" >>failed.23 ) && (echo "python.app-feedstock.old" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python.app-feedstock.old not present" >>failed.23
    fi
fi


if [[ ! -f qasync-feedstock.mark ]]; then
    if [[ -d qasync-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./qasync-feedstock >d 2>&1 && rm -f d && ( echo "done" >>qasync-feedstock.mark ) && true) || ( (echo "qasync-feedstock" >>failed.23 ) && (echo "qasync-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "qasync-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f repoze.lru-feedstock.mark ]]; then
    if [[ -d repoze.lru-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./repoze.lru-feedstock >d 2>&1 && rm -f d && ( echo "done" >>repoze.lru-feedstock.mark ) && true) || ( (echo "repoze.lru-feedstock" >>failed.23 ) && (echo "repoze.lru-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "repoze.lru-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sasl-feedstock.mark ]]; then
    if [[ -d sasl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sasl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sasl-feedstock.mark ) && true) || ( (echo "sasl-feedstock" >>failed.23 ) && (echo "sasl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sasl-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f scikit-build-feedstock.mark ]]; then
    if [[ -d scikit-build-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-build-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-build-feedstock.mark ) && true) || ( (echo "scikit-build-feedstock" >>failed.23 ) && (echo "scikit-build-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-build-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f scikit-image-feedstock.mark ]]; then
    if [[ -d scikit-image-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-image-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-image-feedstock.mark ) && true) || ( (echo "scikit-image-feedstock" >>failed.23 ) && (echo "scikit-image-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-image-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f scikit-learn-feedstock.mark ]]; then
    if [[ -d scikit-learn-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-learn-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-learn-feedstock.mark ) && true) || ( (echo "scikit-learn-feedstock" >>failed.23 ) && (echo "scikit-learn-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-learn-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f shapely-feedstock.mark ]]; then
    if [[ -d shapely-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./shapely-feedstock >d 2>&1 && rm -f d && ( echo "done" >>shapely-feedstock.mark ) && true) || ( (echo "shapely-feedstock" >>failed.23 ) && (echo "shapely-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "shapely-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f smart_open-feedstock.mark ]]; then
    if [[ -d smart_open-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./smart_open-feedstock >d 2>&1 && rm -f d && ( echo "done" >>smart_open-feedstock.mark ) && true) || ( (echo "smart_open-feedstock" >>failed.23 ) && (echo "smart_open-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "smart_open-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f smartypants-feedstock.mark ]]; then
    if [[ -d smartypants-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./smartypants-feedstock >d 2>&1 && rm -f d && ( echo "done" >>smartypants-feedstock.mark ) && true) || ( (echo "smartypants-feedstock" >>failed.23 ) && (echo "smartypants-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "smartypants-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sphinx-feedstock.mark ]]; then
    if [[ -d sphinx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sphinx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sphinx-feedstock.mark ) && true) || ( (echo "sphinx-feedstock" >>failed.23 ) && (echo "sphinx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sphinx-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f srsly-feedstock.mark ]]; then
    if [[ -d srsly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./srsly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>srsly-feedstock.mark ) && true) || ( (echo "srsly-feedstock" >>failed.23 ) && (echo "srsly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "srsly-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f tangled-up-in-unicode-feedstock.mark ]]; then
    if [[ -d tangled-up-in-unicode-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tangled-up-in-unicode-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tangled-up-in-unicode-feedstock.mark ) && true) || ( (echo "tangled-up-in-unicode-feedstock" >>failed.23 ) && (echo "tangled-up-in-unicode-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tangled-up-in-unicode-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f thrift-feedstock.mark ]]; then
    if [[ -d thrift-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thrift-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thrift-feedstock.mark ) && true) || ( (echo "thrift-feedstock" >>failed.23 ) && (echo "thrift-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thrift-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f typer-feedstock.mark ]]; then
    if [[ -d typer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typer-feedstock.mark ) && true) || ( (echo "typer-feedstock" >>failed.23 ) && (echo "typer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typer-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f ukkonen-feedstock.mark ]]; then
    if [[ -d ukkonen-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ukkonen-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ukkonen-feedstock.mark ) && true) || ( (echo "ukkonen-feedstock" >>failed.23 ) && (echo "ukkonen-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ukkonen-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f virtualenv-clone-feedstock.mark ]]; then
    if [[ -d virtualenv-clone-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./virtualenv-clone-feedstock >d 2>&1 && rm -f d && ( echo "done" >>virtualenv-clone-feedstock.mark ) && true) || ( (echo "virtualenv-clone-feedstock" >>failed.23 ) && (echo "virtualenv-clone-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "virtualenv-clone-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f wasabi-feedstock.mark ]]; then
    if [[ -d wasabi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wasabi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wasabi-feedstock.mark ) && true) || ( (echo "wasabi-feedstock" >>failed.23 ) && (echo "wasabi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wasabi-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f wurlitzer-feedstock.mark ]]; then
    if [[ -d wurlitzer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wurlitzer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wurlitzer-feedstock.mark ) && true) || ( (echo "wurlitzer-feedstock" >>failed.23 ) && (echo "wurlitzer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wurlitzer-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f zope.event-feedstock.mark ]]; then
    if [[ -d zope.event-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zope.event-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zope.event-feedstock.mark ) && true) || ( (echo "zope.event-feedstock" >>failed.23 ) && (echo "zope.event-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zope.event-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f zstandard-feedstock.mark ]]; then
    if [[ -d zstandard-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zstandard-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zstandard-feedstock.mark ) && true) || ( (echo "zstandard-feedstock" >>failed.23 ) && (echo "zstandard-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zstandard-feedstock not present" >>failed.23
    fi
fi

