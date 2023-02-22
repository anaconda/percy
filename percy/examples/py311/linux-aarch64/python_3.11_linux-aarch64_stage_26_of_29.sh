#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f altgraph-feedstock.mark ]]; then
    if [[ -d altgraph-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./altgraph-feedstock >d 2>&1 && rm -f d && ( echo "done" >>altgraph-feedstock.mark ) && true) || ( (echo "altgraph-feedstock" >>failed.26 ) && (echo "altgraph-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "altgraph-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f arrow-cpp-feedstock.mark ]]; then
    if [[ -d arrow-cpp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./arrow-cpp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>arrow-cpp-feedstock.mark ) && true) || ( (echo "arrow-cpp-feedstock" >>failed.26 ) && (echo "arrow-cpp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "arrow-cpp-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f arrow-feedstock.mark ]]; then
    if [[ -d arrow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./arrow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>arrow-feedstock.mark ) && true) || ( (echo "arrow-feedstock" >>failed.26 ) && (echo "arrow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "arrow-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f bcrypt-feedstock.mark ]]; then
    if [[ -d bcrypt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bcrypt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bcrypt-feedstock.mark ) && true) || ( (echo "bcrypt-feedstock" >>failed.26 ) && (echo "bcrypt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bcrypt-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f blinker-feedstock.mark ]]; then
    if [[ -d blinker-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./blinker-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>blinker-feedstock.mark ) && true) || ( (echo "blinker-feedstock" >>failed.26 ) && (echo "blinker-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "blinker-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f bokeh-feedstock.mark ]]; then
    if [[ -d bokeh-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bokeh-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bokeh-feedstock.mark ) && true) || ( (echo "bokeh-feedstock" >>failed.26 ) && (echo "bokeh-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bokeh-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f bokeh-2.4.3-feedstock.mark ]]; then
    if [[ -d bokeh-2.4.3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bokeh-2.4.3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bokeh-2.4.3-feedstock.mark ) && true) || ( (echo "bokeh-2.4.3-feedstock" >>failed.26 ) && (echo "bokeh-2.4.3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bokeh-2.4.3-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f boto3-feedstock.mark ]]; then
    if [[ -d boto3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boto3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boto3-feedstock.mark ) && true) || ( (echo "boto3-feedstock" >>failed.26 ) && (echo "boto3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boto3-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f catalogue-feedstock.mark ]]; then
    if [[ -d catalogue-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./catalogue-feedstock >d 2>&1 && rm -f d && ( echo "done" >>catalogue-feedstock.mark ) && true) || ( (echo "catalogue-feedstock" >>failed.26 ) && (echo "catalogue-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "catalogue-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f cftime-feedstock.mark ]]; then
    if [[ -d cftime-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cftime-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cftime-feedstock.mark ) && true) || ( (echo "cftime-feedstock" >>failed.26 ) && (echo "cftime-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cftime-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f chardet-feedstock.mark ]]; then
    if [[ -d chardet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./chardet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>chardet-feedstock.mark ) && true) || ( (echo "chardet-feedstock" >>failed.26 ) && (echo "chardet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "chardet-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f click-feedstock.mark ]]; then
    if [[ -d click-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./click-feedstock >d 2>&1 && rm -f d && ( echo "done" >>click-feedstock.mark ) && true) || ( (echo "click-feedstock" >>failed.26 ) && (echo "click-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "click-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f conda-package-handling-feedstock.mark ]]; then
    if [[ -d conda-package-handling-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-package-handling-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-package-handling-feedstock.mark ) && true) || ( (echo "conda-package-handling-feedstock" >>failed.26 ) && (echo "conda-package-handling-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-package-handling-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f cymem-feedstock.mark ]]; then
    if [[ -d cymem-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cymem-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cymem-feedstock.mark ) && true) || ( (echo "cymem-feedstock" >>failed.26 ) && (echo "cymem-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cymem-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f cytoolz-feedstock.mark ]]; then
    if [[ -d cytoolz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cytoolz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cytoolz-feedstock.mark ) && true) || ( (echo "cytoolz-feedstock" >>failed.26 ) && (echo "cytoolz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cytoolz-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f dask-core-feedstock.mark ]]; then
    if [[ -d dask-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-core-feedstock.mark ) && true) || ( (echo "dask-core-feedstock" >>failed.26 ) && (echo "dask-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-core-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f dnspython-feedstock.mark ]]; then
    if [[ -d dnspython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dnspython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dnspython-feedstock.mark ) && true) || ( (echo "dnspython-feedstock" >>failed.26 ) && (echo "dnspython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dnspython-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f et_xmlfile-feedstock.mark ]]; then
    if [[ -d et_xmlfile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./et_xmlfile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>et_xmlfile-feedstock.mark ) && true) || ( (echo "et_xmlfile-feedstock" >>failed.26 ) && (echo "et_xmlfile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "et_xmlfile-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f fast-histogram-feedstock.mark ]]; then
    if [[ -d fast-histogram-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fast-histogram-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>fast-histogram-feedstock.mark ) && true) || ( (echo "fast-histogram-feedstock" >>failed.26 ) && (echo "fast-histogram-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fast-histogram-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f flake8-feedstock.mark ]]; then
    if [[ -d flake8-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flake8-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flake8-feedstock.mark ) && true) || ( (echo "flake8-feedstock" >>failed.26 ) && (echo "flake8-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flake8-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f googleapis-common-protos-feedstock.mark ]]; then
    if [[ -d googleapis-common-protos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./googleapis-common-protos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>googleapis-common-protos-feedstock.mark ) && true) || ( (echo "googleapis-common-protos-feedstock" >>failed.26 ) && (echo "googleapis-common-protos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "googleapis-common-protos-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f grpcio-feedstock.mark ]]; then
    if [[ -d grpcio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./grpcio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>grpcio-feedstock.mark ) && true) || ( (echo "grpcio-feedstock" >>failed.26 ) && (echo "grpcio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "grpcio-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f imageio-feedstock.mark ]]; then
    if [[ -d imageio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imageio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imageio-feedstock.mark ) && true) || ( (echo "imageio-feedstock" >>failed.26 ) && (echo "imageio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imageio-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f imagesize-feedstock.mark ]]; then
    if [[ -d imagesize-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./imagesize-feedstock >d 2>&1 && rm -f d && ( echo "done" >>imagesize-feedstock.mark ) && true) || ( (echo "imagesize-feedstock" >>failed.26 ) && (echo "imagesize-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "imagesize-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f infinity-feedstock.mark ]]; then
    if [[ -d infinity-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./infinity-feedstock >d 2>&1 && rm -f d && ( echo "done" >>infinity-feedstock.mark ) && true) || ( (echo "infinity-feedstock" >>failed.26 ) && (echo "infinity-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "infinity-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f jaxlib-feedstock.mark ]]; then
    if [[ -d jaxlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jaxlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jaxlib-feedstock.mark ) && true) || ( (echo "jaxlib-feedstock" >>failed.26 ) && (echo "jaxlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jaxlib-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f joblib-feedstock.mark ]]; then
    if [[ -d joblib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./joblib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>joblib-feedstock.mark ) && true) || ( (echo "joblib-feedstock" >>failed.26 ) && (echo "joblib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "joblib-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f jupyter-feedstock.mark ]]; then
    if [[ -d jupyter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter-feedstock.mark ) && true) || ( (echo "jupyter-feedstock" >>failed.26 ) && (echo "jupyter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f leather-feedstock.mark ]]; then
    if [[ -d leather-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./leather-feedstock >d 2>&1 && rm -f d && ( echo "done" >>leather-feedstock.mark ) && true) || ( (echo "leather-feedstock" >>failed.26 ) && (echo "leather-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "leather-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f mako-feedstock.mark ]]; then
    if [[ -d mako-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mako-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mako-feedstock.mark ) && true) || ( (echo "mako-feedstock" >>failed.26 ) && (echo "mako-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mako-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f markdown-feedstock.mark ]]; then
    if [[ -d markdown-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markdown-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markdown-feedstock.mark ) && true) || ( (echo "markdown-feedstock" >>failed.26 ) && (echo "markdown-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markdown-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f murmurhash-feedstock.mark ]]; then
    if [[ -d murmurhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./murmurhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>murmurhash-feedstock.mark ) && true) || ( (echo "murmurhash-feedstock" >>failed.26 ) && (echo "murmurhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "murmurhash-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f mypy_extensions-feedstock.mark ]]; then
    if [[ -d mypy_extensions-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mypy_extensions-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mypy_extensions-feedstock.mark ) && true) || ( (echo "mypy_extensions-feedstock" >>failed.26 ) && (echo "mypy_extensions-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mypy_extensions-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f networkx-feedstock.mark ]]; then
    if [[ -d networkx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./networkx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>networkx-feedstock.mark ) && true) || ( (echo "networkx-feedstock" >>failed.26 ) && (echo "networkx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "networkx-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f onnx-feedstock.mark ]]; then
    if [[ -d onnx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./onnx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>onnx-feedstock.mark ) && true) || ( (echo "onnx-feedstock" >>failed.26 ) && (echo "onnx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "onnx-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f opencv-feedstock.mark ]]; then
    if [[ -d opencv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./opencv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>opencv-feedstock.mark ) && true) || ( (echo "opencv-feedstock" >>failed.26 ) && (echo "opencv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "opencv-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f orderedmultidict-feedstock.mark ]]; then
    if [[ -d orderedmultidict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./orderedmultidict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>orderedmultidict-feedstock.mark ) && true) || ( (echo "orderedmultidict-feedstock" >>failed.26 ) && (echo "orderedmultidict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "orderedmultidict-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f parsedatetime-feedstock.mark ]]; then
    if [[ -d parsedatetime-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./parsedatetime-feedstock >d 2>&1 && rm -f d && ( echo "done" >>parsedatetime-feedstock.mark ) && true) || ( (echo "parsedatetime-feedstock" >>failed.26 ) && (echo "parsedatetime-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "parsedatetime-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pdm-pep517-feedstock.mark ]]; then
    if [[ -d pdm-pep517-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pdm-pep517-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pdm-pep517-feedstock.mark ) && true) || ( (echo "pdm-pep517-feedstock" >>failed.26 ) && (echo "pdm-pep517-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pdm-pep517-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pycosat-feedstock.mark ]]; then
    if [[ -d pycosat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycosat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycosat-feedstock.mark ) && true) || ( (echo "pycosat-feedstock" >>failed.26 ) && (echo "pycosat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycosat-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pyct-feedstock.mark ]]; then
    if [[ -d pyct-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyct-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyct-feedstock.mark ) && true) || ( (echo "pyct-feedstock" >>failed.26 ) && (echo "pyct-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyct-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pydocstyle-feedstock.mark ]]; then
    if [[ -d pydocstyle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydocstyle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydocstyle-feedstock.mark ) && true) || ( (echo "pydocstyle-feedstock" >>failed.26 ) && (echo "pydocstyle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydocstyle-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pyerfa-feedstock.mark ]]; then
    if [[ -d pyerfa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyerfa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyerfa-feedstock.mark ) && true) || ( (echo "pyerfa-feedstock" >>failed.26 ) && (echo "pyerfa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyerfa-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pyinstaller-hooks-contrib-feedstock.mark ]]; then
    if [[ -d pyinstaller-hooks-contrib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyinstaller-hooks-contrib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyinstaller-hooks-contrib-feedstock.mark ) && true) || ( (echo "pyinstaller-hooks-contrib-feedstock" >>failed.26 ) && (echo "pyinstaller-hooks-contrib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyinstaller-hooks-contrib-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pyjwt-feedstock.mark ]]; then
    if [[ -d pyjwt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyjwt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyjwt-feedstock.mark ) && true) || ( (echo "pyjwt-feedstock" >>failed.26 ) && (echo "pyjwt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyjwt-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pylint-feedstock.mark ]]; then
    if [[ -d pylint-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pylint-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pylint-feedstock.mark ) && true) || ( (echo "pylint-feedstock" >>failed.26 ) && (echo "pylint-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pylint-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pytimeparse-feedstock.mark ]]; then
    if [[ -d pytimeparse-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytimeparse-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytimeparse-feedstock.mark ) && true) || ( (echo "pytimeparse-feedstock" >>failed.26 ) && (echo "pytimeparse-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytimeparse-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f pywavelets-feedstock.mark ]]; then
    if [[ -d pywavelets-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pywavelets-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pywavelets-feedstock.mark ) && true) || ( (echo "pywavelets-feedstock" >>failed.26 ) && (echo "pywavelets-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pywavelets-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f rope-feedstock.mark ]]; then
    if [[ -d rope-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./rope-feedstock >d 2>&1 && rm -f d && ( echo "done" >>rope-feedstock.mark ) && true) || ( (echo "rope-feedstock" >>failed.26 ) && (echo "rope-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "rope-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f ruamel.yaml-feedstock.mark ]]; then
    if [[ -d ruamel.yaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ruamel.yaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ruamel.yaml-feedstock.mark ) && true) || ( (echo "ruamel.yaml-feedstock" >>failed.26 ) && (echo "ruamel.yaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ruamel.yaml-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f sqlalchemy-feedstock.mark ]]; then
    if [[ -d sqlalchemy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sqlalchemy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sqlalchemy-feedstock.mark ) && true) || ( (echo "sqlalchemy-feedstock" >>failed.26 ) && (echo "sqlalchemy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sqlalchemy-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f tenacity-feedstock.mark ]]; then
    if [[ -d tenacity-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tenacity-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tenacity-feedstock.mark ) && true) || ( (echo "tenacity-feedstock" >>failed.26 ) && (echo "tenacity-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tenacity-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f waf-feedstock.mark ]]; then
    if [[ -d waf-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./waf-feedstock >d 2>&1 && rm -f d && ( echo "done" >>waf-feedstock.mark ) && true) || ( (echo "waf-feedstock" >>failed.26 ) && (echo "waf-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "waf-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f werkzeug-feedstock.mark ]]; then
    if [[ -d werkzeug-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./werkzeug-feedstock >d 2>&1 && rm -f d && ( echo "done" >>werkzeug-feedstock.mark ) && true) || ( (echo "werkzeug-feedstock" >>failed.26 ) && (echo "werkzeug-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "werkzeug-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f whatthepatch-feedstock.mark ]]; then
    if [[ -d whatthepatch-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./whatthepatch-feedstock >d 2>&1 && rm -f d && ( echo "done" >>whatthepatch-feedstock.mark ) && true) || ( (echo "whatthepatch-feedstock" >>failed.26 ) && (echo "whatthepatch-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "whatthepatch-feedstock not present" >>failed.26
    fi
fi


if [[ ! -f zict-feedstock.mark ]]; then
    if [[ -d zict-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zict-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zict-feedstock.mark ) && true) || ( (echo "zict-feedstock" >>failed.26 ) && (echo "zict-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zict-feedstock not present" >>failed.26
    fi
fi

