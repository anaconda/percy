#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f aiobotocore-feedstock.mark ]]; then
    if [[ -d aiobotocore-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aiobotocore-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aiobotocore-feedstock.mark ) && true) || ( (echo "aiobotocore-feedstock" >>failed.23 ) && (echo "aiobotocore-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aiobotocore-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f anaconda-client-feedstock.mark ]]; then
    if [[ -d anaconda-client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-client-feedstock.mark ) && true) || ( (echo "anaconda-client-feedstock" >>failed.23 ) && (echo "anaconda-client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-client-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f apscheduler-feedstock.mark ]]; then
    if [[ -d apscheduler-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apscheduler-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apscheduler-feedstock.mark ) && true) || ( (echo "apscheduler-feedstock" >>failed.23 ) && (echo "apscheduler-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apscheduler-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f asgiref-feedstock.mark ]]; then
    if [[ -d asgiref-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asgiref-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asgiref-feedstock.mark ) && true) || ( (echo "asgiref-feedstock" >>failed.23 ) && (echo "asgiref-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asgiref-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f autovizwidget-feedstock.mark ]]; then
    if [[ -d autovizwidget-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./autovizwidget-feedstock >d 2>&1 && rm -f d && ( echo "done" >>autovizwidget-feedstock.mark ) && true) || ( (echo "autovizwidget-feedstock" >>failed.23 ) && (echo "autovizwidget-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "autovizwidget-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f bcrypt-feedstock.mark ]]; then
    if [[ -d bcrypt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bcrypt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bcrypt-feedstock.mark ) && true) || ( (echo "bcrypt-feedstock" >>failed.23 ) && (echo "bcrypt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bcrypt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f branca-feedstock.mark ]]; then
    if [[ -d branca-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./branca-feedstock >d 2>&1 && rm -f d && ( echo "done" >>branca-feedstock.mark ) && true) || ( (echo "branca-feedstock" >>failed.23 ) && (echo "branca-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "branca-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f cachelib-feedstock.mark ]]; then
    if [[ -d cachelib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cachelib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cachelib-feedstock.mark ) && true) || ( (echo "cachelib-feedstock" >>failed.23 ) && (echo "cachelib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cachelib-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f catalogue-feedstock.mark ]]; then
    if [[ -d catalogue-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./catalogue-feedstock >d 2>&1 && rm -f d && ( echo "done" >>catalogue-feedstock.mark ) && true) || ( (echo "catalogue-feedstock" >>failed.23 ) && (echo "catalogue-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "catalogue-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f cfgv-feedstock.mark ]]; then
    if [[ -d cfgv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cfgv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cfgv-feedstock.mark ) && true) || ( (echo "cfgv-feedstock" >>failed.23 ) && (echo "cfgv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cfgv-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f click-default-group-feedstock.mark ]]; then
    if [[ -d click-default-group-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-default-group-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-default-group-feedstock.mark ) && true) || ( (echo "click-default-group-feedstock" >>failed.23 ) && (echo "click-default-group-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-default-group-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f conda-build-feedstock.mark ]]; then
    if [[ -d conda-build-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-build-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-build-feedstock.mark ) && true) || ( (echo "conda-build-feedstock" >>failed.23 ) && (echo "conda-build-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-build-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f conda-package-streaming-feedstock.mark ]]; then
    if [[ -d conda-package-streaming-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-package-streaming-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-package-streaming-feedstock.mark ) && true) || ( (echo "conda-package-streaming-feedstock" >>failed.23 ) && (echo "conda-package-streaming-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-package-streaming-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f constantly-feedstock.mark ]]; then
    if [[ -d constantly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./constantly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>constantly-feedstock.mark ) && true) || ( (echo "constantly-feedstock" >>failed.23 ) && (echo "constantly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "constantly-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f contextlib2-feedstock.mark ]]; then
    if [[ -d contextlib2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./contextlib2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>contextlib2-feedstock.mark ) && true) || ( (echo "contextlib2-feedstock" >>failed.23 ) && (echo "contextlib2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "contextlib2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f dask-feedstock.mark ]]; then
    if [[ -d dask-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-feedstock.mark ) && true) || ( (echo "dask-feedstock" >>failed.23 ) && (echo "dask-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f deprecated-feedstock.mark ]]; then
    if [[ -d deprecated-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./deprecated-feedstock >d 2>&1 && rm -f d && ( echo "done" >>deprecated-feedstock.mark ) && true) || ( (echo "deprecated-feedstock" >>failed.23 ) && (echo "deprecated-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "deprecated-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f distconfig3-feedstock.mark ]]; then
    if [[ -d distconfig3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./distconfig3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>distconfig3-feedstock.mark ) && true) || ( (echo "distconfig3-feedstock" >>failed.23 ) && (echo "distconfig3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "distconfig3-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f docopt-feedstock.mark ]]; then
    if [[ -d docopt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docopt-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>docopt-feedstock.mark ) && true) || ( (echo "docopt-feedstock" >>failed.23 ) && (echo "docopt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docopt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f email-validator-feedstock.mark ]]; then
    if [[ -d email-validator-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./email-validator-feedstock >d 2>&1 && rm -f d && ( echo "done" >>email-validator-feedstock.mark ) && true) || ( (echo "email-validator-feedstock" >>failed.23 ) && (echo "email-validator-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "email-validator-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f ensureconda-feedstock.mark ]]; then
    if [[ -d ensureconda-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ensureconda-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ensureconda-feedstock.mark ) && true) || ( (echo "ensureconda-feedstock" >>failed.23 ) && (echo "ensureconda-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ensureconda-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f et_xmlfile-feedstock.mark ]]; then
    if [[ -d et_xmlfile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./et_xmlfile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>et_xmlfile-feedstock.mark ) && true) || ( (echo "et_xmlfile-feedstock" >>failed.23 ) && (echo "et_xmlfile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "et_xmlfile-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f exceptiongroup-feedstock.mark ]]; then
    if [[ -d exceptiongroup-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./exceptiongroup-feedstock >d 2>&1 && rm -f d && ( echo "done" >>exceptiongroup-feedstock.mark ) && true) || ( (echo "exceptiongroup-feedstock" >>failed.23 ) && (echo "exceptiongroup-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "exceptiongroup-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f fastavro-feedstock.mark ]]; then
    if [[ -d fastavro-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastavro-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastavro-feedstock.mark ) && true) || ( (echo "fastavro-feedstock" >>failed.23 ) && (echo "fastavro-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastavro-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f flake8-polyfill-feedstock.mark ]]; then
    if [[ -d flake8-polyfill-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flake8-polyfill-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flake8-polyfill-feedstock.mark ) && true) || ( (echo "flake8-polyfill-feedstock" >>failed.23 ) && (echo "flake8-polyfill-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flake8-polyfill-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f flask-compress-feedstock.mark ]]; then
    if [[ -d flask-compress-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-compress-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-compress-feedstock.mark ) && true) || ( (echo "flask-compress-feedstock" >>failed.23 ) && (echo "flask-compress-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-compress-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f gdb-feedstock.mark ]]; then
    if [[ -d gdb-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gdb-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gdb-feedstock.mark ) && true) || ( (echo "gdb-feedstock" >>failed.23 ) && (echo "gdb-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gdb-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f gmpy2-feedstock.mark ]]; then
    if [[ -d gmpy2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gmpy2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gmpy2-feedstock.mark ) && true) || ( (echo "gmpy2-feedstock" >>failed.23 ) && (echo "gmpy2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gmpy2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f google-cloud-core-feedstock.mark ]]; then
    if [[ -d google-cloud-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-cloud-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-cloud-core-feedstock.mark ) && true) || ( (echo "google-cloud-core-feedstock" >>failed.23 ) && (echo "google-cloud-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-cloud-core-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f google-resumable-media-feedstock.mark ]]; then
    if [[ -d google-resumable-media-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-resumable-media-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-resumable-media-feedstock.mark ) && true) || ( (echo "google-resumable-media-feedstock" >>failed.23 ) && (echo "google-resumable-media-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-resumable-media-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f hatch-requirements-txt-feedstock.mark ]]; then
    if [[ -d hatch-requirements-txt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hatch-requirements-txt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hatch-requirements-txt-feedstock.mark ) && true) || ( (echo "hatch-requirements-txt-feedstock" >>failed.23 ) && (echo "hatch-requirements-txt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hatch-requirements-txt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f humanfriendly-feedstock.mark ]]; then
    if [[ -d humanfriendly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./humanfriendly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>humanfriendly-feedstock.mark ) && true) || ( (echo "humanfriendly-feedstock" >>failed.23 ) && (echo "humanfriendly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "humanfriendly-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f identify-feedstock.mark ]]; then
    if [[ -d identify-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./identify-feedstock >d 2>&1 && rm -f d && ( echo "done" >>identify-feedstock.mark ) && true) || ( (echo "identify-feedstock" >>failed.23 ) && (echo "identify-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "identify-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f imageio-feedstock.mark ]]; then
    if [[ -d imageio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imageio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imageio-feedstock.mark ) && true) || ( (echo "imageio-feedstock" >>failed.23 ) && (echo "imageio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imageio-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f js2py-feedstock.mark ]]; then
    if [[ -d js2py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./js2py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>js2py-feedstock.mark ) && true) || ( (echo "js2py-feedstock" >>failed.23 ) && (echo "js2py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "js2py-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f libmambapy-feedstock.mark ]]; then
    if [[ -d libmambapy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./libmambapy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>libmambapy-feedstock.mark ) && true) || ( (echo "libmambapy-feedstock" >>failed.23 ) && (echo "libmambapy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "libmambapy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f license-expression-feedstock.mark ]]; then
    if [[ -d license-expression-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./license-expression-feedstock >d 2>&1 && rm -f d && ( echo "done" >>license-expression-feedstock.mark ) && true) || ( (echo "license-expression-feedstock" >>failed.23 ) && (echo "license-expression-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "license-expression-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f linecache2-feedstock.mark ]]; then
    if [[ -d linecache2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./linecache2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>linecache2-feedstock.mark ) && true) || ( (echo "linecache2-feedstock" >>failed.23 ) && (echo "linecache2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "linecache2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f markdown-it-py-feedstock.mark ]]; then
    if [[ -d markdown-it-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markdown-it-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markdown-it-py-feedstock.mark ) && true) || ( (echo "markdown-it-py-feedstock" >>failed.23 ) && (echo "markdown-it-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markdown-it-py-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mpmath-feedstock.mark ]]; then
    if [[ -d mpmath-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mpmath-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mpmath-feedstock.mark ) && true) || ( (echo "mpmath-feedstock" >>failed.23 ) && (echo "mpmath-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mpmath-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f multipledispatch-feedstock.mark ]]; then
    if [[ -d multipledispatch-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multipledispatch-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multipledispatch-feedstock.mark ) && true) || ( (echo "multipledispatch-feedstock" >>failed.23 ) && (echo "multipledispatch-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multipledispatch-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f nodeenv-feedstock.mark ]]; then
    if [[ -d nodeenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nodeenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nodeenv-feedstock.mark ) && true) || ( (echo "nodeenv-feedstock" >>failed.23 ) && (echo "nodeenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nodeenv-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pdm-feedstock.mark ]]; then
    if [[ -d pdm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-feedstock.mark ) && true) || ( (echo "pdm-feedstock" >>failed.23 ) && (echo "pdm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f phik-feedstock.mark ]]; then
    if [[ -d phik-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./phik-feedstock >d 2>&1 && rm -f d && ( echo "done" >>phik-feedstock.mark ) && true) || ( (echo "phik-feedstock" >>failed.23 ) && (echo "phik-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "phik-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f prettytable-feedstock.mark ]]; then
    if [[ -d prettytable-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prettytable-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prettytable-feedstock.mark ) && true) || ( (echo "prettytable-feedstock" >>failed.23 ) && (echo "prettytable-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prettytable-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f psycopg2-feedstock.mark ]]; then
    if [[ -d psycopg2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./psycopg2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>psycopg2-feedstock.mark ) && true) || ( (echo "psycopg2-feedstock" >>failed.23 ) && (echo "psycopg2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "psycopg2-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyct-feedstock.mark ]]; then
    if [[ -d pyct-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyct-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyct-feedstock.mark ) && true) || ( (echo "pyct-feedstock" >>failed.23 ) && (echo "pyct-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyct-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pydantic-feedstock.mark ]]; then
    if [[ -d pydantic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydantic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydantic-feedstock.mark ) && true) || ( (echo "pydantic-feedstock" >>failed.23 ) && (echo "pydantic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydantic-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyerfa-feedstock.mark ]]; then
    if [[ -d pyerfa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyerfa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyerfa-feedstock.mark ) && true) || ( (echo "pyerfa-feedstock" >>failed.23 ) && (echo "pyerfa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyerfa-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyproject-metadata-feedstock.mark ]]; then
    if [[ -d pyproject-metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyproject-metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyproject-metadata-feedstock.mark ) && true) || ( (echo "pyproject-metadata-feedstock" >>failed.23 ) && (echo "pyproject-metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyproject-metadata-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pytest-arraydiff-feedstock.mark ]]; then
    if [[ -d pytest-arraydiff-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-arraydiff-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-arraydiff-feedstock.mark ) && true) || ( (echo "pytest-arraydiff-feedstock" >>failed.23 ) && (echo "pytest-arraydiff-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-arraydiff-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pytest-mock-feedstock.mark ]]; then
    if [[ -d pytest-mock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-mock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-mock-feedstock.mark ) && true) || ( (echo "pytest-mock-feedstock" >>failed.23 ) && (echo "pytest-mock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-mock-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pytest-remotedata-feedstock.mark ]]; then
    if [[ -d pytest-remotedata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-remotedata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-remotedata-feedstock.mark ) && true) || ( (echo "pytest-remotedata-feedstock" >>failed.23 ) && (echo "pytest-remotedata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-remotedata-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f python-lsp-server-feedstock.mark ]]; then
    if [[ -d python-lsp-server-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-lsp-server-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-lsp-server-feedstock.mark ) && true) || ( (echo "python-lsp-server-feedstock" >>failed.23 ) && (echo "python-lsp-server-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-lsp-server-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f python3-openid-feedstock.mark ]]; then
    if [[ -d python3-openid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python3-openid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python3-openid-feedstock.mark ) && true) || ( (echo "python3-openid-feedstock" >>failed.23 ) && (echo "python3-openid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python3-openid-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f regex-feedstock.mark ]]; then
    if [[ -d regex-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./regex-feedstock >d 2>&1 && rm -f d && ( echo "done" >>regex-feedstock.mark ) && true) || ( (echo "regex-feedstock" >>failed.23 ) && (echo "regex-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "regex-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f requests-kerberos-feedstock.mark ]]; then
    if [[ -d requests-kerberos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-kerberos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-kerberos-feedstock.mark ) && true) || ( (echo "requests-kerberos-feedstock" >>failed.23 ) && (echo "requests-kerberos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-kerberos-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f ruamel_yaml-feedstock.mark ]]; then
    if [[ -d ruamel_yaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel_yaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel_yaml-feedstock.mark ) && true) || ( (echo "ruamel_yaml-feedstock" >>failed.23 ) && (echo "ruamel_yaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel_yaml-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f s3transfer-feedstock.mark ]]; then
    if [[ -d s3transfer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./s3transfer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>s3transfer-feedstock.mark ) && true) || ( (echo "s3transfer-feedstock" >>failed.23 ) && (echo "s3transfer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "s3transfer-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f seaborn-feedstock.mark ]]; then
    if [[ -d seaborn-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./seaborn-feedstock >d 2>&1 && rm -f d && ( echo "done" >>seaborn-feedstock.mark ) && true) || ( (echo "seaborn-feedstock" >>failed.23 ) && (echo "seaborn-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "seaborn-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f setuptools-git-feedstock.mark ]]; then
    if [[ -d setuptools-git-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-git-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-git-feedstock.mark ) && true) || ( (echo "setuptools-git-feedstock" >>failed.23 ) && (echo "setuptools-git-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-git-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sip-feedstock.mark ]]; then
    if [[ -d sip-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sip-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sip-feedstock.mark ) && true) || ( (echo "sip-feedstock" >>failed.23 ) && (echo "sip-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sip-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f skl2onnx-feedstock.mark ]]; then
    if [[ -d skl2onnx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./skl2onnx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>skl2onnx-feedstock.mark ) && true) || ( (echo "skl2onnx-feedstock" >>failed.23 ) && (echo "skl2onnx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "skl2onnx-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sphinx-feedstock.mark ]]; then
    if [[ -d sphinx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sphinx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sphinx-feedstock.mark ) && true) || ( (echo "sphinx-feedstock" >>failed.23 ) && (echo "sphinx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sphinx-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sqlalchemy-feedstock.mark ]]; then
    if [[ -d sqlalchemy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sqlalchemy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sqlalchemy-feedstock.mark ) && true) || ( (echo "sqlalchemy-feedstock" >>failed.23 ) && (echo "sqlalchemy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sqlalchemy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sqlparse-feedstock.mark ]]; then
    if [[ -d sqlparse-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sqlparse-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sqlparse-feedstock.mark ) && true) || ( (echo "sqlparse-feedstock" >>failed.23 ) && (echo "sqlparse-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sqlparse-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f statsmodels-feedstock.mark ]]; then
    if [[ -d statsmodels-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./statsmodels-feedstock >d 2>&1 && rm -f d && ( echo "done" >>statsmodels-feedstock.mark ) && true) || ( (echo "statsmodels-feedstock" >>failed.23 ) && (echo "statsmodels-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "statsmodels-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f theano-pymc-feedstock.mark ]]; then
    if [[ -d theano-pymc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./theano-pymc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>theano-pymc-feedstock.mark ) && true) || ( (echo "theano-pymc-feedstock" >>failed.23 ) && (echo "theano-pymc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "theano-pymc-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f traits-feedstock.mark ]]; then
    if [[ -d traits-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./traits-feedstock >d 2>&1 && rm -f d && ( echo "done" >>traits-feedstock.mark ) && true) || ( (echo "traits-feedstock" >>failed.23 ) && (echo "traits-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "traits-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f typeguard-feedstock.mark ]]; then
    if [[ -d typeguard-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typeguard-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typeguard-feedstock.mark ) && true) || ( (echo "typeguard-feedstock" >>failed.23 ) && (echo "typeguard-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typeguard-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f uc-micro-py-feedstock.mark ]]; then
    if [[ -d uc-micro-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./uc-micro-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>uc-micro-py-feedstock.mark ) && true) || ( (echo "uc-micro-py-feedstock" >>failed.23 ) && (echo "uc-micro-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "uc-micro-py-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f virtualenv-clone-feedstock.mark ]]; then
    if [[ -d virtualenv-clone-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./virtualenv-clone-feedstock >d 2>&1 && rm -f d && ( echo "done" >>virtualenv-clone-feedstock.mark ) && true) || ( (echo "virtualenv-clone-feedstock" >>failed.23 ) && (echo "virtualenv-clone-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "virtualenv-clone-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f visions-feedstock.mark ]]; then
    if [[ -d visions-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./visions-feedstock >d 2>&1 && rm -f d && ( echo "done" >>visions-feedstock.mark ) && true) || ( (echo "visions-feedstock" >>failed.23 ) && (echo "visions-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "visions-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f watchdog-feedstock.mark ]]; then
    if [[ -d watchdog-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./watchdog-feedstock >d 2>&1 && rm -f d && ( echo "done" >>watchdog-feedstock.mark ) && true) || ( (echo "watchdog-feedstock" >>failed.23 ) && (echo "watchdog-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "watchdog-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f wurlitzer-feedstock.mark ]]; then
    if [[ -d wurlitzer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wurlitzer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wurlitzer-feedstock.mark ) && true) || ( (echo "wurlitzer-feedstock" >>failed.23 ) && (echo "wurlitzer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wurlitzer-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f xgboost-feedstock.mark ]]; then
    if [[ -d xgboost-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xgboost-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xgboost-feedstock.mark ) && true) || ( (echo "xgboost-feedstock" >>failed.23 ) && (echo "xgboost-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xgboost-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f zope.interface-feedstock.mark ]]; then
    if [[ -d zope.interface-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zope.interface-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zope.interface-feedstock.mark ) && true) || ( (echo "zope.interface-feedstock" >>failed.23 ) && (echo "zope.interface-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zope.interface-feedstock not present" >>failed.23
    fi
fi

