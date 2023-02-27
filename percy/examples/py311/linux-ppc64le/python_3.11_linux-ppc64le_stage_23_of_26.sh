#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f arrow-cpp-feedstock.mark ]]; then
    if [[ -d arrow-cpp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./arrow-cpp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>arrow-cpp-feedstock.mark ) && true) || ( (echo "arrow-cpp-feedstock" >>failed.23 ) && (echo "arrow-cpp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "arrow-cpp-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f arrow-feedstock.mark ]]; then
    if [[ -d arrow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./arrow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>arrow-feedstock.mark ) && true) || ( (echo "arrow-feedstock" >>failed.23 ) && (echo "arrow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "arrow-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f astroid-feedstock.mark ]]; then
    if [[ -d astroid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./astroid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>astroid-feedstock.mark ) && true) || ( (echo "astroid-feedstock" >>failed.23 ) && (echo "astroid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "astroid-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f bcrypt-feedstock.mark ]]; then
    if [[ -d bcrypt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bcrypt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bcrypt-feedstock.mark ) && true) || ( (echo "bcrypt-feedstock" >>failed.23 ) && (echo "bcrypt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bcrypt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f blinker-feedstock.mark ]]; then
    if [[ -d blinker-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./blinker-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>blinker-feedstock.mark ) && true) || ( (echo "blinker-feedstock" >>failed.23 ) && (echo "blinker-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "blinker-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f bokeh-feedstock.mark ]]; then
    if [[ -d bokeh-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bokeh-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bokeh-feedstock.mark ) && true) || ( (echo "bokeh-feedstock" >>failed.23 ) && (echo "bokeh-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bokeh-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f bokeh-2.4.3-feedstock.mark ]]; then
    if [[ -d bokeh-2.4.3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bokeh-2.4.3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bokeh-2.4.3-feedstock.mark ) && true) || ( (echo "bokeh-2.4.3-feedstock" >>failed.23 ) && (echo "bokeh-2.4.3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bokeh-2.4.3-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f boto3-feedstock.mark ]]; then
    if [[ -d boto3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boto3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boto3-feedstock.mark ) && true) || ( (echo "boto3-feedstock" >>failed.23 ) && (echo "boto3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boto3-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f catalogue-feedstock.mark ]]; then
    if [[ -d catalogue-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./catalogue-feedstock >d 2>&1 && rm -f d && ( echo "done" >>catalogue-feedstock.mark ) && true) || ( (echo "catalogue-feedstock" >>failed.23 ) && (echo "catalogue-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "catalogue-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f cftime-feedstock.mark ]]; then
    if [[ -d cftime-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cftime-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cftime-feedstock.mark ) && true) || ( (echo "cftime-feedstock" >>failed.23 ) && (echo "cftime-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cftime-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f chardet-feedstock.mark ]]; then
    if [[ -d chardet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./chardet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>chardet-feedstock.mark ) && true) || ( (echo "chardet-feedstock" >>failed.23 ) && (echo "chardet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "chardet-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f click-feedstock.mark ]]; then
    if [[ -d click-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-feedstock.mark ) && true) || ( (echo "click-feedstock" >>failed.23 ) && (echo "click-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f conda-package-handling-feedstock.mark ]]; then
    if [[ -d conda-package-handling-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-package-handling-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-package-handling-feedstock.mark ) && true) || ( (echo "conda-package-handling-feedstock" >>failed.23 ) && (echo "conda-package-handling-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-package-handling-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f cymem-feedstock.mark ]]; then
    if [[ -d cymem-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cymem-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cymem-feedstock.mark ) && true) || ( (echo "cymem-feedstock" >>failed.23 ) && (echo "cymem-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cymem-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f dask-core-feedstock.mark ]]; then
    if [[ -d dask-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-core-feedstock.mark ) && true) || ( (echo "dask-core-feedstock" >>failed.23 ) && (echo "dask-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-core-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f dill-feedstock.mark ]]; then
    if [[ -d dill-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dill-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dill-feedstock.mark ) && true) || ( (echo "dill-feedstock" >>failed.23 ) && (echo "dill-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dill-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f dnspython-feedstock.mark ]]; then
    if [[ -d dnspython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dnspython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dnspython-feedstock.mark ) && true) || ( (echo "dnspython-feedstock" >>failed.23 ) && (echo "dnspython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dnspython-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f et_xmlfile-feedstock.mark ]]; then
    if [[ -d et_xmlfile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./et_xmlfile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>et_xmlfile-feedstock.mark ) && true) || ( (echo "et_xmlfile-feedstock" >>failed.23 ) && (echo "et_xmlfile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "et_xmlfile-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f googleapis-common-protos-feedstock.mark ]]; then
    if [[ -d googleapis-common-protos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./googleapis-common-protos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>googleapis-common-protos-feedstock.mark ) && true) || ( (echo "googleapis-common-protos-feedstock" >>failed.23 ) && (echo "googleapis-common-protos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "googleapis-common-protos-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f grpcio-feedstock.mark ]]; then
    if [[ -d grpcio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./grpcio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>grpcio-feedstock.mark ) && true) || ( (echo "grpcio-feedstock" >>failed.23 ) && (echo "grpcio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "grpcio-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f infinity-feedstock.mark ]]; then
    if [[ -d infinity-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./infinity-feedstock >d 2>&1 && rm -f d && ( echo "done" >>infinity-feedstock.mark ) && true) || ( (echo "infinity-feedstock" >>failed.23 ) && (echo "infinity-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "infinity-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f joblib-feedstock.mark ]]; then
    if [[ -d joblib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./joblib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>joblib-feedstock.mark ) && true) || ( (echo "joblib-feedstock" >>failed.23 ) && (echo "joblib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "joblib-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f jupyter_console-feedstock.mark ]]; then
    if [[ -d jupyter_console-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_console-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_console-feedstock.mark ) && true) || ( (echo "jupyter_console-feedstock" >>failed.23 ) && (echo "jupyter_console-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_console-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f kiwisolver-feedstock.mark ]]; then
    if [[ -d kiwisolver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./kiwisolver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>kiwisolver-feedstock.mark ) && true) || ( (echo "kiwisolver-feedstock" >>failed.23 ) && (echo "kiwisolver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "kiwisolver-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f leather-feedstock.mark ]]; then
    if [[ -d leather-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./leather-feedstock >d 2>&1 && rm -f d && ( echo "done" >>leather-feedstock.mark ) && true) || ( (echo "leather-feedstock" >>failed.23 ) && (echo "leather-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "leather-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mako-feedstock.mark ]]; then
    if [[ -d mako-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mako-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mako-feedstock.mark ) && true) || ( (echo "mako-feedstock" >>failed.23 ) && (echo "mako-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mako-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f markdown-feedstock.mark ]]; then
    if [[ -d markdown-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markdown-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markdown-feedstock.mark ) && true) || ( (echo "markdown-feedstock" >>failed.23 ) && (echo "markdown-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markdown-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mccabe-feedstock.mark ]]; then
    if [[ -d mccabe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-feedstock.mark ) && true) || ( (echo "mccabe-feedstock" >>failed.23 ) && (echo "mccabe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mccabe-0.6.1-feedstock.mark ]]; then
    if [[ -d mccabe-0.6.1-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mccabe-0.6.1-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mccabe-0.6.1-feedstock.mark ) && true) || ( (echo "mccabe-0.6.1-feedstock" >>failed.23 ) && (echo "mccabe-0.6.1-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mccabe-0.6.1-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f murmurhash-feedstock.mark ]]; then
    if [[ -d murmurhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./murmurhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>murmurhash-feedstock.mark ) && true) || ( (echo "murmurhash-feedstock" >>failed.23 ) && (echo "murmurhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "murmurhash-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f mypy_extensions-feedstock.mark ]]; then
    if [[ -d mypy_extensions-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mypy_extensions-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mypy_extensions-feedstock.mark ) && true) || ( (echo "mypy_extensions-feedstock" >>failed.23 ) && (echo "mypy_extensions-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mypy_extensions-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f opencv-feedstock.mark ]]; then
    if [[ -d opencv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./opencv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>opencv-feedstock.mark ) && true) || ( (echo "opencv-feedstock" >>failed.23 ) && (echo "opencv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "opencv-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f orderedmultidict-feedstock.mark ]]; then
    if [[ -d orderedmultidict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./orderedmultidict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>orderedmultidict-feedstock.mark ) && true) || ( (echo "orderedmultidict-feedstock" >>failed.23 ) && (echo "orderedmultidict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "orderedmultidict-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f parsedatetime-feedstock.mark ]]; then
    if [[ -d parsedatetime-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./parsedatetime-feedstock >d 2>&1 && rm -f d && ( echo "done" >>parsedatetime-feedstock.mark ) && true) || ( (echo "parsedatetime-feedstock" >>failed.23 ) && (echo "parsedatetime-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "parsedatetime-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pdm-pep517-feedstock.mark ]]; then
    if [[ -d pdm-pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-pep517-feedstock.mark ) && true) || ( (echo "pdm-pep517-feedstock" >>failed.23 ) && (echo "pdm-pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-pep517-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pycodestyle-feedstock.mark ]]; then
    if [[ -d pycodestyle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycodestyle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycodestyle-feedstock.mark ) && true) || ( (echo "pycodestyle-feedstock" >>failed.23 ) && (echo "pycodestyle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycodestyle-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pycosat-feedstock.mark ]]; then
    if [[ -d pycosat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycosat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycosat-feedstock.mark ) && true) || ( (echo "pycosat-feedstock" >>failed.23 ) && (echo "pycosat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycosat-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyct-feedstock.mark ]]; then
    if [[ -d pyct-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyct-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyct-feedstock.mark ) && true) || ( (echo "pyct-feedstock" >>failed.23 ) && (echo "pyct-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyct-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyflakes-feedstock.mark ]]; then
    if [[ -d pyflakes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyflakes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyflakes-feedstock.mark ) && true) || ( (echo "pyflakes-feedstock" >>failed.23 ) && (echo "pyflakes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyflakes-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pyjwt-feedstock.mark ]]; then
    if [[ -d pyjwt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyjwt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyjwt-feedstock.mark ) && true) || ( (echo "pyjwt-feedstock" >>failed.23 ) && (echo "pyjwt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyjwt-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pykerberos-feedstock.mark ]]; then
    if [[ -d pykerberos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pykerberos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pykerberos-feedstock.mark ) && true) || ( (echo "pykerberos-feedstock" >>failed.23 ) && (echo "pykerberos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pykerberos-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f pytimeparse-feedstock.mark ]]; then
    if [[ -d pytimeparse-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytimeparse-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytimeparse-feedstock.mark ) && true) || ( (echo "pytimeparse-feedstock" >>failed.23 ) && (echo "pytimeparse-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytimeparse-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f ruamel.yaml-feedstock.mark ]]; then
    if [[ -d ruamel.yaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel.yaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel.yaml-feedstock.mark ) && true) || ( (echo "ruamel.yaml-feedstock" >>failed.23 ) && (echo "ruamel.yaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel.yaml-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f scipy-feedstock.mark ]]; then
    if [[ -d scipy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scipy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scipy-feedstock.mark ) && true) || ( (echo "scipy-feedstock" >>failed.23 ) && (echo "scipy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scipy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f setuptools_scm_git_archive-feedstock.mark ]]; then
    if [[ -d setuptools_scm_git_archive-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools_scm_git_archive-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools_scm_git_archive-feedstock.mark ) && true) || ( (echo "setuptools_scm_git_archive-feedstock" >>failed.23 ) && (echo "setuptools_scm_git_archive-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools_scm_git_archive-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f sqlalchemy-feedstock.mark ]]; then
    if [[ -d sqlalchemy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sqlalchemy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sqlalchemy-feedstock.mark ) && true) || ( (echo "sqlalchemy-feedstock" >>failed.23 ) && (echo "sqlalchemy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sqlalchemy-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f ujson-feedstock.mark ]]; then
    if [[ -d ujson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ujson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ujson-feedstock.mark ) && true) || ( (echo "ujson-feedstock" >>failed.23 ) && (echo "ujson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ujson-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f werkzeug-feedstock.mark ]]; then
    if [[ -d werkzeug-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./werkzeug-feedstock >d 2>&1 && rm -f d && ( echo "done" >>werkzeug-feedstock.mark ) && true) || ( (echo "werkzeug-feedstock" >>failed.23 ) && (echo "werkzeug-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "werkzeug-feedstock not present" >>failed.23
    fi
fi


if [[ ! -f zict-feedstock.mark ]]; then
    if [[ -d zict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zict-feedstock.mark ) && true) || ( (echo "zict-feedstock" >>failed.23 ) && (echo "zict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zict-feedstock not present" >>failed.23
    fi
fi

