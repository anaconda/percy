#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f aiobotocore-feedstock.mark ]]; then
    if [[ -d aiobotocore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aiobotocore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aiobotocore-feedstock.mark ) && true) || ( (echo "aiobotocore-feedstock" >>failed.24 ) && (echo "aiobotocore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aiobotocore-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f anaconda-client-feedstock.mark ]]; then
    if [[ -d anaconda-client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-client-feedstock.mark ) && true) || ( (echo "anaconda-client-feedstock" >>failed.24 ) && (echo "anaconda-client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-client-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apache-libcloud-feedstock.mark ]]; then
    if [[ -d apache-libcloud-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-libcloud-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-libcloud-feedstock.mark ) && true) || ( (echo "apache-libcloud-feedstock" >>failed.24 ) && (echo "apache-libcloud-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-libcloud-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f applaunchservices-feedstock.mark ]]; then
    if [[ -d applaunchservices-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./applaunchservices-feedstock >d 2>&1 && rm -f d && ( echo "done" >>applaunchservices-feedstock.mark ) && true) || ( (echo "applaunchservices-feedstock" >>failed.24 ) && (echo "applaunchservices-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "applaunchservices-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f appscript-feedstock.mark ]]; then
    if [[ -d appscript-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./appscript-feedstock >d 2>&1 && rm -f d && ( echo "done" >>appscript-feedstock.mark ) && true) || ( (echo "appscript-feedstock" >>failed.24 ) && (echo "appscript-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "appscript-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apscheduler-feedstock.mark ]]; then
    if [[ -d apscheduler-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apscheduler-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apscheduler-feedstock.mark ) && true) || ( (echo "apscheduler-feedstock" >>failed.24 ) && (echo "apscheduler-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apscheduler-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f asgiref-feedstock.mark ]]; then
    if [[ -d asgiref-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asgiref-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asgiref-feedstock.mark ) && true) || ( (echo "asgiref-feedstock" >>failed.24 ) && (echo "asgiref-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asgiref-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f autovizwidget-feedstock.mark ]]; then
    if [[ -d autovizwidget-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./autovizwidget-feedstock >d 2>&1 && rm -f d && ( echo "done" >>autovizwidget-feedstock.mark ) && true) || ( (echo "autovizwidget-feedstock" >>failed.24 ) && (echo "autovizwidget-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "autovizwidget-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f aws-xray-sdk-feedstock.mark ]]; then
    if [[ -d aws-xray-sdk-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aws-xray-sdk-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aws-xray-sdk-feedstock.mark ) && true) || ( (echo "aws-xray-sdk-feedstock" >>failed.24 ) && (echo "aws-xray-sdk-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aws-xray-sdk-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f basemap-feedstock.mark ]]; then
    if [[ -d basemap-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./basemap-feedstock >d 2>&1 && rm -f d && ( echo "done" >>basemap-feedstock.mark ) && true) || ( (echo "basemap-feedstock" >>failed.24 ) && (echo "basemap-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "basemap-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f bitarray-feedstock.mark ]]; then
    if [[ -d bitarray-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bitarray-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bitarray-feedstock.mark ) && true) || ( (echo "bitarray-feedstock" >>failed.24 ) && (echo "bitarray-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bitarray-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f branca-feedstock.mark ]]; then
    if [[ -d branca-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./branca-feedstock >d 2>&1 && rm -f d && ( echo "done" >>branca-feedstock.mark ) && true) || ( (echo "branca-feedstock" >>failed.24 ) && (echo "branca-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "branca-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cachelib-feedstock.mark ]]; then
    if [[ -d cachelib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cachelib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cachelib-feedstock.mark ) && true) || ( (echo "cachelib-feedstock" >>failed.24 ) && (echo "cachelib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cachelib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cartopy-feedstock.mark ]]; then
    if [[ -d cartopy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cartopy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cartopy-feedstock.mark ) && true) || ( (echo "cartopy-feedstock" >>failed.24 ) && (echo "cartopy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cartopy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cfgv-feedstock.mark ]]; then
    if [[ -d cfgv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cfgv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cfgv-feedstock.mark ) && true) || ( (echo "cfgv-feedstock" >>failed.24 ) && (echo "cfgv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cfgv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cfn-lint-feedstock.mark ]]; then
    if [[ -d cfn-lint-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cfn-lint-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cfn-lint-feedstock.mark ) && true) || ( (echo "cfn-lint-feedstock" >>failed.24 ) && (echo "cfn-lint-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cfn-lint-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cheroot-feedstock.mark ]]; then
    if [[ -d cheroot-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cheroot-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cheroot-feedstock.mark ) && true) || ( (echo "cheroot-feedstock" >>failed.24 ) && (echo "cheroot-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cheroot-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f chex-feedstock.mark ]]; then
    if [[ -d chex-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./chex-feedstock >d 2>&1 && rm -f d && ( echo "done" >>chex-feedstock.mark ) && true) || ( (echo "chex-feedstock" >>failed.24 ) && (echo "chex-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "chex-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f click-default-group-feedstock.mark ]]; then
    if [[ -d click-default-group-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-default-group-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-default-group-feedstock.mark ) && true) || ( (echo "click-default-group-feedstock" >>failed.24 ) && (echo "click-default-group-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-default-group-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f clr_loader-feedstock.mark ]]; then
    if [[ -d clr_loader-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clr_loader-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clr_loader-feedstock.mark ) && true) || ( (echo "clr_loader-feedstock" >>failed.24 ) && (echo "clr_loader-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clr_loader-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f conda-build-feedstock.mark ]]; then
    if [[ -d conda-build-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-build-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-build-feedstock.mark ) && true) || ( (echo "conda-build-feedstock" >>failed.24 ) && (echo "conda-build-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-build-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f conda-package-streaming-feedstock.mark ]]; then
    if [[ -d conda-package-streaming-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-package-streaming-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-package-streaming-feedstock.mark ) && true) || ( (echo "conda-package-streaming-feedstock" >>failed.24 ) && (echo "conda-package-streaming-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-package-streaming-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f contextlib2-feedstock.mark ]]; then
    if [[ -d contextlib2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./contextlib2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>contextlib2-feedstock.mark ) && true) || ( (echo "contextlib2-feedstock" >>failed.24 ) && (echo "contextlib2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "contextlib2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f curtsies-feedstock.mark ]]; then
    if [[ -d curtsies-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./curtsies-feedstock >d 2>&1 && rm -f d && ( echo "done" >>curtsies-feedstock.mark ) && true) || ( (echo "curtsies-feedstock" >>failed.24 ) && (echo "curtsies-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "curtsies-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f dask-feedstock.mark ]]; then
    if [[ -d dask-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-feedstock.mark ) && true) || ( (echo "dask-feedstock" >>failed.24 ) && (echo "dask-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f datasets-feedstock.mark ]]; then
    if [[ -d datasets-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./datasets-feedstock >d 2>&1 && rm -f d && ( echo "done" >>datasets-feedstock.mark ) && true) || ( (echo "datasets-feedstock" >>failed.24 ) && (echo "datasets-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "datasets-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f deprecated-feedstock.mark ]]; then
    if [[ -d deprecated-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./deprecated-feedstock >d 2>&1 && rm -f d && ( echo "done" >>deprecated-feedstock.mark ) && true) || ( (echo "deprecated-feedstock" >>failed.24 ) && (echo "deprecated-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "deprecated-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f distconfig3-feedstock.mark ]]; then
    if [[ -d distconfig3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distconfig3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distconfig3-feedstock.mark ) && true) || ( (echo "distconfig3-feedstock" >>failed.24 ) && (echo "distconfig3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distconfig3-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f docker-py-feedstock.mark ]]; then
    if [[ -d docker-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docker-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>docker-py-feedstock.mark ) && true) || ( (echo "docker-py-feedstock" >>failed.24 ) && (echo "docker-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docker-py-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f docopt-feedstock.mark ]]; then
    if [[ -d docopt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docopt-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>docopt-feedstock.mark ) && true) || ( (echo "docopt-feedstock" >>failed.24 ) && (echo "docopt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docopt-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f drmaa-feedstock.mark ]]; then
    if [[ -d drmaa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./drmaa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>drmaa-feedstock.mark ) && true) || ( (echo "drmaa-feedstock" >>failed.24 ) && (echo "drmaa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "drmaa-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ensureconda-feedstock.mark ]]; then
    if [[ -d ensureconda-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ensureconda-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ensureconda-feedstock.mark ) && true) || ( (echo "ensureconda-feedstock" >>failed.24 ) && (echo "ensureconda-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ensureconda-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f exceptiongroup-feedstock.mark ]]; then
    if [[ -d exceptiongroup-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./exceptiongroup-feedstock >d 2>&1 && rm -f d && ( echo "done" >>exceptiongroup-feedstock.mark ) && true) || ( (echo "exceptiongroup-feedstock" >>failed.24 ) && (echo "exceptiongroup-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "exceptiongroup-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f fastavro-feedstock.mark ]]; then
    if [[ -d fastavro-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastavro-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastavro-feedstock.mark ) && true) || ( (echo "fastavro-feedstock" >>failed.24 ) && (echo "fastavro-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastavro-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flake8-polyfill-feedstock.mark ]]; then
    if [[ -d flake8-polyfill-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flake8-polyfill-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flake8-polyfill-feedstock.mark ) && true) || ( (echo "flake8-polyfill-feedstock" >>failed.24 ) && (echo "flake8-polyfill-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flake8-polyfill-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-compress-feedstock.mark ]]; then
    if [[ -d flask-compress-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-compress-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-compress-feedstock.mark ) && true) || ( (echo "flask-compress-feedstock" >>failed.24 ) && (echo "flask-compress-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-compress-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-jwt-extended-feedstock.mark ]]; then
    if [[ -d flask-jwt-extended-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-jwt-extended-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-jwt-extended-feedstock.mark ) && true) || ( (echo "flask-jwt-extended-feedstock" >>failed.24 ) && (echo "flask-jwt-extended-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-jwt-extended-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-login-feedstock.mark ]]; then
    if [[ -d flask-login-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-login-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-login-feedstock.mark ) && true) || ( (echo "flask-login-feedstock" >>failed.24 ) && (echo "flask-login-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-login-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-sqlalchemy-feedstock.mark ]]; then
    if [[ -d flask-sqlalchemy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-sqlalchemy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-sqlalchemy-feedstock.mark ) && true) || ( (echo "flask-sqlalchemy-feedstock" >>failed.24 ) && (echo "flask-sqlalchemy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-sqlalchemy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-wtf-feedstock.mark ]]; then
    if [[ -d flask-wtf-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-wtf-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-wtf-feedstock.mark ) && true) || ( (echo "flask-wtf-feedstock" >>failed.24 ) && (echo "flask-wtf-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-wtf-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f gdal-feedstock.mark ]]; then
    if [[ -d gdal-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gdal-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gdal-feedstock.mark ) && true) || ( (echo "gdal-feedstock" >>failed.24 ) && (echo "gdal-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gdal-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f gevent-feedstock.mark ]]; then
    if [[ -d gevent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gevent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gevent-feedstock.mark ) && true) || ( (echo "gevent-feedstock" >>failed.24 ) && (echo "gevent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gevent-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f gitpython-feedstock.mark ]]; then
    if [[ -d gitpython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gitpython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gitpython-feedstock.mark ) && true) || ( (echo "gitpython-feedstock" >>failed.24 ) && (echo "gitpython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gitpython-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f glue-core-feedstock.mark ]]; then
    if [[ -d glue-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./glue-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>glue-core-feedstock.mark ) && true) || ( (echo "glue-core-feedstock" >>failed.24 ) && (echo "glue-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "glue-core-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f google-auth-oauthlib-feedstock.mark ]]; then
    if [[ -d google-auth-oauthlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-auth-oauthlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-auth-oauthlib-feedstock.mark ) && true) || ( (echo "google-auth-oauthlib-feedstock" >>failed.24 ) && (echo "google-auth-oauthlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-auth-oauthlib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f google-cloud-core-feedstock.mark ]]; then
    if [[ -d google-cloud-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-cloud-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-cloud-core-feedstock.mark ) && true) || ( (echo "google-cloud-core-feedstock" >>failed.24 ) && (echo "google-cloud-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-cloud-core-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f google-resumable-media-feedstock.mark ]]; then
    if [[ -d google-resumable-media-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-resumable-media-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-resumable-media-feedstock.mark ) && true) || ( (echo "google-resumable-media-feedstock" >>failed.24 ) && (echo "google-resumable-media-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-resumable-media-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f graphql-core-feedstock.mark ]]; then
    if [[ -d graphql-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./graphql-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>graphql-core-feedstock.mark ) && true) || ( (echo "graphql-core-feedstock" >>failed.24 ) && (echo "graphql-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "graphql-core-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f hatch-requirements-txt-feedstock.mark ]]; then
    if [[ -d hatch-requirements-txt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-requirements-txt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-requirements-txt-feedstock.mark ) && true) || ( (echo "hatch-requirements-txt-feedstock" >>failed.24 ) && (echo "hatch-requirements-txt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-requirements-txt-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f holoviews-feedstock.mark ]]; then
    if [[ -d holoviews-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./holoviews-feedstock >d 2>&1 && rm -f d && ( echo "done" >>holoviews-feedstock.mark ) && true) || ( (echo "holoviews-feedstock" >>failed.24 ) && (echo "holoviews-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "holoviews-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f httpcore-feedstock.mark ]]; then
    if [[ -d httpcore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./httpcore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>httpcore-feedstock.mark ) && true) || ( (echo "httpcore-feedstock" >>failed.24 ) && (echo "httpcore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "httpcore-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f humanfriendly-feedstock.mark ]]; then
    if [[ -d humanfriendly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./humanfriendly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>humanfriendly-feedstock.mark ) && true) || ( (echo "humanfriendly-feedstock" >>failed.24 ) && (echo "humanfriendly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "humanfriendly-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f identify-feedstock.mark ]]; then
    if [[ -d identify-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./identify-feedstock >d 2>&1 && rm -f d && ( echo "done" >>identify-feedstock.mark ) && true) || ( (echo "identify-feedstock" >>failed.24 ) && (echo "identify-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "identify-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f intake-feedstock.mark ]]; then
    if [[ -d intake-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./intake-feedstock >d 2>&1 && rm -f d && ( echo "done" >>intake-feedstock.mark ) && true) || ( (echo "intake-feedstock" >>failed.24 ) && (echo "intake-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "intake-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f invoke-feedstock.mark ]]; then
    if [[ -d invoke-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./invoke-feedstock >d 2>&1 && rm -f d && ( echo "done" >>invoke-feedstock.mark ) && true) || ( (echo "invoke-feedstock" >>failed.24 ) && (echo "invoke-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "invoke-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jellyfish-feedstock.mark ]]; then
    if [[ -d jellyfish-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jellyfish-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jellyfish-feedstock.mark ) && true) || ( (echo "jellyfish-feedstock" >>failed.24 ) && (echo "jellyfish-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jellyfish-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f js2py-feedstock.mark ]]; then
    if [[ -d js2py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./js2py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>js2py-feedstock.mark ) && true) || ( (echo "js2py-feedstock" >>failed.24 ) && (echo "js2py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "js2py-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jupyterhub-feedstock.mark ]]; then
    if [[ -d jupyterhub-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterhub-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterhub-feedstock.mark ) && true) || ( (echo "jupyterhub-feedstock" >>failed.24 ) && (echo "jupyterhub-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterhub-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f libmambapy-feedstock.mark ]]; then
    if [[ -d libmambapy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./libmambapy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>libmambapy-feedstock.mark ) && true) || ( (echo "libmambapy-feedstock" >>failed.24 ) && (echo "libmambapy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "libmambapy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f license-expression-feedstock.mark ]]; then
    if [[ -d license-expression-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./license-expression-feedstock >d 2>&1 && rm -f d && ( echo "done" >>license-expression-feedstock.mark ) && true) || ( (echo "license-expression-feedstock" >>failed.24 ) && (echo "license-expression-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "license-expression-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f linecache2-feedstock.mark ]]; then
    if [[ -d linecache2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./linecache2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>linecache2-feedstock.mark ) && true) || ( (echo "linecache2-feedstock" >>failed.24 ) && (echo "linecache2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "linecache2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f macfsevents-feedstock.mark ]]; then
    if [[ -d macfsevents-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./macfsevents-feedstock >d 2>&1 && rm -f d && ( echo "done" >>macfsevents-feedstock.mark ) && true) || ( (echo "macfsevents-feedstock" >>failed.24 ) && (echo "macfsevents-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "macfsevents-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f macholib-feedstock.mark ]]; then
    if [[ -d macholib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./macholib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>macholib-feedstock.mark ) && true) || ( (echo "macholib-feedstock" >>failed.24 ) && (echo "macholib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "macholib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f markdown-it-py-feedstock.mark ]]; then
    if [[ -d markdown-it-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markdown-it-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markdown-it-py-feedstock.mark ) && true) || ( (echo "markdown-it-py-feedstock" >>failed.24 ) && (echo "markdown-it-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markdown-it-py-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f marshmallow-enum-feedstock.mark ]]; then
    if [[ -d marshmallow-enum-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./marshmallow-enum-feedstock >d 2>&1 && rm -f d && ( echo "done" >>marshmallow-enum-feedstock.mark ) && true) || ( (echo "marshmallow-enum-feedstock" >>failed.24 ) && (echo "marshmallow-enum-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "marshmallow-enum-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f multipledispatch-feedstock.mark ]]; then
    if [[ -d multipledispatch-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multipledispatch-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multipledispatch-feedstock.mark ) && true) || ( (echo "multipledispatch-feedstock" >>failed.24 ) && (echo "multipledispatch-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multipledispatch-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f netcdf4-feedstock.mark ]]; then
    if [[ -d netcdf4-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./netcdf4-feedstock >d 2>&1 && rm -f d && ( echo "done" >>netcdf4-feedstock.mark ) && true) || ( (echo "netcdf4-feedstock" >>failed.24 ) && (echo "netcdf4-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "netcdf4-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f nodeenv-feedstock.mark ]]; then
    if [[ -d nodeenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nodeenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nodeenv-feedstock.mark ) && true) || ( (echo "nodeenv-feedstock" >>failed.24 ) && (echo "nodeenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nodeenv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f numpydoc-feedstock.mark ]]; then
    if [[ -d numpydoc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpydoc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpydoc-feedstock.mark ) && true) || ( (echo "numpydoc-feedstock" >>failed.24 ) && (echo "numpydoc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpydoc-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f onnx-feedstock.mark ]]; then
    if [[ -d onnx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./onnx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>onnx-feedstock.mark ) && true) || ( (echo "onnx-feedstock" >>failed.24 ) && (echo "onnx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "onnx-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f opentracing-feedstock.mark ]]; then
    if [[ -d opentracing-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./opentracing-feedstock >d 2>&1 && rm -f d && ( echo "done" >>opentracing-feedstock.mark ) && true) || ( (echo "opentracing-feedstock" >>failed.24 ) && (echo "opentracing-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "opentracing-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f orange-canvas-core-feedstock.mark ]]; then
    if [[ -d orange-canvas-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./orange-canvas-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>orange-canvas-core-feedstock.mark ) && true) || ( (echo "orange-canvas-core-feedstock" >>failed.24 ) && (echo "orange-canvas-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "orange-canvas-core-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pathy-feedstock.mark ]]; then
    if [[ -d pathy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pathy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pathy-feedstock.mark ) && true) || ( (echo "pathy-feedstock" >>failed.24 ) && (echo "pathy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pathy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f persistent-feedstock.mark ]]; then
    if [[ -d persistent-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./persistent-feedstock >d 2>&1 && rm -f d && ( echo "done" >>persistent-feedstock.mark ) && true) || ( (echo "persistent-feedstock" >>failed.24 ) && (echo "persistent-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "persistent-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f phik-feedstock.mark ]]; then
    if [[ -d phik-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./phik-feedstock >d 2>&1 && rm -f d && ( echo "done" >>phik-feedstock.mark ) && true) || ( (echo "phik-feedstock" >>failed.24 ) && (echo "phik-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "phik-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pipenv-feedstock.mark ]]; then
    if [[ -d pipenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pipenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pipenv-feedstock.mark ) && true) || ( (echo "pipenv-feedstock" >>failed.24 ) && (echo "pipenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pipenv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f prettytable-feedstock.mark ]]; then
    if [[ -d prettytable-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prettytable-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prettytable-feedstock.mark ) && true) || ( (echo "prettytable-feedstock" >>failed.24 ) && (echo "prettytable-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prettytable-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f prison-feedstock.mark ]]; then
    if [[ -d prison-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prison-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prison-feedstock.mark ) && true) || ( (echo "prison-feedstock" >>failed.24 ) && (echo "prison-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prison-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f psycopg2-feedstock.mark ]]; then
    if [[ -d psycopg2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./psycopg2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>psycopg2-feedstock.mark ) && true) || ( (echo "psycopg2-feedstock" >>failed.24 ) && (echo "psycopg2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "psycopg2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f py4j-feedstock.mark ]]; then
    if [[ -d py4j-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./py4j-feedstock >d 2>&1 && rm -f d && ( echo "done" >>py4j-feedstock.mark ) && true) || ( (echo "py4j-feedstock" >>failed.24 ) && (echo "py4j-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "py4j-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pydeck-feedstock.mark ]]; then
    if [[ -d pydeck-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydeck-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydeck-feedstock.mark ) && true) || ( (echo "pydeck-feedstock" >>failed.24 ) && (echo "pydeck-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydeck-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pydispatcher-feedstock.mark ]]; then
    if [[ -d pydispatcher-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydispatcher-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydispatcher-feedstock.mark ) && true) || ( (echo "pydispatcher-feedstock" >>failed.24 ) && (echo "pydispatcher-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydispatcher-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyinstaller-hooks-contrib-feedstock.mark ]]; then
    if [[ -d pyinstaller-hooks-contrib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyinstaller-hooks-contrib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyinstaller-hooks-contrib-feedstock.mark ) && true) || ( (echo "pyinstaller-hooks-contrib-feedstock" >>failed.24 ) && (echo "pyinstaller-hooks-contrib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyinstaller-hooks-contrib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pylint-venv-feedstock.mark ]]; then
    if [[ -d pylint-venv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pylint-venv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pylint-venv-feedstock.mark ) && true) || ( (echo "pylint-venv-feedstock" >>failed.24 ) && (echo "pylint-venv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pylint-venv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyopengl-feedstock.mark ]]; then
    if [[ -d pyopengl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyopengl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyopengl-feedstock.mark ) && true) || ( (echo "pyopengl-feedstock" >>failed.24 ) && (echo "pyopengl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyopengl-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyproject-metadata-feedstock.mark ]]; then
    if [[ -d pyproject-metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyproject-metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyproject-metadata-feedstock.mark ) && true) || ( (echo "pyproject-metadata-feedstock" >>failed.24 ) && (echo "pyproject-metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyproject-metadata-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyqtgraph-feedstock.mark ]]; then
    if [[ -d pyqtgraph-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyqtgraph-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyqtgraph-feedstock.mark ) && true) || ( (echo "pyqtgraph-feedstock" >>failed.24 ) && (echo "pyqtgraph-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyqtgraph-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyramid_mako-feedstock.mark ]]; then
    if [[ -d pyramid_mako-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyramid_mako-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyramid_mako-feedstock.mark ) && true) || ( (echo "pyramid_mako-feedstock" >>failed.24 ) && (echo "pyramid_mako-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyramid_mako-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-arraydiff-feedstock.mark ]]; then
    if [[ -d pytest-arraydiff-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-arraydiff-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-arraydiff-feedstock.mark ) && true) || ( (echo "pytest-arraydiff-feedstock" >>failed.24 ) && (echo "pytest-arraydiff-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-arraydiff-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-mock-feedstock.mark ]]; then
    if [[ -d pytest-mock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-mock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-mock-feedstock.mark ) && true) || ( (echo "pytest-mock-feedstock" >>failed.24 ) && (echo "pytest-mock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-mock-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-remotedata-feedstock.mark ]]; then
    if [[ -d pytest-remotedata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-remotedata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-remotedata-feedstock.mark ) && true) || ( (echo "pytest-remotedata-feedstock" >>failed.24 ) && (echo "pytest-remotedata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-remotedata-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-daemon-feedstock.mark ]]; then
    if [[ -d python-daemon-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-daemon-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-daemon-feedstock.mark ) && true) || ( (echo "python-daemon-feedstock" >>failed.24 ) && (echo "python-daemon-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-daemon-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-levenshtein-feedstock.mark ]]; then
    if [[ -d python-levenshtein-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-levenshtein-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-levenshtein-feedstock.mark ) && true) || ( (echo "python-levenshtein-feedstock" >>failed.24 ) && (echo "python-levenshtein-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-levenshtein-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-lsp-black-feedstock.mark ]]; then
    if [[ -d python-lsp-black-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-lsp-black-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-lsp-black-feedstock.mark ) && true) || ( (echo "python-lsp-black-feedstock" >>failed.24 ) && (echo "python-lsp-black-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-lsp-black-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python3-openid-feedstock.mark ]]; then
    if [[ -d python3-openid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python3-openid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python3-openid-feedstock.mark ) && true) || ( (echo "python3-openid-feedstock" >>failed.24 ) && (echo "python3-openid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python3-openid-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f qtawesome-feedstock.mark ]]; then
    if [[ -d qtawesome-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./qtawesome-feedstock >d 2>&1 && rm -f d && ( echo "done" >>qtawesome-feedstock.mark ) && true) || ( (echo "qtawesome-feedstock" >>failed.24 ) && (echo "qtawesome-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "qtawesome-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f qtstylizer-feedstock.mark ]]; then
    if [[ -d qtstylizer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./qstylizer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>qtstylizer-feedstock.mark ) && true) || ( (echo "qtstylizer-feedstock" >>failed.24 ) && (echo "qtstylizer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "qtstylizer-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f queuelib-feedstock.mark ]]; then
    if [[ -d queuelib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./queuelib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>queuelib-feedstock.mark ) && true) || ( (echo "queuelib-feedstock" >>failed.24 ) && (echo "queuelib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "queuelib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f regex-feedstock.mark ]]; then
    if [[ -d regex-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./regex-feedstock >d 2>&1 && rm -f d && ( echo "done" >>regex-feedstock.mark ) && true) || ( (echo "regex-feedstock" >>failed.24 ) && (echo "regex-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "regex-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f requests-kerberos-feedstock.mark ]]; then
    if [[ -d requests-kerberos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-kerberos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-kerberos-feedstock.mark ) && true) || ( (echo "requests-kerberos-feedstock" >>failed.24 ) && (echo "requests-kerberos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-kerberos-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f routes-feedstock.mark ]]; then
    if [[ -d routes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./routes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>routes-feedstock.mark ) && true) || ( (echo "routes-feedstock" >>failed.24 ) && (echo "routes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "routes-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f rtree-feedstock.mark ]]; then
    if [[ -d rtree-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./rtree-feedstock >d 2>&1 && rm -f d && ( echo "done" >>rtree-feedstock.mark ) && true) || ( (echo "rtree-feedstock" >>failed.24 ) && (echo "rtree-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "rtree-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ruamel_yaml-feedstock.mark ]]; then
    if [[ -d ruamel_yaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel_yaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel_yaml-feedstock.mark ) && true) || ( (echo "ruamel_yaml-feedstock" >>failed.24 ) && (echo "ruamel_yaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel_yaml-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f seaborn-feedstock.mark ]]; then
    if [[ -d seaborn-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./seaborn-feedstock >d 2>&1 && rm -f d && ( echo "done" >>seaborn-feedstock.mark ) && true) || ( (echo "seaborn-feedstock" >>failed.24 ) && (echo "seaborn-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "seaborn-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f setuptools-git-feedstock.mark ]]; then
    if [[ -d setuptools-git-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-git-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-git-feedstock.mark ) && true) || ( (echo "setuptools-git-feedstock" >>failed.24 ) && (echo "setuptools-git-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-git-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f simplejson-feedstock.mark ]]; then
    if [[ -d simplejson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./simplejson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>simplejson-feedstock.mark ) && true) || ( (echo "simplejson-feedstock" >>failed.24 ) && (echo "simplejson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "simplejson-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f spacy-legacy-feedstock.mark ]]; then
    if [[ -d spacy-legacy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spacy-legacy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spacy-legacy-feedstock.mark ) && true) || ( (echo "spacy-legacy-feedstock" >>failed.24 ) && (echo "spacy-legacy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spacy-legacy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f spyder-kernels-feedstock.mark ]]; then
    if [[ -d spyder-kernels-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spyder-kernels-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spyder-kernels-feedstock.mark ) && true) || ( (echo "spyder-kernels-feedstock" >>failed.24 ) && (echo "spyder-kernels-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spyder-kernels-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f sqlparse-feedstock.mark ]]; then
    if [[ -d sqlparse-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sqlparse-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sqlparse-feedstock.mark ) && true) || ( (echo "sqlparse-feedstock" >>failed.24 ) && (echo "sqlparse-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sqlparse-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f statsmodels-feedstock.mark ]]; then
    if [[ -d statsmodels-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./statsmodels-feedstock >d 2>&1 && rm -f d && ( echo "done" >>statsmodels-feedstock.mark ) && true) || ( (echo "statsmodels-feedstock" >>failed.24 ) && (echo "statsmodels-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "statsmodels-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f sympy-feedstock.mark ]]; then
    if [[ -d sympy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sympy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sympy-feedstock.mark ) && true) || ( (echo "sympy-feedstock" >>failed.24 ) && (echo "sympy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sympy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f thinc-feedstock.mark ]]; then
    if [[ -d thinc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thinc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thinc-feedstock.mark ) && true) || ( (echo "thinc-feedstock" >>failed.24 ) && (echo "thinc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thinc-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f thrift_sasl-feedstock.mark ]]; then
    if [[ -d thrift_sasl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thrift_sasl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thrift_sasl-feedstock.mark ) && true) || ( (echo "thrift_sasl-feedstock" >>failed.24 ) && (echo "thrift_sasl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thrift_sasl-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f thriftpy2-feedstock.mark ]]; then
    if [[ -d thriftpy2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thriftpy2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thriftpy2-feedstock.mark ) && true) || ( (echo "thriftpy2-feedstock" >>failed.24 ) && (echo "thriftpy2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thriftpy2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f traits-feedstock.mark ]]; then
    if [[ -d traits-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./traits-feedstock >d 2>&1 && rm -f d && ( echo "done" >>traits-feedstock.mark ) && true) || ( (echo "traits-feedstock" >>failed.24 ) && (echo "traits-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "traits-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f transaction-feedstock.mark ]]; then
    if [[ -d transaction-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./transaction-feedstock >d 2>&1 && rm -f d && ( echo "done" >>transaction-feedstock.mark ) && true) || ( (echo "transaction-feedstock" >>failed.24 ) && (echo "transaction-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "transaction-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f twisted-feedstock.mark ]]; then
    if [[ -d twisted-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./twisted-feedstock >d 2>&1 && rm -f d && ( echo "done" >>twisted-feedstock.mark ) && true) || ( (echo "twisted-feedstock" >>failed.24 ) && (echo "twisted-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "twisted-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f typeguard-feedstock.mark ]]; then
    if [[ -d typeguard-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typeguard-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typeguard-feedstock.mark ) && true) || ( (echo "typeguard-feedstock" >>failed.24 ) && (echo "typeguard-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typeguard-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f types-pytz-feedstock.mark ]]; then
    if [[ -d types-pytz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./types-pytz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>types-pytz-feedstock.mark ) && true) || ( (echo "types-pytz-feedstock" >>failed.24 ) && (echo "types-pytz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "types-pytz-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f typogrify-feedstock.mark ]]; then
    if [[ -d typogrify-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typogrify-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typogrify-feedstock.mark ) && true) || ( (echo "typogrify-feedstock" >>failed.24 ) && (echo "typogrify-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typogrify-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f uc-micro-py-feedstock.mark ]]; then
    if [[ -d uc-micro-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./uc-micro-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>uc-micro-py-feedstock.mark ) && true) || ( (echo "uc-micro-py-feedstock" >>failed.24 ) && (echo "uc-micro-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "uc-micro-py-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f urwid-feedstock.mark ]]; then
    if [[ -d urwid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./urwid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>urwid-feedstock.mark ) && true) || ( (echo "urwid-feedstock" >>failed.24 ) && (echo "urwid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "urwid-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f visions-feedstock.mark ]]; then
    if [[ -d visions-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./visions-feedstock >d 2>&1 && rm -f d && ( echo "done" >>visions-feedstock.mark ) && true) || ( (echo "visions-feedstock" >>failed.24 ) && (echo "visions-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "visions-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f vispy-feedstock.mark ]]; then
    if [[ -d vispy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./vispy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>vispy-feedstock.mark ) && true) || ( (echo "vispy-feedstock" >>failed.24 ) && (echo "vispy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "vispy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f waf-feedstock.mark ]]; then
    if [[ -d waf-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./waf-feedstock >d 2>&1 && rm -f d && ( echo "done" >>waf-feedstock.mark ) && true) || ( (echo "waf-feedstock" >>failed.24 ) && (echo "waf-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "waf-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f watchdog-feedstock.mark ]]; then
    if [[ -d watchdog-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./watchdog-feedstock >d 2>&1 && rm -f d && ( echo "done" >>watchdog-feedstock.mark ) && true) || ( (echo "watchdog-feedstock" >>failed.24 ) && (echo "watchdog-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "watchdog-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f xarray-feedstock.mark ]]; then
    if [[ -d xarray-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xarray-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xarray-feedstock.mark ) && true) || ( (echo "xarray-feedstock" >>failed.24 ) && (echo "xarray-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xarray-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f xgboost-feedstock.mark ]]; then
    if [[ -d xgboost-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xgboost-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xgboost-feedstock.mark ) && true) || ( (echo "xgboost-feedstock" >>failed.24 ) && (echo "xgboost-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xgboost-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f zarr-feedstock.mark ]]; then
    if [[ -d zarr-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zarr-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zarr-feedstock.mark ) && true) || ( (echo "zarr-feedstock" >>failed.24 ) && (echo "zarr-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zarr-feedstock not present" >>failed.24
    fi
fi

