#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f aiobotocore-feedstock.mark ]]; then
    if [[ -d aiobotocore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aiobotocore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aiobotocore-feedstock.mark ) && true) || ( (echo "aiobotocore-feedstock" >>failed.25 ) && (echo "aiobotocore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aiobotocore-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f anaconda-client-feedstock.mark ]]; then
    if [[ -d anaconda-client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-client-feedstock.mark ) && true) || ( (echo "anaconda-client-feedstock" >>failed.25 ) && (echo "anaconda-client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-client-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f apispec-feedstock.mark ]]; then
    if [[ -d apispec-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apispec-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apispec-feedstock.mark ) && true) || ( (echo "apispec-feedstock" >>failed.25 ) && (echo "apispec-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apispec-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f apscheduler-feedstock.mark ]]; then
    if [[ -d apscheduler-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apscheduler-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apscheduler-feedstock.mark ) && true) || ( (echo "apscheduler-feedstock" >>failed.25 ) && (echo "apscheduler-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apscheduler-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f asgiref-feedstock.mark ]]; then
    if [[ -d asgiref-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asgiref-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asgiref-feedstock.mark ) && true) || ( (echo "asgiref-feedstock" >>failed.25 ) && (echo "asgiref-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asgiref-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f asyncpg-feedstock.mark ]]; then
    if [[ -d asyncpg-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asyncpg-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asyncpg-feedstock.mark ) && true) || ( (echo "asyncpg-feedstock" >>failed.25 ) && (echo "asyncpg-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asyncpg-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f aws-xray-sdk-feedstock.mark ]]; then
    if [[ -d aws-xray-sdk-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aws-xray-sdk-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aws-xray-sdk-feedstock.mark ) && true) || ( (echo "aws-xray-sdk-feedstock" >>failed.25 ) && (echo "aws-xray-sdk-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aws-xray-sdk-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f basemap-feedstock.mark ]]; then
    if [[ -d basemap-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./basemap-feedstock >d 2>&1 && rm -f d && ( echo "done" >>basemap-feedstock.mark ) && true) || ( (echo "basemap-feedstock" >>failed.25 ) && (echo "basemap-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "basemap-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f branca-feedstock.mark ]]; then
    if [[ -d branca-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./branca-feedstock >d 2>&1 && rm -f d && ( echo "done" >>branca-feedstock.mark ) && true) || ( (echo "branca-feedstock" >>failed.25 ) && (echo "branca-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "branca-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f cachelib-feedstock.mark ]]; then
    if [[ -d cachelib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cachelib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cachelib-feedstock.mark ) && true) || ( (echo "cachelib-feedstock" >>failed.25 ) && (echo "cachelib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cachelib-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f cartopy-feedstock.mark ]]; then
    if [[ -d cartopy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cartopy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cartopy-feedstock.mark ) && true) || ( (echo "cartopy-feedstock" >>failed.25 ) && (echo "cartopy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cartopy-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f cfgv-feedstock.mark ]]; then
    if [[ -d cfgv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cfgv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cfgv-feedstock.mark ) && true) || ( (echo "cfgv-feedstock" >>failed.25 ) && (echo "cfgv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cfgv-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f cfn-lint-feedstock.mark ]]; then
    if [[ -d cfn-lint-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cfn-lint-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cfn-lint-feedstock.mark ) && true) || ( (echo "cfn-lint-feedstock" >>failed.25 ) && (echo "cfn-lint-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cfn-lint-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f cheroot-feedstock.mark ]]; then
    if [[ -d cheroot-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cheroot-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cheroot-feedstock.mark ) && true) || ( (echo "cheroot-feedstock" >>failed.25 ) && (echo "cheroot-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cheroot-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f click-default-group-feedstock.mark ]]; then
    if [[ -d click-default-group-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-default-group-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-default-group-feedstock.mark ) && true) || ( (echo "click-default-group-feedstock" >>failed.25 ) && (echo "click-default-group-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-default-group-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f conda-build-feedstock.mark ]]; then
    if [[ -d conda-build-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-build-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-build-feedstock.mark ) && true) || ( (echo "conda-build-feedstock" >>failed.25 ) && (echo "conda-build-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-build-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f conda-package-streaming-feedstock.mark ]]; then
    if [[ -d conda-package-streaming-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-package-streaming-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-package-streaming-feedstock.mark ) && true) || ( (echo "conda-package-streaming-feedstock" >>failed.25 ) && (echo "conda-package-streaming-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-package-streaming-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f contextlib2-feedstock.mark ]]; then
    if [[ -d contextlib2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./contextlib2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>contextlib2-feedstock.mark ) && true) || ( (echo "contextlib2-feedstock" >>failed.25 ) && (echo "contextlib2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "contextlib2-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f curtsies-feedstock.mark ]]; then
    if [[ -d curtsies-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./curtsies-feedstock >d 2>&1 && rm -f d && ( echo "done" >>curtsies-feedstock.mark ) && true) || ( (echo "curtsies-feedstock" >>failed.25 ) && (echo "curtsies-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "curtsies-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f dask-feedstock.mark ]]; then
    if [[ -d dask-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-feedstock.mark ) && true) || ( (echo "dask-feedstock" >>failed.25 ) && (echo "dask-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f datasets-feedstock.mark ]]; then
    if [[ -d datasets-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./datasets-feedstock >d 2>&1 && rm -f d && ( echo "done" >>datasets-feedstock.mark ) && true) || ( (echo "datasets-feedstock" >>failed.25 ) && (echo "datasets-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "datasets-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f deprecated-feedstock.mark ]]; then
    if [[ -d deprecated-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./deprecated-feedstock >d 2>&1 && rm -f d && ( echo "done" >>deprecated-feedstock.mark ) && true) || ( (echo "deprecated-feedstock" >>failed.25 ) && (echo "deprecated-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "deprecated-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f distconfig3-feedstock.mark ]]; then
    if [[ -d distconfig3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distconfig3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distconfig3-feedstock.mark ) && true) || ( (echo "distconfig3-feedstock" >>failed.25 ) && (echo "distconfig3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distconfig3-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f docker-py-feedstock.mark ]]; then
    if [[ -d docker-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docker-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>docker-py-feedstock.mark ) && true) || ( (echo "docker-py-feedstock" >>failed.25 ) && (echo "docker-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docker-py-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f ensureconda-feedstock.mark ]]; then
    if [[ -d ensureconda-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ensureconda-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ensureconda-feedstock.mark ) && true) || ( (echo "ensureconda-feedstock" >>failed.25 ) && (echo "ensureconda-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ensureconda-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f exceptiongroup-feedstock.mark ]]; then
    if [[ -d exceptiongroup-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./exceptiongroup-feedstock >d 2>&1 && rm -f d && ( echo "done" >>exceptiongroup-feedstock.mark ) && true) || ( (echo "exceptiongroup-feedstock" >>failed.25 ) && (echo "exceptiongroup-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "exceptiongroup-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f flake8-polyfill-feedstock.mark ]]; then
    if [[ -d flake8-polyfill-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flake8-polyfill-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flake8-polyfill-feedstock.mark ) && true) || ( (echo "flake8-polyfill-feedstock" >>failed.25 ) && (echo "flake8-polyfill-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flake8-polyfill-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f flask-compress-feedstock.mark ]]; then
    if [[ -d flask-compress-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-compress-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-compress-feedstock.mark ) && true) || ( (echo "flask-compress-feedstock" >>failed.25 ) && (echo "flask-compress-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-compress-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f flask-jwt-extended-feedstock.mark ]]; then
    if [[ -d flask-jwt-extended-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-jwt-extended-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-jwt-extended-feedstock.mark ) && true) || ( (echo "flask-jwt-extended-feedstock" >>failed.25 ) && (echo "flask-jwt-extended-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-jwt-extended-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f flask-login-feedstock.mark ]]; then
    if [[ -d flask-login-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-login-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-login-feedstock.mark ) && true) || ( (echo "flask-login-feedstock" >>failed.25 ) && (echo "flask-login-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-login-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f flask-sqlalchemy-feedstock.mark ]]; then
    if [[ -d flask-sqlalchemy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-sqlalchemy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-sqlalchemy-feedstock.mark ) && true) || ( (echo "flask-sqlalchemy-feedstock" >>failed.25 ) && (echo "flask-sqlalchemy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-sqlalchemy-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f flask-wtf-feedstock.mark ]]; then
    if [[ -d flask-wtf-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-wtf-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-wtf-feedstock.mark ) && true) || ( (echo "flask-wtf-feedstock" >>failed.25 ) && (echo "flask-wtf-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-wtf-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f gdal-feedstock.mark ]]; then
    if [[ -d gdal-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gdal-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gdal-feedstock.mark ) && true) || ( (echo "gdal-feedstock" >>failed.25 ) && (echo "gdal-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gdal-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f gdb-feedstock.mark ]]; then
    if [[ -d gdb-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gdb-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gdb-feedstock.mark ) && true) || ( (echo "gdb-feedstock" >>failed.25 ) && (echo "gdb-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gdb-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f gevent-feedstock.mark ]]; then
    if [[ -d gevent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gevent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gevent-feedstock.mark ) && true) || ( (echo "gevent-feedstock" >>failed.25 ) && (echo "gevent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gevent-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f gitpython-feedstock.mark ]]; then
    if [[ -d gitpython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gitpython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gitpython-feedstock.mark ) && true) || ( (echo "gitpython-feedstock" >>failed.25 ) && (echo "gitpython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gitpython-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f google-cloud-core-feedstock.mark ]]; then
    if [[ -d google-cloud-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-cloud-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-cloud-core-feedstock.mark ) && true) || ( (echo "google-cloud-core-feedstock" >>failed.25 ) && (echo "google-cloud-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-cloud-core-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f google-resumable-media-feedstock.mark ]]; then
    if [[ -d google-resumable-media-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-resumable-media-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-resumable-media-feedstock.mark ) && true) || ( (echo "google-resumable-media-feedstock" >>failed.25 ) && (echo "google-resumable-media-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-resumable-media-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f graphql-core-feedstock.mark ]]; then
    if [[ -d graphql-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./graphql-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>graphql-core-feedstock.mark ) && true) || ( (echo "graphql-core-feedstock" >>failed.25 ) && (echo "graphql-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "graphql-core-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f h5py-feedstock.mark ]]; then
    if [[ -d h5py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./h5py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>h5py-feedstock.mark ) && true) || ( (echo "h5py-feedstock" >>failed.25 ) && (echo "h5py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "h5py-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f hatch-requirements-txt-feedstock.mark ]]; then
    if [[ -d hatch-requirements-txt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-requirements-txt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-requirements-txt-feedstock.mark ) && true) || ( (echo "hatch-requirements-txt-feedstock" >>failed.25 ) && (echo "hatch-requirements-txt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-requirements-txt-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f hdijupyterutils-feedstock.mark ]]; then
    if [[ -d hdijupyterutils-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hdijupyterutils-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hdijupyterutils-feedstock.mark ) && true) || ( (echo "hdijupyterutils-feedstock" >>failed.25 ) && (echo "hdijupyterutils-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hdijupyterutils-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f holoviews-feedstock.mark ]]; then
    if [[ -d holoviews-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./holoviews-feedstock >d 2>&1 && rm -f d && ( echo "done" >>holoviews-feedstock.mark ) && true) || ( (echo "holoviews-feedstock" >>failed.25 ) && (echo "holoviews-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "holoviews-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f hsluv-feedstock.mark ]]; then
    if [[ -d hsluv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hsluv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hsluv-feedstock.mark ) && true) || ( (echo "hsluv-feedstock" >>failed.25 ) && (echo "hsluv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hsluv-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f httpcore-feedstock.mark ]]; then
    if [[ -d httpcore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./httpcore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>httpcore-feedstock.mark ) && true) || ( (echo "httpcore-feedstock" >>failed.25 ) && (echo "httpcore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "httpcore-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f humanfriendly-feedstock.mark ]]; then
    if [[ -d humanfriendly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./humanfriendly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>humanfriendly-feedstock.mark ) && true) || ( (echo "humanfriendly-feedstock" >>failed.25 ) && (echo "humanfriendly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "humanfriendly-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f identify-feedstock.mark ]]; then
    if [[ -d identify-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./identify-feedstock >d 2>&1 && rm -f d && ( echo "done" >>identify-feedstock.mark ) && true) || ( (echo "identify-feedstock" >>failed.25 ) && (echo "identify-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "identify-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f imageio-feedstock.mark ]]; then
    if [[ -d imageio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imageio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imageio-feedstock.mark ) && true) || ( (echo "imageio-feedstock" >>failed.25 ) && (echo "imageio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imageio-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f impyla-feedstock.mark ]]; then
    if [[ -d impyla-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./impyla-feedstock >d 2>&1 && rm -f d && ( echo "done" >>impyla-feedstock.mark ) && true) || ( (echo "impyla-feedstock" >>failed.25 ) && (echo "impyla-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "impyla-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f inflection-feedstock.mark ]]; then
    if [[ -d inflection-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./inflection-feedstock >d 2>&1 && rm -f d && ( echo "done" >>inflection-feedstock.mark ) && true) || ( (echo "inflection-feedstock" >>failed.25 ) && (echo "inflection-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "inflection-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f intake-feedstock.mark ]]; then
    if [[ -d intake-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./intake-feedstock >d 2>&1 && rm -f d && ( echo "done" >>intake-feedstock.mark ) && true) || ( (echo "intake-feedstock" >>failed.25 ) && (echo "intake-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "intake-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f invoke-feedstock.mark ]]; then
    if [[ -d invoke-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./invoke-feedstock >d 2>&1 && rm -f d && ( echo "done" >>invoke-feedstock.mark ) && true) || ( (echo "invoke-feedstock" >>failed.25 ) && (echo "invoke-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "invoke-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f js2py-feedstock.mark ]]; then
    if [[ -d js2py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./js2py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>js2py-feedstock.mark ) && true) || ( (echo "js2py-feedstock" >>failed.25 ) && (echo "js2py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "js2py-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f jupyterhub-feedstock.mark ]]; then
    if [[ -d jupyterhub-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterhub-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterhub-feedstock.mark ) && true) || ( (echo "jupyterhub-feedstock" >>failed.25 ) && (echo "jupyterhub-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterhub-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f libmambapy-feedstock.mark ]]; then
    if [[ -d libmambapy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./libmambapy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>libmambapy-feedstock.mark ) && true) || ( (echo "libmambapy-feedstock" >>failed.25 ) && (echo "libmambapy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "libmambapy-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f license-expression-feedstock.mark ]]; then
    if [[ -d license-expression-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./license-expression-feedstock >d 2>&1 && rm -f d && ( echo "done" >>license-expression-feedstock.mark ) && true) || ( (echo "license-expression-feedstock" >>failed.25 ) && (echo "license-expression-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "license-expression-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f linecache2-feedstock.mark ]]; then
    if [[ -d linecache2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./linecache2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>linecache2-feedstock.mark ) && true) || ( (echo "linecache2-feedstock" >>failed.25 ) && (echo "linecache2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "linecache2-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f markdown-it-py-feedstock.mark ]]; then
    if [[ -d markdown-it-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markdown-it-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markdown-it-py-feedstock.mark ) && true) || ( (echo "markdown-it-py-feedstock" >>failed.25 ) && (echo "markdown-it-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markdown-it-py-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f marshmallow-enum-feedstock.mark ]]; then
    if [[ -d marshmallow-enum-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./marshmallow-enum-feedstock >d 2>&1 && rm -f d && ( echo "done" >>marshmallow-enum-feedstock.mark ) && true) || ( (echo "marshmallow-enum-feedstock" >>failed.25 ) && (echo "marshmallow-enum-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "marshmallow-enum-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f maturin-feedstock.mark ]]; then
    if [[ -d maturin-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./maturin-feedstock >d 2>&1 && rm -f d && ( echo "done" >>maturin-feedstock.mark ) && true) || ( (echo "maturin-feedstock" >>failed.25 ) && (echo "maturin-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "maturin-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f multipledispatch-feedstock.mark ]]; then
    if [[ -d multipledispatch-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multipledispatch-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multipledispatch-feedstock.mark ) && true) || ( (echo "multipledispatch-feedstock" >>failed.25 ) && (echo "multipledispatch-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multipledispatch-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f nodeenv-feedstock.mark ]]; then
    if [[ -d nodeenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nodeenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nodeenv-feedstock.mark ) && true) || ( (echo "nodeenv-feedstock" >>failed.25 ) && (echo "nodeenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nodeenv-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f opentracing-feedstock.mark ]]; then
    if [[ -d opentracing-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./opentracing-feedstock >d 2>&1 && rm -f d && ( echo "done" >>opentracing-feedstock.mark ) && true) || ( (echo "opentracing-feedstock" >>failed.25 ) && (echo "opentracing-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "opentracing-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pathy-feedstock.mark ]]; then
    if [[ -d pathy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pathy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pathy-feedstock.mark ) && true) || ( (echo "pathy-feedstock" >>failed.25 ) && (echo "pathy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pathy-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pdm-feedstock.mark ]]; then
    if [[ -d pdm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-feedstock.mark ) && true) || ( (echo "pdm-feedstock" >>failed.25 ) && (echo "pdm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f phik-feedstock.mark ]]; then
    if [[ -d phik-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./phik-feedstock >d 2>&1 && rm -f d && ( echo "done" >>phik-feedstock.mark ) && true) || ( (echo "phik-feedstock" >>failed.25 ) && (echo "phik-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "phik-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pipenv-feedstock.mark ]]; then
    if [[ -d pipenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pipenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pipenv-feedstock.mark ) && true) || ( (echo "pipenv-feedstock" >>failed.25 ) && (echo "pipenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pipenv-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f plotly-feedstock.mark ]]; then
    if [[ -d plotly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./plotly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>plotly-feedstock.mark ) && true) || ( (echo "plotly-feedstock" >>failed.25 ) && (echo "plotly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "plotly-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f prettytable-feedstock.mark ]]; then
    if [[ -d prettytable-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prettytable-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prettytable-feedstock.mark ) && true) || ( (echo "prettytable-feedstock" >>failed.25 ) && (echo "prettytable-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prettytable-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f prison-feedstock.mark ]]; then
    if [[ -d prison-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prison-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prison-feedstock.mark ) && true) || ( (echo "prison-feedstock" >>failed.25 ) && (echo "prison-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prison-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f psycopg2-feedstock.mark ]]; then
    if [[ -d psycopg2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./psycopg2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>psycopg2-feedstock.mark ) && true) || ( (echo "psycopg2-feedstock" >>failed.25 ) && (echo "psycopg2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "psycopg2-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f py4j-feedstock.mark ]]; then
    if [[ -d py4j-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./py4j-feedstock >d 2>&1 && rm -f d && ( echo "done" >>py4j-feedstock.mark ) && true) || ( (echo "py4j-feedstock" >>failed.25 ) && (echo "py4j-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "py4j-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pycryptodomex-feedstock.mark ]]; then
    if [[ -d pycryptodomex-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycryptodomex-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycryptodomex-feedstock.mark ) && true) || ( (echo "pycryptodomex-feedstock" >>failed.25 ) && (echo "pycryptodomex-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycryptodomex-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pydeck-feedstock.mark ]]; then
    if [[ -d pydeck-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydeck-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydeck-feedstock.mark ) && true) || ( (echo "pydeck-feedstock" >>failed.25 ) && (echo "pydeck-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydeck-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pydispatcher-feedstock.mark ]]; then
    if [[ -d pydispatcher-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydispatcher-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydispatcher-feedstock.mark ) && true) || ( (echo "pydispatcher-feedstock" >>failed.25 ) && (echo "pydispatcher-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydispatcher-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pyerfa-feedstock.mark ]]; then
    if [[ -d pyerfa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyerfa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyerfa-feedstock.mark ) && true) || ( (echo "pyerfa-feedstock" >>failed.25 ) && (echo "pyerfa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyerfa-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pyinotify-feedstock.mark ]]; then
    if [[ -d pyinotify-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyinotify-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyinotify-feedstock.mark ) && true) || ( (echo "pyinotify-feedstock" >>failed.25 ) && (echo "pyinotify-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyinotify-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pymysql-feedstock.mark ]]; then
    if [[ -d pymysql-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pymysql-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pymysql-feedstock.mark ) && true) || ( (echo "pymysql-feedstock" >>failed.25 ) && (echo "pymysql-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pymysql-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pyproject-metadata-feedstock.mark ]]; then
    if [[ -d pyproject-metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyproject-metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyproject-metadata-feedstock.mark ) && true) || ( (echo "pyproject-metadata-feedstock" >>failed.25 ) && (echo "pyproject-metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyproject-metadata-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pytables-feedstock.mark ]]; then
    if [[ -d pytables-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytables-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytables-feedstock.mark ) && true) || ( (echo "pytables-feedstock" >>failed.25 ) && (echo "pytables-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytables-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pytest-arraydiff-feedstock.mark ]]; then
    if [[ -d pytest-arraydiff-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-arraydiff-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-arraydiff-feedstock.mark ) && true) || ( (echo "pytest-arraydiff-feedstock" >>failed.25 ) && (echo "pytest-arraydiff-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-arraydiff-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pytest-mock-feedstock.mark ]]; then
    if [[ -d pytest-mock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-mock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-mock-feedstock.mark ) && true) || ( (echo "pytest-mock-feedstock" >>failed.25 ) && (echo "pytest-mock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-mock-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f pytest-remotedata-feedstock.mark ]]; then
    if [[ -d pytest-remotedata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-remotedata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-remotedata-feedstock.mark ) && true) || ( (echo "pytest-remotedata-feedstock" >>failed.25 ) && (echo "pytest-remotedata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-remotedata-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f python-daemon-feedstock.mark ]]; then
    if [[ -d python-daemon-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-daemon-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-daemon-feedstock.mark ) && true) || ( (echo "python-daemon-feedstock" >>failed.25 ) && (echo "python-daemon-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-daemon-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f python-graphviz-feedstock.mark ]]; then
    if [[ -d python-graphviz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-graphviz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-graphviz-feedstock.mark ) && true) || ( (echo "python-graphviz-feedstock" >>failed.25 ) && (echo "python-graphviz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-graphviz-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f python-hdfs-feedstock.mark ]]; then
    if [[ -d python-hdfs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-hdfs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-hdfs-feedstock.mark ) && true) || ( (echo "python-hdfs-feedstock" >>failed.25 ) && (echo "python-hdfs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-hdfs-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f python-levenshtein-feedstock.mark ]]; then
    if [[ -d python-levenshtein-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-levenshtein-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-levenshtein-feedstock.mark ) && true) || ( (echo "python-levenshtein-feedstock" >>failed.25 ) && (echo "python-levenshtein-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-levenshtein-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f python-lsp-server-feedstock.mark ]]; then
    if [[ -d python-lsp-server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-lsp-server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-lsp-server-feedstock.mark ) && true) || ( (echo "python-lsp-server-feedstock" >>failed.25 ) && (echo "python-lsp-server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-lsp-server-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f python3-openid-feedstock.mark ]]; then
    if [[ -d python3-openid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python3-openid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python3-openid-feedstock.mark ) && true) || ( (echo "python3-openid-feedstock" >>failed.25 ) && (echo "python3-openid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python3-openid-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f regex-feedstock.mark ]]; then
    if [[ -d regex-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./regex-feedstock >d 2>&1 && rm -f d && ( echo "done" >>regex-feedstock.mark ) && true) || ( (echo "regex-feedstock" >>failed.25 ) && (echo "regex-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "regex-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f routes-feedstock.mark ]]; then
    if [[ -d routes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./routes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>routes-feedstock.mark ) && true) || ( (echo "routes-feedstock" >>failed.25 ) && (echo "routes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "routes-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f ruamel_yaml-feedstock.mark ]]; then
    if [[ -d ruamel_yaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel_yaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel_yaml-feedstock.mark ) && true) || ( (echo "ruamel_yaml-feedstock" >>failed.25 ) && (echo "ruamel_yaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel_yaml-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f sasl-feedstock.mark ]]; then
    if [[ -d sasl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sasl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sasl-feedstock.mark ) && true) || ( (echo "sasl-feedstock" >>failed.25 ) && (echo "sasl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sasl-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f seaborn-feedstock.mark ]]; then
    if [[ -d seaborn-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./seaborn-feedstock >d 2>&1 && rm -f d && ( echo "done" >>seaborn-feedstock.mark ) && true) || ( (echo "seaborn-feedstock" >>failed.25 ) && (echo "seaborn-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "seaborn-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f setuptools-git-feedstock.mark ]]; then
    if [[ -d setuptools-git-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-git-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-git-feedstock.mark ) && true) || ( (echo "setuptools-git-feedstock" >>failed.25 ) && (echo "setuptools-git-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-git-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f simplejson-feedstock.mark ]]; then
    if [[ -d simplejson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./simplejson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>simplejson-feedstock.mark ) && true) || ( (echo "simplejson-feedstock" >>failed.25 ) && (echo "simplejson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "simplejson-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f sip-feedstock.mark ]]; then
    if [[ -d sip-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sip-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sip-feedstock.mark ) && true) || ( (echo "sip-feedstock" >>failed.25 ) && (echo "sip-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sip-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f skl2onnx-feedstock.mark ]]; then
    if [[ -d skl2onnx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./skl2onnx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>skl2onnx-feedstock.mark ) && true) || ( (echo "skl2onnx-feedstock" >>failed.25 ) && (echo "skl2onnx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "skl2onnx-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f spacy-legacy-feedstock.mark ]]; then
    if [[ -d spacy-legacy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spacy-legacy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spacy-legacy-feedstock.mark ) && true) || ( (echo "spacy-legacy-feedstock" >>failed.25 ) && (echo "spacy-legacy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spacy-legacy-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f sphinx-feedstock.mark ]]; then
    if [[ -d sphinx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sphinx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sphinx-feedstock.mark ) && true) || ( (echo "sphinx-feedstock" >>failed.25 ) && (echo "sphinx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sphinx-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f sqlparse-feedstock.mark ]]; then
    if [[ -d sqlparse-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sqlparse-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sqlparse-feedstock.mark ) && true) || ( (echo "sqlparse-feedstock" >>failed.25 ) && (echo "sqlparse-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sqlparse-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f statsmodels-feedstock.mark ]]; then
    if [[ -d statsmodels-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./statsmodels-feedstock >d 2>&1 && rm -f d && ( echo "done" >>statsmodels-feedstock.mark ) && true) || ( (echo "statsmodels-feedstock" >>failed.25 ) && (echo "statsmodels-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "statsmodels-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f sympy-feedstock.mark ]]; then
    if [[ -d sympy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sympy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sympy-feedstock.mark ) && true) || ( (echo "sympy-feedstock" >>failed.25 ) && (echo "sympy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sympy-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f theano-pymc-feedstock.mark ]]; then
    if [[ -d theano-pymc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./theano-pymc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>theano-pymc-feedstock.mark ) && true) || ( (echo "theano-pymc-feedstock" >>failed.25 ) && (echo "theano-pymc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "theano-pymc-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f thinc-feedstock.mark ]]; then
    if [[ -d thinc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thinc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thinc-feedstock.mark ) && true) || ( (echo "thinc-feedstock" >>failed.25 ) && (echo "thinc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thinc-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f thrift-feedstock.mark ]]; then
    if [[ -d thrift-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thrift-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thrift-feedstock.mark ) && true) || ( (echo "thrift-feedstock" >>failed.25 ) && (echo "thrift-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thrift-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f traits-feedstock.mark ]]; then
    if [[ -d traits-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./traits-feedstock >d 2>&1 && rm -f d && ( echo "done" >>traits-feedstock.mark ) && true) || ( (echo "traits-feedstock" >>failed.25 ) && (echo "traits-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "traits-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f twisted-feedstock.mark ]]; then
    if [[ -d twisted-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./twisted-feedstock >d 2>&1 && rm -f d && ( echo "done" >>twisted-feedstock.mark ) && true) || ( (echo "twisted-feedstock" >>failed.25 ) && (echo "twisted-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "twisted-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f typeguard-feedstock.mark ]]; then
    if [[ -d typeguard-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typeguard-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typeguard-feedstock.mark ) && true) || ( (echo "typeguard-feedstock" >>failed.25 ) && (echo "typeguard-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typeguard-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f types-pytz-feedstock.mark ]]; then
    if [[ -d types-pytz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./types-pytz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>types-pytz-feedstock.mark ) && true) || ( (echo "types-pytz-feedstock" >>failed.25 ) && (echo "types-pytz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "types-pytz-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f uc-micro-py-feedstock.mark ]]; then
    if [[ -d uc-micro-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./uc-micro-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>uc-micro-py-feedstock.mark ) && true) || ( (echo "uc-micro-py-feedstock" >>failed.25 ) && (echo "uc-micro-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "uc-micro-py-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f urwid-feedstock.mark ]]; then
    if [[ -d urwid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./urwid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>urwid-feedstock.mark ) && true) || ( (echo "urwid-feedstock" >>failed.25 ) && (echo "urwid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "urwid-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f visions-feedstock.mark ]]; then
    if [[ -d visions-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./visions-feedstock >d 2>&1 && rm -f d && ( echo "done" >>visions-feedstock.mark ) && true) || ( (echo "visions-feedstock" >>failed.25 ) && (echo "visions-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "visions-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f watchdog-feedstock.mark ]]; then
    if [[ -d watchdog-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./watchdog-feedstock >d 2>&1 && rm -f d && ( echo "done" >>watchdog-feedstock.mark ) && true) || ( (echo "watchdog-feedstock" >>failed.25 ) && (echo "watchdog-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "watchdog-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f wurlitzer-feedstock.mark ]]; then
    if [[ -d wurlitzer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wurlitzer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wurlitzer-feedstock.mark ) && true) || ( (echo "wurlitzer-feedstock" >>failed.25 ) && (echo "wurlitzer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wurlitzer-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f xgboost-feedstock.mark ]]; then
    if [[ -d xgboost-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xgboost-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xgboost-feedstock.mark ) && true) || ( (echo "xgboost-feedstock" >>failed.25 ) && (echo "xgboost-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xgboost-feedstock not present" >>failed.25
    fi
fi


if [[ ! -f zarr-feedstock.mark ]]; then
    if [[ -d zarr-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zarr-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zarr-feedstock.mark ) && true) || ( (echo "zarr-feedstock" >>failed.25 ) && (echo "zarr-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zarr-feedstock not present" >>failed.25
    fi
fi

