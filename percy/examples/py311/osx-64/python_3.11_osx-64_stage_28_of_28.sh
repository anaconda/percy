#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f aenum-feedstock.mark ]]; then
    if [[ -d aenum-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aenum-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aenum-feedstock.mark ) && true) || ( (echo "aenum-feedstock" >>failed.28 ) && (echo "aenum-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aenum-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f aiopg-feedstock.mark ]]; then
    if [[ -d aiopg-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aiopg-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aiopg-feedstock.mark ) && true) || ( (echo "aiopg-feedstock" >>failed.28 ) && (echo "aiopg-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aiopg-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f anaconda-clean-feedstock.mark ]]; then
    if [[ -d anaconda-clean-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-clean-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-clean-feedstock.mark ) && true) || ( (echo "anaconda-clean-feedstock" >>failed.28 ) && (echo "anaconda-clean-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-clean-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f anaconda-linter-feedstock.mark ]]; then
    if [[ -d anaconda-linter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-linter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-linter-feedstock.mark ) && true) || ( (echo "anaconda-linter-feedstock" >>failed.28 ) && (echo "anaconda-linter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-linter-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f anaconda-project-feedstock.mark ]]; then
    if [[ -d anaconda-project-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-project-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-project-feedstock.mark ) && true) || ( (echo "anaconda-project-feedstock" >>failed.28 ) && (echo "anaconda-project-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-project-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f apache-airflow-providers-apache-hdfs-feedstock.mark ]]; then
    if [[ -d apache-airflow-providers-apache-hdfs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-airflow-providers-apache-hdfs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-airflow-providers-apache-hdfs-feedstock.mark ) && true) || ( (echo "apache-airflow-providers-apache-hdfs-feedstock" >>failed.28 ) && (echo "apache-airflow-providers-apache-hdfs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-airflow-providers-apache-hdfs-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f apache-libcloud-feedstock.mark ]]; then
    if [[ -d apache-libcloud-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-libcloud-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-libcloud-feedstock.mark ) && true) || ( (echo "apache-libcloud-feedstock" >>failed.28 ) && (echo "apache-libcloud-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-libcloud-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f apipkg-feedstock.mark ]]; then
    if [[ -d apipkg-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apipkg-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apipkg-feedstock.mark ) && true) || ( (echo "apipkg-feedstock" >>failed.28 ) && (echo "apipkg-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apipkg-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f argh-feedstock.mark ]]; then
    if [[ -d argh-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./argh-feedstock >d 2>&1 && rm -f d && ( echo "done" >>argh-feedstock.mark ) && true) || ( (echo "argh-feedstock" >>failed.28 ) && (echo "argh-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "argh-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f astor-feedstock.mark ]]; then
    if [[ -d astor-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./astor-feedstock >d 2>&1 && rm -f d && ( echo "done" >>astor-feedstock.mark ) && true) || ( (echo "astor-feedstock" >>failed.28 ) && (echo "astor-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "astor-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f asyncpgsa-feedstock.mark ]]; then
    if [[ -d asyncpgsa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asyncpgsa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asyncpgsa-feedstock.mark ) && true) || ( (echo "asyncpgsa-feedstock" >>failed.28 ) && (echo "asyncpgsa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asyncpgsa-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f atlasclient-feedstock.mark ]]; then
    if [[ -d atlasclient-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./atlasclient-feedstock >d 2>&1 && rm -f d && ( echo "done" >>atlasclient-feedstock.mark ) && true) || ( (echo "atlasclient-feedstock" >>failed.28 ) && (echo "atlasclient-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "atlasclient-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f authlib-feedstock.mark ]]; then
    if [[ -d authlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./authlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>authlib-feedstock.mark ) && true) || ( (echo "authlib-feedstock" >>failed.28 ) && (echo "authlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "authlib-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f backports.os-feedstock.mark ]]; then
    if [[ -d backports.os-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./backports.os-feedstock >d 2>&1 && rm -f d && ( echo "done" >>backports.os-feedstock.mark ) && true) || ( (echo "backports.os-feedstock" >>failed.28 ) && (echo "backports.os-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "backports.os-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f backports.shutil_which-feedstock.mark ]]; then
    if [[ -d backports.shutil_which-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./backports.shutil_which-feedstock >d 2>&1 && rm -f d && ( echo "done" >>backports.shutil_which-feedstock.mark ) && true) || ( (echo "backports.shutil_which-feedstock" >>failed.28 ) && (echo "backports.shutil_which-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "backports.shutil_which-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f backports.weakref-feedstock.mark ]]; then
    if [[ -d backports.weakref-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./backports.weakref-feedstock >d 2>&1 && rm -f d && ( echo "done" >>backports.weakref-feedstock.mark ) && true) || ( (echo "backports.weakref-feedstock" >>failed.28 ) && (echo "backports.weakref-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "backports.weakref-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f backports_abc-feedstock.mark ]]; then
    if [[ -d backports_abc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./backports_abc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>backports_abc-feedstock.mark ) && true) || ( (echo "backports_abc-feedstock" >>failed.28 ) && (echo "backports_abc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "backports_abc-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f bcj-cffi-feedstock.mark ]]; then
    if [[ -d bcj-cffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bcj-cffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bcj-cffi-feedstock.mark ) && true) || ( (echo "bcj-cffi-feedstock" >>failed.28 ) && (echo "bcj-cffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bcj-cffi-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f billiard-feedstock.mark ]]; then
    if [[ -d billiard-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./billiard-feedstock >d 2>&1 && rm -f d && ( echo "done" >>billiard-feedstock.mark ) && true) || ( (echo "billiard-feedstock" >>failed.28 ) && (echo "billiard-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "billiard-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f biopython-feedstock.mark ]]; then
    if [[ -d biopython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./biopython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>biopython-feedstock.mark ) && true) || ( (echo "biopython-feedstock" >>failed.28 ) && (echo "biopython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "biopython-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f bkcharts-feedstock.mark ]]; then
    if [[ -d bkcharts-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bkcharts-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bkcharts-feedstock.mark ) && true) || ( (echo "bkcharts-feedstock" >>failed.28 ) && (echo "bkcharts-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bkcharts-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f boltons-feedstock.mark ]]; then
    if [[ -d boltons-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boltons-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boltons-feedstock.mark ) && true) || ( (echo "boltons-feedstock" >>failed.28 ) && (echo "boltons-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boltons-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f bpython-feedstock.mark ]]; then
    if [[ -d bpython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bpython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bpython-feedstock.mark ) && true) || ( (echo "bpython-feedstock" >>failed.28 ) && (echo "bpython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bpython-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f brotlicffi-feedstock.mark ]]; then
    if [[ -d brotlicffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./brotlicffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>brotlicffi-feedstock.mark ) && true) || ( (echo "brotlicffi-feedstock" >>failed.28 ) && (echo "brotlicffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "brotlicffi-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f capturer-feedstock.mark ]]; then
    if [[ -d capturer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./capturer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>capturer-feedstock.mark ) && true) || ( (echo "capturer-feedstock" >>failed.28 ) && (echo "capturer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "capturer-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f cassandra-driver-feedstock.mark ]]; then
    if [[ -d cassandra-driver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cassandra-driver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cassandra-driver-feedstock.mark ) && true) || ( (echo "cassandra-driver-feedstock" >>failed.28 ) && (echo "cassandra-driver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cassandra-driver-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f category_encoders-feedstock.mark ]]; then
    if [[ -d category_encoders-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./category_encoders-feedstock >d 2>&1 && rm -f d && ( echo "done" >>category_encoders-feedstock.mark ) && true) || ( (echo "category_encoders-feedstock" >>failed.28 ) && (echo "category_encoders-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "category_encoders-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f cgroupspy-feedstock.mark ]]; then
    if [[ -d cgroupspy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cgroupspy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cgroupspy-feedstock.mark ) && true) || ( (echo "cgroupspy-feedstock" >>failed.28 ) && (echo "cgroupspy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cgroupspy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f chai-feedstock.mark ]]; then
    if [[ -d chai-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./chai-feedstock >d 2>&1 && rm -f d && ( echo "done" >>chai-feedstock.mark ) && true) || ( (echo "chai-feedstock" >>failed.28 ) && (echo "chai-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "chai-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f cherrypy-feedstock.mark ]]; then
    if [[ -d cherrypy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cherrypy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cherrypy-feedstock.mark ) && true) || ( (echo "cherrypy-feedstock" >>failed.28 ) && (echo "cherrypy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cherrypy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f clangdev-feedstock.mark ]]; then
    if [[ -d clangdev-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clangdev-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clangdev-feedstock.mark ) && true) || ( (echo "clangdev-feedstock" >>failed.28 ) && (echo "clangdev-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clangdev-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f clickhouse-cityhash-feedstock.mark ]]; then
    if [[ -d clickhouse-cityhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clickhouse-cityhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clickhouse-cityhash-feedstock.mark ) && true) || ( (echo "clickhouse-cityhash-feedstock" >>failed.28 ) && (echo "clickhouse-cityhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clickhouse-cityhash-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f clickhouse-driver-feedstock.mark ]]; then
    if [[ -d clickhouse-driver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clickhouse-driver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clickhouse-driver-feedstock.mark ) && true) || ( (echo "clickhouse-driver-feedstock" >>failed.28 ) && (echo "clickhouse-driver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clickhouse-driver-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f comm-feedstock.mark ]]; then
    if [[ -d comm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./comm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>comm-feedstock.mark ) && true) || ( (echo "comm-feedstock" >>failed.28 ) && (echo "comm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "comm-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f conda-content-trust-feedstock.mark ]]; then
    if [[ -d conda-content-trust-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-content-trust-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-content-trust-feedstock.mark ) && true) || ( (echo "conda-content-trust-feedstock" >>failed.28 ) && (echo "conda-content-trust-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-content-trust-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f conda-index-feedstock.mark ]]; then
    if [[ -d conda-index-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-index-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-index-feedstock.mark ) && true) || ( (echo "conda-index-feedstock" >>failed.28 ) && (echo "conda-index-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-index-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f conda-libmamba-solver-feedstock.mark ]]; then
    if [[ -d conda-libmamba-solver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-libmamba-solver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-libmamba-solver-feedstock.mark ) && true) || ( (echo "conda-libmamba-solver-feedstock" >>failed.28 ) && (echo "conda-libmamba-solver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-libmamba-solver-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f conda-lock-feedstock.mark ]]; then
    if [[ -d conda-lock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-lock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-lock-feedstock.mark ) && true) || ( (echo "conda-lock-feedstock" >>failed.28 ) && (echo "conda-lock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-lock-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f configspace-feedstock.mark ]]; then
    if [[ -d configspace-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./configspace-feedstock >d 2>&1 && rm -f d && ( echo "done" >>configspace-feedstock.mark ) && true) || ( (echo "configspace-feedstock" >>failed.28 ) && (echo "configspace-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "configspace-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f constructor-feedstock.mark ]]; then
    if [[ -d constructor-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./constructor-feedstock >d 2>&1 && rm -f d && ( echo "done" >>constructor-feedstock.mark ) && true) || ( (echo "constructor-feedstock" >>failed.28 ) && (echo "constructor-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "constructor-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f coveralls-feedstock.mark ]]; then
    if [[ -d coveralls-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./coveralls-feedstock >d 2>&1 && rm -f d && ( echo "done" >>coveralls-feedstock.mark ) && true) || ( (echo "coveralls-feedstock" >>failed.28 ) && (echo "coveralls-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "coveralls-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f cryptography-vectors-feedstock.mark ]]; then
    if [[ -d cryptography-vectors-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cryptography-vectors-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cryptography-vectors-feedstock.mark ) && true) || ( (echo "cryptography-vectors-feedstock" >>failed.28 ) && (echo "cryptography-vectors-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cryptography-vectors-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f cryptominisat-feedstock.mark ]]; then
    if [[ -d cryptominisat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cryptominisat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cryptominisat-feedstock.mark ) && true) || ( (echo "cryptominisat-feedstock" >>failed.28 ) && (echo "cryptominisat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cryptominisat-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f csvkit-feedstock.mark ]]; then
    if [[ -d csvkit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./csvkit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>csvkit-feedstock.mark ) && true) || ( (echo "csvkit-feedstock" >>failed.28 ) && (echo "csvkit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "csvkit-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f cvxopt-feedstock.mark ]]; then
    if [[ -d cvxopt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cvxopt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cvxopt-feedstock.mark ) && true) || ( (echo "cvxopt-feedstock" >>failed.28 ) && (echo "cvxopt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cvxopt-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f cx_oracle-feedstock.mark ]]; then
    if [[ -d cx_oracle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cx_oracle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cx_oracle-feedstock.mark ) && true) || ( (echo "cx_oracle-feedstock" >>failed.28 ) && (echo "cx_oracle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cx_oracle-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f dash-feedstock.mark ]]; then
    if [[ -d dash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dash-feedstock.mark ) && true) || ( (echo "dash-feedstock" >>failed.28 ) && (echo "dash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dash-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f dask-glm-feedstock.mark ]]; then
    if [[ -d dask-glm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-glm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-glm-feedstock.mark ) && true) || ( (echo "dask-glm-feedstock" >>failed.28 ) && (echo "dask-glm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-glm-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f dask-searchcv-feedstock.mark ]]; then
    if [[ -d dask-searchcv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-searchcv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-searchcv-feedstock.mark ) && true) || ( (echo "dask-searchcv-feedstock" >>failed.28 ) && (echo "dask-searchcv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-searchcv-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f dateparser-feedstock.mark ]]; then
    if [[ -d dateparser-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dateparser-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dateparser-feedstock.mark ) && true) || ( (echo "dateparser-feedstock" >>failed.28 ) && (echo "dateparser-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dateparser-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f datrie-feedstock.mark ]]; then
    if [[ -d datrie-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./datrie-feedstock >d 2>&1 && rm -f d && ( echo "done" >>datrie-feedstock.mark ) && true) || ( (echo "datrie-feedstock" >>failed.28 ) && (echo "datrie-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "datrie-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f dicttoxml-feedstock.mark ]]; then
    if [[ -d dicttoxml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dicttoxml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dicttoxml-feedstock.mark ) && true) || ( (echo "dicttoxml-feedstock" >>failed.28 ) && (echo "dicttoxml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dicttoxml-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f django-feedstock.mark ]]; then
    if [[ -d django-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./django-feedstock >d 2>&1 && rm -f d && ( echo "done" >>django-feedstock.mark ) && true) || ( (echo "django-feedstock" >>failed.28 ) && (echo "django-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "django-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f docstring-to-markdown-feedstock.mark ]]; then
    if [[ -d docstring-to-markdown-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docstring-to-markdown-feedstock >d 2>&1 && rm -f d && ( echo "done" >>docstring-to-markdown-feedstock.mark ) && true) || ( (echo "docstring-to-markdown-feedstock" >>failed.28 ) && (echo "docstring-to-markdown-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docstring-to-markdown-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f doit-feedstock.mark ]]; then
    if [[ -d doit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./doit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>doit-feedstock.mark ) && true) || ( (echo "doit-feedstock" >>failed.28 ) && (echo "doit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "doit-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f drmaa-feedstock.mark ]]; then
    if [[ -d drmaa-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./drmaa-feedstock >d 2>&1 && rm -f d && ( echo "done" >>drmaa-feedstock.mark ) && true) || ( (echo "drmaa-feedstock" >>failed.28 ) && (echo "drmaa-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "drmaa-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ecos-feedstock.mark ]]; then
    if [[ -d ecos-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ecos-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ecos-feedstock.mark ) && true) || ( (echo "ecos-feedstock" >>failed.28 ) && (echo "ecos-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ecos-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f editdistance-feedstock.mark ]]; then
    if [[ -d editdistance-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./editdistance-feedstock >d 2>&1 && rm -f d && ( echo "done" >>editdistance-feedstock.mark ) && true) || ( (echo "editdistance-feedstock" >>failed.28 ) && (echo "editdistance-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "editdistance-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f elasticsearch-async-feedstock.mark ]]; then
    if [[ -d elasticsearch-async-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./elasticsearch-async-feedstock >d 2>&1 && rm -f d && ( echo "done" >>elasticsearch-async-feedstock.mark ) && true) || ( (echo "elasticsearch-async-feedstock" >>failed.28 ) && (echo "elasticsearch-async-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "elasticsearch-async-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f elasticsearch-dsl-feedstock.mark ]]; then
    if [[ -d elasticsearch-dsl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./elasticsearch-dsl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>elasticsearch-dsl-feedstock.mark ) && true) || ( (echo "elasticsearch-dsl-feedstock" >>failed.28 ) && (echo "elasticsearch-dsl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "elasticsearch-dsl-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f enaml-feedstock.mark ]]; then
    if [[ -d enaml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./enaml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>enaml-feedstock.mark ) && true) || ( (echo "enaml-feedstock" >>failed.28 ) && (echo "enaml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "enaml-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f enum34-feedstock.mark ]]; then
    if [[ -d enum34-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./enum34-feedstock >d 2>&1 && rm -f d && ( echo "done" >>enum34-feedstock.mark ) && true) || ( (echo "enum34-feedstock" >>failed.28 ) && (echo "enum34-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "enum34-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ephem-feedstock.mark ]]; then
    if [[ -d ephem-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ephem-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ephem-feedstock.mark ) && true) || ( (echo "ephem-feedstock" >>failed.28 ) && (echo "ephem-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ephem-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f evaluate-feedstock.mark ]]; then
    if [[ -d evaluate-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./evaluate-feedstock >d 2>&1 && rm -f d && ( echo "done" >>evaluate-feedstock.mark ) && true) || ( (echo "evaluate-feedstock" >>failed.28 ) && (echo "evaluate-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "evaluate-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f eventlet-feedstock.mark ]]; then
    if [[ -d eventlet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./eventlet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>eventlet-feedstock.mark ) && true) || ( (echo "eventlet-feedstock" >>failed.28 ) && (echo "eventlet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "eventlet-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f fabric-feedstock.mark ]]; then
    if [[ -d fabric-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fabric-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fabric-feedstock.mark ) && true) || ( (echo "fabric-feedstock" >>failed.28 ) && (echo "fabric-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fabric-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f fabric3-feedstock.mark ]]; then
    if [[ -d fabric3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fabric3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fabric3-feedstock.mark ) && true) || ( (echo "fabric3-feedstock" >>failed.28 ) && (echo "fabric3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fabric3-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f factory_boy-feedstock.mark ]]; then
    if [[ -d factory_boy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./factory_boy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>factory_boy-feedstock.mark ) && true) || ( (echo "factory_boy-feedstock" >>failed.28 ) && (echo "factory_boy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "factory_boy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f fastcache-feedstock.mark ]]; then
    if [[ -d fastcache-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastcache-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastcache-feedstock.mark ) && true) || ( (echo "fastcache-feedstock" >>failed.28 ) && (echo "fastcache-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastcache-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f fastcluster-feedstock.mark ]]; then
    if [[ -d fastcluster-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastcluster-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastcluster-feedstock.mark ) && true) || ( (echo "fastcluster-feedstock" >>failed.28 ) && (echo "fastcluster-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastcluster-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f fastrlock-feedstock.mark ]]; then
    if [[ -d fastrlock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastrlock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastrlock-feedstock.mark ) && true) || ( (echo "fastrlock-feedstock" >>failed.28 ) && (echo "fastrlock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastrlock-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f fiona-feedstock.mark ]]; then
    if [[ -d fiona-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fiona-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fiona-feedstock.mark ) && true) || ( (echo "fiona-feedstock" >>failed.28 ) && (echo "fiona-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fiona-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flake8-import-order-feedstock.mark ]]; then
    if [[ -d flake8-import-order-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flake8-import-order-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flake8-import-order-feedstock.mark ) && true) || ( (echo "flake8-import-order-feedstock" >>failed.28 ) && (echo "flake8-import-order-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flake8-import-order-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flask-admin-feedstock.mark ]]; then
    if [[ -d flask-admin-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-admin-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-admin-feedstock.mark ) && true) || ( (echo "flask-admin-feedstock" >>failed.28 ) && (echo "flask-admin-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-admin-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flask-apscheduler-feedstock.mark ]]; then
    if [[ -d flask-apscheduler-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-apscheduler-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-apscheduler-feedstock.mark ) && true) || ( (echo "flask-apscheduler-feedstock" >>failed.28 ) && (echo "flask-apscheduler-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-apscheduler-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flask-bcrypt-feedstock.mark ]]; then
    if [[ -d flask-bcrypt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-bcrypt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-bcrypt-feedstock.mark ) && true) || ( (echo "flask-bcrypt-feedstock" >>failed.28 ) && (echo "flask-bcrypt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-bcrypt-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flask-openid-feedstock.mark ]]; then
    if [[ -d flask-openid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-openid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-openid-feedstock.mark ) && true) || ( (echo "flask-openid-feedstock" >>failed.28 ) && (echo "flask-openid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-openid-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flask-restful-feedstock.mark ]]; then
    if [[ -d flask-restful-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-restful-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-restful-feedstock.mark ) && true) || ( (echo "flask-restful-feedstock" >>failed.28 ) && (echo "flask-restful-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-restful-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flask-restx-feedstock.mark ]]; then
    if [[ -d flask-restx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-restx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-restx-feedstock.mark ) && true) || ( (echo "flask-restx-feedstock" >>failed.28 ) && (echo "flask-restx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-restx-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f flask-socketio-feedstock.mark ]]; then
    if [[ -d flask-socketio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-socketio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-socketio-feedstock.mark ) && true) || ( (echo "flask-socketio-feedstock" >>failed.28 ) && (echo "flask-socketio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-socketio-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f folium-feedstock.mark ]]; then
    if [[ -d folium-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./folium-feedstock >d 2>&1 && rm -f d && ( echo "done" >>folium-feedstock.mark ) && true) || ( (echo "folium-feedstock" >>failed.28 ) && (echo "folium-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "folium-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f funcsigs-feedstock.mark ]]; then
    if [[ -d funcsigs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./funcsigs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>funcsigs-feedstock.mark ) && true) || ( (echo "funcsigs-feedstock" >>failed.28 ) && (echo "funcsigs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "funcsigs-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f fuzzywuzzy-feedstock.mark ]]; then
    if [[ -d fuzzywuzzy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fuzzywuzzy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fuzzywuzzy-feedstock.mark ) && true) || ( (echo "fuzzywuzzy-feedstock" >>failed.28 ) && (echo "fuzzywuzzy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fuzzywuzzy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f gensim-feedstock.mark ]]; then
    if [[ -d gensim-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./gensim-feedstock >d 2>&1 && rm -f d && ( echo "done" >>gensim-feedstock.mark ) && true) || ( (echo "gensim-feedstock" >>failed.28 ) && (echo "gensim-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "gensim-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f geoviews-core-feedstock.mark ]]; then
    if [[ -d geoviews-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./geoviews-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>geoviews-core-feedstock.mark ) && true) || ( (echo "geoviews-core-feedstock" >>failed.28 ) && (echo "geoviews-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "geoviews-core-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f geventhttpclient-feedstock.mark ]]; then
    if [[ -d geventhttpclient-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./geventhttpclient-feedstock >d 2>&1 && rm -f d && ( echo "done" >>geventhttpclient-feedstock.mark ) && true) || ( (echo "geventhttpclient-feedstock" >>failed.28 ) && (echo "geventhttpclient-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "geventhttpclient-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f glue-vispy-viewers-feedstock.mark ]]; then
    if [[ -d glue-vispy-viewers-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./glue-vispy-viewers-feedstock >d 2>&1 && rm -f d && ( echo "done" >>glue-vispy-viewers-feedstock.mark ) && true) || ( (echo "glue-vispy-viewers-feedstock" >>failed.28 ) && (echo "glue-vispy-viewers-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "glue-vispy-viewers-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f google-auth-oauthlib-feedstock.mark ]]; then
    if [[ -d google-auth-oauthlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-auth-oauthlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-auth-oauthlib-feedstock.mark ) && true) || ( (echo "google-auth-oauthlib-feedstock" >>failed.28 ) && (echo "google-auth-oauthlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-auth-oauthlib-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f google-cloud-storage-feedstock.mark ]]; then
    if [[ -d google-cloud-storage-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-cloud-storage-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-cloud-storage-feedstock.mark ) && true) || ( (echo "google-cloud-storage-feedstock" >>failed.28 ) && (echo "google-cloud-storage-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-cloud-storage-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f hiredis-feedstock.mark ]]; then
    if [[ -d hiredis-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hiredis-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hiredis-feedstock.mark ) && true) || ( (echo "hiredis-feedstock" >>failed.28 ) && (echo "hiredis-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hiredis-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f holidays-feedstock.mark ]]; then
    if [[ -d holidays-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./holidays-feedstock >d 2>&1 && rm -f d && ( echo "done" >>holidays-feedstock.mark ) && true) || ( (echo "holidays-feedstock" >>failed.28 ) && (echo "holidays-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "holidays-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f hvplot-feedstock.mark ]]; then
    if [[ -d hvplot-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hvplot-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hvplot-feedstock.mark ) && true) || ( (echo "hvplot-feedstock" >>failed.28 ) && (echo "hvplot-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hvplot-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ibis-framework-feedstock.mark ]]; then
    if [[ -d ibis-framework-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ibis-framework-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ibis-framework-feedstock.mark ) && true) || ( (echo "ibis-framework-feedstock" >>failed.28 ) && (echo "ibis-framework-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ibis-framework-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f idna_ssl-feedstock.mark ]]; then
    if [[ -d idna_ssl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./idna_ssl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>idna_ssl-feedstock.mark ) && true) || ( (echo "idna_ssl-feedstock" >>failed.28 ) && (echo "idna_ssl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "idna_ssl-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ijson-feedstock.mark ]]; then
    if [[ -d ijson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ijson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ijson-feedstock.mark ) && true) || ( (echo "ijson-feedstock" >>failed.28 ) && (echo "ijson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ijson-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f iminuit-feedstock.mark ]]; then
    if [[ -d iminuit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./iminuit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>iminuit-feedstock.mark ) && true) || ( (echo "iminuit-feedstock" >>failed.28 ) && (echo "iminuit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "iminuit-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f immutables-feedstock.mark ]]; then
    if [[ -d immutables-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./immutables-feedstock >d 2>&1 && rm -f d && ( echo "done" >>immutables-feedstock.mark ) && true) || ( (echo "immutables-feedstock" >>failed.28 ) && (echo "immutables-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "immutables-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f inflect-feedstock.mark ]]; then
    if [[ -d inflect-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./inflect-feedstock >d 2>&1 && rm -f d && ( echo "done" >>inflect-feedstock.mark ) && true) || ( (echo "inflect-feedstock" >>failed.28 ) && (echo "inflect-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "inflect-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f intake-xarray-feedstock.mark ]]; then
    if [[ -d intake-xarray-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./intake-xarray-feedstock >d 2>&1 && rm -f d && ( echo "done" >>intake-xarray-feedstock.mark ) && true) || ( (echo "intake-xarray-feedstock" >>failed.28 ) && (echo "intake-xarray-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "intake-xarray-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ipaddr-feedstock.mark ]]; then
    if [[ -d ipaddr-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipaddr-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipaddr-feedstock.mark ) && true) || ( (echo "ipaddr-feedstock" >>failed.28 ) && (echo "ipaddr-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipaddr-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ipyparallel-feedstock.mark ]]; then
    if [[ -d ipyparallel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipyparallel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipyparallel-feedstock.mark ) && true) || ( (echo "ipyparallel-feedstock" >>failed.28 ) && (echo "ipyparallel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipyparallel-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ipython-sql-feedstock.mark ]]; then
    if [[ -d ipython-sql-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipython-sql-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipython-sql-feedstock.mark ) && true) || ( (echo "ipython-sql-feedstock" >>failed.28 ) && (echo "ipython-sql-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipython-sql-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f jaeger-client-feedstock.mark ]]; then
    if [[ -d jaeger-client-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jaeger-client-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jaeger-client-feedstock.mark ) && true) || ( (echo "jaeger-client-feedstock" >>failed.28 ) && (echo "jaeger-client-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jaeger-client-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f jpype1-feedstock.mark ]]; then
    if [[ -d jpype1-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jpype1-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jpype1-feedstock.mark ) && true) || ( (echo "jpype1-feedstock" >>failed.28 ) && (echo "jpype1-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jpype1-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f jsondate-feedstock.mark ]]; then
    if [[ -d jsondate-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jsondate-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jsondate-feedstock.mark ) && true) || ( (echo "jsondate-feedstock" >>failed.28 ) && (echo "jsondate-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jsondate-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f jsonpickle-feedstock.mark ]]; then
    if [[ -d jsonpickle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jsonpickle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jsonpickle-feedstock.mark ) && true) || ( (echo "jsonpickle-feedstock" >>failed.28 ) && (echo "jsonpickle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jsonpickle-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f jupyter_kernel_gateway-feedstock.mark ]]; then
    if [[ -d jupyter_kernel_gateway-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_kernel_gateway-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_kernel_gateway-feedstock.mark ) && true) || ( (echo "jupyter_kernel_gateway-feedstock" >>failed.28 ) && (echo "jupyter_kernel_gateway-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_kernel_gateway-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f jupyterlab_launcher-feedstock.mark ]]; then
    if [[ -d jupyterlab_launcher-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterlab_launcher-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterlab_launcher-feedstock.mark ) && true) || ( (echo "jupyterlab_launcher-feedstock" >>failed.28 ) && (echo "jupyterlab_launcher-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterlab_launcher-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f keras-feedstock.mark ]]; then
    if [[ -d keras-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./keras-feedstock >d 2>&1 && rm -f d && ( echo "done" >>keras-feedstock.mark ) && true) || ( (echo "keras-feedstock" >>failed.28 ) && (echo "keras-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "keras-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f keyrings.alt-feedstock.mark ]]; then
    if [[ -d keyrings.alt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./keyrings.alt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>keyrings.alt-feedstock.mark ) && true) || ( (echo "keyrings.alt-feedstock" >>failed.28 ) && (echo "keyrings.alt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "keyrings.alt-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f kombu-feedstock.mark ]]; then
    if [[ -d kombu-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./kombu-feedstock >d 2>&1 && rm -f d && ( echo "done" >>kombu-feedstock.mark ) && true) || ( (echo "kombu-feedstock" >>failed.28 ) && (echo "kombu-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "kombu-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f lancet-feedstock.mark ]]; then
    if [[ -d lancet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lancet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lancet-feedstock.mark ) && true) || ( (echo "lancet-feedstock" >>failed.28 ) && (echo "lancet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lancet-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f lark-feedstock.mark ]]; then
    if [[ -d lark-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lark-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lark-feedstock.mark ) && true) || ( (echo "lark-feedstock" >>failed.28 ) && (echo "lark-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lark-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f libcst-feedstock.mark ]]; then
    if [[ -d libcst-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./libcst-feedstock >d 2>&1 && rm -f d && ( echo "done" >>libcst-feedstock.mark ) && true) || ( (echo "libcst-feedstock" >>failed.28 ) && (echo "libcst-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "libcst-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f lightgbm-feedstock.mark ]]; then
    if [[ -d lightgbm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lightgbm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lightgbm-feedstock.mark ) && true) || ( (echo "lightgbm-feedstock" >>failed.28 ) && (echo "lightgbm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lightgbm-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f llvmdev-feedstock.mark ]]; then
    if [[ -d llvmdev-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./llvmdev-feedstock >d 2>&1 && rm -f d && ( echo "done" >>llvmdev-feedstock.mark ) && true) || ( (echo "llvmdev-feedstock" >>failed.28 ) && (echo "llvmdev-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "llvmdev-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f logilab-common-feedstock.mark ]]; then
    if [[ -d logilab-common-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./logilab-common-feedstock >d 2>&1 && rm -f d && ( echo "done" >>logilab-common-feedstock.mark ) && true) || ( (echo "logilab-common-feedstock" >>failed.28 ) && (echo "logilab-common-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "logilab-common-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f loguru-feedstock.mark ]]; then
    if [[ -d loguru-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./loguru-feedstock >d 2>&1 && rm -f d && ( echo "done" >>loguru-feedstock.mark ) && true) || ( (echo "loguru-feedstock" >>failed.28 ) && (echo "loguru-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "loguru-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f luigi-feedstock.mark ]]; then
    if [[ -d luigi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./luigi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>luigi-feedstock.mark ) && true) || ( (echo "luigi-feedstock" >>failed.28 ) && (echo "luigi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "luigi-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f mapclassify-feedstock.mark ]]; then
    if [[ -d mapclassify-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mapclassify-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mapclassify-feedstock.mark ) && true) || ( (echo "mapclassify-feedstock" >>failed.28 ) && (echo "mapclassify-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mapclassify-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f matrixprofile-feedstock.mark ]]; then
    if [[ -d matrixprofile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./matrixprofile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>matrixprofile-feedstock.mark ) && true) || ( (echo "matrixprofile-feedstock" >>failed.28 ) && (echo "matrixprofile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "matrixprofile-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f meson-python-feedstock.mark ]]; then
    if [[ -d meson-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./meson-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>meson-python-feedstock.mark ) && true) || ( (echo "meson-python-feedstock" >>failed.28 ) && (echo "meson-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "meson-python-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f mmh3-feedstock.mark ]]; then
    if [[ -d mmh3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mmh3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mmh3-feedstock.mark ) && true) || ( (echo "mmh3-feedstock" >>failed.28 ) && (echo "mmh3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mmh3-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f moto-feedstock.mark ]]; then
    if [[ -d moto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./moto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>moto-feedstock.mark ) && true) || ( (echo "moto-feedstock" >>failed.28 ) && (echo "moto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "moto-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f mpi4py-feedstock.mark ]]; then
    if [[ -d mpi4py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mpi4py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mpi4py-feedstock.mark ) && true) || ( (echo "mpi4py-feedstock" >>failed.28 ) && (echo "mpi4py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mpi4py-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f mpld3-feedstock.mark ]]; then
    if [[ -d mpld3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mpld3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mpld3-feedstock.mark ) && true) || ( (echo "mpld3-feedstock" >>failed.28 ) && (echo "mpld3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mpld3-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f mxnet-feedstock.mark ]]; then
    if [[ -d mxnet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mxnet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mxnet-feedstock.mark ) && true) || ( (echo "mxnet-feedstock" >>failed.28 ) && (echo "mxnet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mxnet-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f mypy-feedstock.mark ]]; then
    if [[ -d mypy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mypy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mypy-feedstock.mark ) && true) || ( (echo "mypy-feedstock" >>failed.28 ) && (echo "mypy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mypy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f mysqlclient-feedstock.mark ]]; then
    if [[ -d mysqlclient-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mysqlclient-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mysqlclient-feedstock.mark ) && true) || ( (echo "mysqlclient-feedstock" >>failed.28 ) && (echo "mysqlclient-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mysqlclient-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f nb_anacondacloud-feedstock.mark ]]; then
    if [[ -d nb_anacondacloud-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nb_anacondacloud-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nb_anacondacloud-feedstock.mark ) && true) || ( (echo "nb_anacondacloud-feedstock" >>failed.28 ) && (echo "nb_anacondacloud-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nb_anacondacloud-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f nb_conda-feedstock.mark ]]; then
    if [[ -d nb_conda-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nb_conda-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nb_conda-feedstock.mark ) && true) || ( (echo "nb_conda-feedstock" >>failed.28 ) && (echo "nb_conda-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nb_conda-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f nbserverproxy-feedstock.mark ]]; then
    if [[ -d nbserverproxy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbserverproxy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbserverproxy-feedstock.mark ) && true) || ( (echo "nbserverproxy-feedstock" >>failed.28 ) && (echo "nbserverproxy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbserverproxy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f nbsmoke-feedstock.mark ]]; then
    if [[ -d nbsmoke-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbsmoke-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbsmoke-feedstock.mark ) && true) || ( (echo "nbsmoke-feedstock" >>failed.28 ) && (echo "nbsmoke-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbsmoke-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f neo4j-python-driver-feedstock.mark ]]; then
    if [[ -d neo4j-python-driver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./neo4j-python-driver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>neo4j-python-driver-feedstock.mark ) && true) || ( (echo "neo4j-python-driver-feedstock" >>failed.28 ) && (echo "neo4j-python-driver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "neo4j-python-driver-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f netifaces-feedstock.mark ]]; then
    if [[ -d netifaces-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./netifaces-feedstock >d 2>&1 && rm -f d && ( echo "done" >>netifaces-feedstock.mark ) && true) || ( (echo "netifaces-feedstock" >>failed.28 ) && (echo "netifaces-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "netifaces-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f nose_parameterized-feedstock.mark ]]; then
    if [[ -d nose_parameterized-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nose_parameterized-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nose_parameterized-feedstock.mark ) && true) || ( (echo "nose_parameterized-feedstock" >>failed.28 ) && (echo "nose_parameterized-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nose_parameterized-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f oauthenticator-feedstock.mark ]]; then
    if [[ -d oauthenticator-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./oauthenticator-feedstock >d 2>&1 && rm -f d && ( echo "done" >>oauthenticator-feedstock.mark ) && true) || ( (echo "oauthenticator-feedstock" >>failed.28 ) && (echo "oauthenticator-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "oauthenticator-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f odo-feedstock.mark ]]; then
    if [[ -d odo-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./odo-feedstock >d 2>&1 && rm -f d && ( echo "done" >>odo-feedstock.mark ) && true) || ( (echo "odo-feedstock" >>failed.28 ) && (echo "odo-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "odo-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f onnxmltools-feedstock.mark ]]; then
    if [[ -d onnxmltools-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./onnxmltools-feedstock >d 2>&1 && rm -f d && ( echo "done" >>onnxmltools-feedstock.mark ) && true) || ( (echo "onnxmltools-feedstock" >>failed.28 ) && (echo "onnxmltools-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "onnxmltools-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f onnxruntime-feedstock.mark ]]; then
    if [[ -d onnxruntime-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./onnxruntime-feedstock >d 2>&1 && rm -f d && ( echo "done" >>onnxruntime-feedstock.mark ) && true) || ( (echo "onnxruntime-feedstock" >>failed.28 ) && (echo "onnxruntime-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "onnxruntime-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f opencensus-context-feedstock.mark ]]; then
    if [[ -d opencensus-context-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./opencensus-context-feedstock >d 2>&1 && rm -f d && ( echo "done" >>opencensus-context-feedstock.mark ) && true) || ( (echo "opencensus-context-feedstock" >>failed.28 ) && (echo "opencensus-context-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "opencensus-context-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f opentsne-feedstock.mark ]]; then
    if [[ -d opentsne-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./opentsne-feedstock >d 2>&1 && rm -f d && ( echo "done" >>opentsne-feedstock.mark ) && true) || ( (echo "opentsne-feedstock" >>failed.28 ) && (echo "opentsne-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "opentsne-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f optax-feedstock.mark ]]; then
    if [[ -d optax-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./optax-feedstock >d 2>&1 && rm -f d && ( echo "done" >>optax-feedstock.mark ) && true) || ( (echo "optax-feedstock" >>failed.28 ) && (echo "optax-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "optax-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f orange-widget-base-feedstock.mark ]]; then
    if [[ -d orange-widget-base-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./orange-widget-base-feedstock >d 2>&1 && rm -f d && ( echo "done" >>orange-widget-base-feedstock.mark ) && true) || ( (echo "orange-widget-base-feedstock" >>failed.28 ) && (echo "orange-widget-base-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "orange-widget-base-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f orjson-feedstock.mark ]]; then
    if [[ -d orjson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./orjson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>orjson-feedstock.mark ) && true) || ( (echo "orjson-feedstock" >>failed.28 ) && (echo "orjson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "orjson-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pandarallel-feedstock.mark ]]; then
    if [[ -d pandarallel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandarallel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandarallel-feedstock.mark ) && true) || ( (echo "pandarallel-feedstock" >>failed.28 ) && (echo "pandarallel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandarallel-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pandas-profiling-feedstock.mark ]]; then
    if [[ -d pandas-profiling-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandas-profiling-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandas-profiling-feedstock.mark ) && true) || ( (echo "pandas-profiling-feedstock" >>failed.28 ) && (echo "pandas-profiling-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandas-profiling-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pandas-stubs-feedstock.mark ]]; then
    if [[ -d pandas-stubs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandas-stubs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandas-stubs-feedstock.mark ) && true) || ( (echo "pandas-stubs-feedstock" >>failed.28 ) && (echo "pandas-stubs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandas-stubs-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f paste-feedstock.mark ]]; then
    if [[ -d paste-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./paste-feedstock >d 2>&1 && rm -f d && ( echo "done" >>paste-feedstock.mark ) && true) || ( (echo "paste-feedstock" >>failed.28 ) && (echo "paste-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "paste-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pefile-feedstock.mark ]]; then
    if [[ -d pefile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pefile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pefile-feedstock.mark ) && true) || ( (echo "pefile-feedstock" >>failed.28 ) && (echo "pefile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pefile-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pep8-feedstock.mark ]]; then
    if [[ -d pep8-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep8-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep8-feedstock.mark ) && true) || ( (echo "pep8-feedstock" >>failed.28 ) && (echo "pep8-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep8-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pep8-naming-feedstock.mark ]]; then
    if [[ -d pep8-naming-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep8-naming-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep8-naming-feedstock.mark ) && true) || ( (echo "pep8-naming-feedstock" >>failed.28 ) && (echo "pep8-naming-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep8-naming-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f plac-feedstock.mark ]]; then
    if [[ -d plac-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./plac-feedstock >d 2>&1 && rm -f d && ( echo "done" >>plac-feedstock.mark ) && true) || ( (echo "plac-feedstock" >>failed.28 ) && (echo "plac-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "plac-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f plyvel-feedstock.mark ]]; then
    if [[ -d plyvel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./plyvel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>plyvel-feedstock.mark ) && true) || ( (echo "plyvel-feedstock" >>failed.28 ) && (echo "plyvel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "plyvel-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pmdarima-feedstock.mark ]]; then
    if [[ -d pmdarima-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pmdarima-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pmdarima-feedstock.mark ) && true) || ( (echo "pmdarima-feedstock" >>failed.28 ) && (echo "pmdarima-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pmdarima-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pomegranate-feedstock.mark ]]; then
    if [[ -d pomegranate-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pomegranate-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pomegranate-feedstock.mark ) && true) || ( (echo "pomegranate-feedstock" >>failed.28 ) && (echo "pomegranate-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pomegranate-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f portalocker-feedstock.mark ]]; then
    if [[ -d portalocker-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./portalocker-feedstock >d 2>&1 && rm -f d && ( echo "done" >>portalocker-feedstock.mark ) && true) || ( (echo "portalocker-feedstock" >>failed.28 ) && (echo "portalocker-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "portalocker-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pre-commit-feedstock.mark ]]; then
    if [[ -d pre-commit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pre-commit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pre-commit-feedstock.mark ) && true) || ( (echo "pre-commit-feedstock" >>failed.28 ) && (echo "pre-commit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pre-commit-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pretend-feedstock.mark ]]; then
    if [[ -d pretend-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pretend-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pretend-feedstock.mark ) && true) || ( (echo "pretend-feedstock" >>failed.28 ) && (echo "pretend-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pretend-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f progress-feedstock.mark ]]; then
    if [[ -d progress-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./progress-feedstock >d 2>&1 && rm -f d && ( echo "done" >>progress-feedstock.mark ) && true) || ( (echo "progress-feedstock" >>failed.28 ) && (echo "progress-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "progress-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f progressbar2-feedstock.mark ]]; then
    if [[ -d progressbar2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./progressbar2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>progressbar2-feedstock.mark ) && true) || ( (echo "progressbar2-feedstock" >>failed.28 ) && (echo "progressbar2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "progressbar2-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f promise-feedstock.mark ]]; then
    if [[ -d promise-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./promise-feedstock >d 2>&1 && rm -f d && ( echo "done" >>promise-feedstock.mark ) && true) || ( (echo "promise-feedstock" >>failed.28 ) && (echo "promise-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "promise-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f proto-plus-feedstock.mark ]]; then
    if [[ -d proto-plus-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./proto-plus-feedstock >d 2>&1 && rm -f d && ( echo "done" >>proto-plus-feedstock.mark ) && true) || ( (echo "proto-plus-feedstock" >>failed.28 ) && (echo "proto-plus-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "proto-plus-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyamg-feedstock.mark ]]; then
    if [[ -d pyamg-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyamg-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyamg-feedstock.mark ) && true) || ( (echo "pyamg-feedstock" >>failed.28 ) && (echo "pyamg-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyamg-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pycairo-feedstock.mark ]]; then
    if [[ -d pycairo-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycairo-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycairo-feedstock.mark ) && true) || ( (echo "pycairo-feedstock" >>failed.28 ) && (echo "pycairo-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycairo-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyclipper-feedstock.mark ]]; then
    if [[ -d pyclipper-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyclipper-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyclipper-feedstock.mark ) && true) || ( (echo "pyclipper-feedstock" >>failed.28 ) && (echo "pyclipper-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyclipper-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pycrypto-feedstock.mark ]]; then
    if [[ -d pycrypto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycrypto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycrypto-feedstock.mark ) && true) || ( (echo "pycrypto-feedstock" >>failed.28 ) && (echo "pycrypto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycrypto-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pycurl-feedstock.mark ]]; then
    if [[ -d pycurl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycurl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycurl-feedstock.mark ) && true) || ( (echo "pycurl-feedstock" >>failed.28 ) && (echo "pycurl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycurl-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pydot-feedstock.mark ]]; then
    if [[ -d pydot-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydot-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydot-feedstock.mark ) && true) || ( (echo "pydot-feedstock" >>failed.28 ) && (echo "pydot-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydot-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyemd-feedstock.mark ]]; then
    if [[ -d pyemd-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyemd-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyemd-feedstock.mark ) && true) || ( (echo "pyemd-feedstock" >>failed.28 ) && (echo "pyemd-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyemd-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyface-feedstock.mark ]]; then
    if [[ -d pyface-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyface-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyface-feedstock.mark ) && true) || ( (echo "pyface-feedstock" >>failed.28 ) && (echo "pyface-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyface-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pygpu-feedstock.mark ]]; then
    if [[ -d pygpu-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pygpu-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pygpu-feedstock.mark ) && true) || ( (echo "pygpu-feedstock" >>failed.28 ) && (echo "pygpu-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pygpu-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pygraphviz-feedstock.mark ]]; then
    if [[ -d pygraphviz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pygraphviz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pygraphviz-feedstock.mark ) && true) || ( (echo "pygraphviz-feedstock" >>failed.28 ) && (echo "pygraphviz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pygraphviz-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyicu-feedstock.mark ]]; then
    if [[ -d pyicu-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyicu-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyicu-feedstock.mark ) && true) || ( (echo "pyicu-feedstock" >>failed.28 ) && (echo "pyicu-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyicu-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pykdtree-feedstock.mark ]]; then
    if [[ -d pykdtree-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pykdtree-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pykdtree-feedstock.mark ) && true) || ( (echo "pykdtree-feedstock" >>failed.28 ) && (echo "pykdtree-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pykdtree-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pylint-venv-feedstock.mark ]]; then
    if [[ -d pylint-venv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pylint-venv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pylint-venv-feedstock.mark ) && true) || ( (echo "pylint-venv-feedstock" >>failed.28 ) && (echo "pylint-venv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pylint-venv-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pymc3-feedstock.mark ]]; then
    if [[ -d pymc3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pymc3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pymc3-feedstock.mark ) && true) || ( (echo "pymc3-feedstock" >>failed.28 ) && (echo "pymc3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pymc3-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pymongo-feedstock.mark ]]; then
    if [[ -d pymongo-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pymongo-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pymongo-feedstock.mark ) && true) || ( (echo "pymongo-feedstock" >>failed.28 ) && (echo "pymongo-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pymongo-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pymssql-feedstock.mark ]]; then
    if [[ -d pymssql-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pymssql-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pymssql-feedstock.mark ) && true) || ( (echo "pymssql-feedstock" >>failed.28 ) && (echo "pymssql-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pymssql-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyodbc-feedstock.mark ]]; then
    if [[ -d pyodbc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyodbc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyodbc-feedstock.mark ) && true) || ( (echo "pyodbc-feedstock" >>failed.28 ) && (echo "pyodbc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyodbc-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pypdf2-feedstock.mark ]]; then
    if [[ -d pypdf2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pypdf2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pypdf2-feedstock.mark ) && true) || ( (echo "pypdf2-feedstock" >>failed.28 ) && (echo "pypdf2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pypdf2-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyppmd-feedstock.mark ]]; then
    if [[ -d pyppmd-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyppmd-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyppmd-feedstock.mark ) && true) || ( (echo "pyppmd-feedstock" >>failed.28 ) && (echo "pyppmd-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyppmd-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyquery-feedstock.mark ]]; then
    if [[ -d pyquery-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyquery-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyquery-feedstock.mark ) && true) || ( (echo "pyquery-feedstock" >>failed.28 ) && (echo "pyquery-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyquery-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyserial-feedstock.mark ]]; then
    if [[ -d pyserial-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyserial-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyserial-feedstock.mark ) && true) || ( (echo "pyserial-feedstock" >>failed.28 ) && (echo "pyserial-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyserial-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyspark-feedstock.mark ]]; then
    if [[ -d pyspark-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyspark-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyspark-feedstock.mark ) && true) || ( (echo "pyspark-feedstock" >>failed.28 ) && (echo "pyspark-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyspark-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyspnego-feedstock.mark ]]; then
    if [[ -d pyspnego-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyspnego-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyspnego-feedstock.mark ) && true) || ( (echo "pyspnego-feedstock" >>failed.28 ) && (echo "pyspnego-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyspnego-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytesseract-feedstock.mark ]]; then
    if [[ -d pytesseract-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytesseract-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytesseract-feedstock.mark ) && true) || ( (echo "pytesseract-feedstock" >>failed.28 ) && (echo "pytesseract-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytesseract-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytest-astropy-feedstock.mark ]]; then
    if [[ -d pytest-astropy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-astropy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-astropy-feedstock.mark ) && true) || ( (echo "pytest-astropy-feedstock" >>failed.28 ) && (echo "pytest-astropy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-astropy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytest-asyncio-feedstock.mark ]]; then
    if [[ -d pytest-asyncio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-asyncio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-asyncio-feedstock.mark ) && true) || ( (echo "pytest-asyncio-feedstock" >>failed.28 ) && (echo "pytest-asyncio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-asyncio-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytest-base-url-feedstock.mark ]]; then
    if [[ -d pytest-base-url-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-base-url-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-base-url-feedstock.mark ) && true) || ( (echo "pytest-base-url-feedstock" >>failed.28 ) && (echo "pytest-base-url-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-base-url-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytest-benchmark-feedstock.mark ]]; then
    if [[ -d pytest-benchmark-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-benchmark-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-benchmark-feedstock.mark ) && true) || ( (echo "pytest-benchmark-feedstock" >>failed.28 ) && (echo "pytest-benchmark-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-benchmark-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytest-describe-feedstock.mark ]]; then
    if [[ -d pytest-describe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-describe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-describe-feedstock.mark ) && true) || ( (echo "pytest-describe-feedstock" >>failed.28 ) && (echo "pytest-describe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-describe-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytest-metadata-feedstock.mark ]]; then
    if [[ -d pytest-metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-metadata-feedstock.mark ) && true) || ( (echo "pytest-metadata-feedstock" >>failed.28 ) && (echo "pytest-metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-metadata-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytest-variables-feedstock.mark ]]; then
    if [[ -d pytest-variables-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-variables-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-variables-feedstock.mark ) && true) || ( (echo "pytest-variables-feedstock" >>failed.28 ) && (echo "pytest-variables-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-variables-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-bidi-feedstock.mark ]]; then
    if [[ -d python-bidi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-bidi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-bidi-feedstock.mark ) && true) || ( (echo "python-bidi-feedstock" >>failed.28 ) && (echo "python-bidi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-bidi-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-blosc-feedstock.mark ]]; then
    if [[ -d python-blosc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-blosc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-blosc-feedstock.mark ) && true) || ( (echo "python-blosc-feedstock" >>failed.28 ) && (echo "python-blosc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-blosc-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-crfsuite-feedstock.mark ]]; then
    if [[ -d python-crfsuite-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-crfsuite-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>python-crfsuite-feedstock.mark ) && true) || ( (echo "python-crfsuite-feedstock" >>failed.28 ) && (echo "python-crfsuite-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-crfsuite-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-gflags-feedstock.mark ]]; then
    if [[ -d python-gflags-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-gflags-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-gflags-feedstock.mark ) && true) || ( (echo "python-gflags-feedstock" >>failed.28 ) && (echo "python-gflags-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-gflags-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-kubernetes-feedstock.mark ]]; then
    if [[ -d python-kubernetes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-kubernetes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-kubernetes-feedstock.mark ) && true) || ( (echo "python-kubernetes-feedstock" >>failed.28 ) && (echo "python-kubernetes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-kubernetes-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-ldap-feedstock.mark ]]; then
    if [[ -d python-ldap-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-ldap-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-ldap-feedstock.mark ) && true) || ( (echo "python-ldap-feedstock" >>failed.28 ) && (echo "python-ldap-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-ldap-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-leveldb-feedstock.mark ]]; then
    if [[ -d python-leveldb-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-leveldb-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-leveldb-feedstock.mark ) && true) || ( (echo "python-leveldb-feedstock" >>failed.28 ) && (echo "python-leveldb-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-leveldb-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-lmdb-feedstock.mark ]]; then
    if [[ -d python-lmdb-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-lmdb-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-lmdb-feedstock.mark ) && true) || ( (echo "python-lmdb-feedstock" >>failed.28 ) && (echo "python-lmdb-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-lmdb-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-memcached-feedstock.mark ]]; then
    if [[ -d python-memcached-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-memcached-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-memcached-feedstock.mark ) && true) || ( (echo "python-memcached-feedstock" >>failed.28 ) && (echo "python-memcached-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-memcached-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f python-rapidjson-feedstock.mark ]]; then
    if [[ -d python-rapidjson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-rapidjson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-rapidjson-feedstock.mark ) && true) || ( (echo "python-rapidjson-feedstock" >>failed.28 ) && (echo "python-rapidjson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-rapidjson-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pythonnet-feedstock.mark ]]; then
    if [[ -d pythonnet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pythonnet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pythonnet-feedstock.mark ) && true) || ( (echo "pythonnet-feedstock" >>failed.28 ) && (echo "pythonnet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pythonnet-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pytoolconfig-feedstock.mark ]]; then
    if [[ -d pytoolconfig-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytoolconfig-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytoolconfig-feedstock.mark ) && true) || ( (echo "pytoolconfig-feedstock" >>failed.28 ) && (echo "pytoolconfig-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytoolconfig-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f pyzstd-feedstock.mark ]]; then
    if [[ -d pyzstd-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyzstd-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyzstd-feedstock.mark ) && true) || ( (echo "pyzstd-feedstock" >>failed.28 ) && (echo "pyzstd-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyzstd-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f qgrid-feedstock.mark ]]; then
    if [[ -d qgrid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./qgrid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>qgrid-feedstock.mark ) && true) || ( (echo "qgrid-feedstock" >>failed.28 ) && (echo "qgrid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "qgrid-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f quandl-feedstock.mark ]]; then
    if [[ -d quandl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./quandl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>quandl-feedstock.mark ) && true) || ( (echo "quandl-feedstock" >>failed.28 ) && (echo "quandl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "quandl-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f rasterio-feedstock.mark ]]; then
    if [[ -d rasterio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./rasterio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>rasterio-feedstock.mark ) && true) || ( (echo "rasterio-feedstock" >>failed.28 ) && (echo "rasterio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "rasterio-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f redis-py-feedstock.mark ]]; then
    if [[ -d redis-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./redis-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>redis-py-feedstock.mark ) && true) || ( (echo "redis-py-feedstock" >>failed.28 ) && (echo "redis-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "redis-py-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f reportlab-feedstock.mark ]]; then
    if [[ -d reportlab-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./reportlab-feedstock >d 2>&1 && rm -f d && ( echo "done" >>reportlab-feedstock.mark ) && true) || ( (echo "reportlab-feedstock" >>failed.28 ) && (echo "reportlab-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "reportlab-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f requests-ftp-feedstock.mark ]]; then
    if [[ -d requests-ftp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-ftp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-ftp-feedstock.mark ) && true) || ( (echo "requests-ftp-feedstock" >>failed.28 ) && (echo "requests-ftp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-ftp-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f requests-futures-feedstock.mark ]]; then
    if [[ -d requests-futures-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-futures-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-futures-feedstock.mark ) && true) || ( (echo "requests-futures-feedstock" >>failed.28 ) && (echo "requests-futures-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-futures-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f requests-wsgi-adapter-feedstock.mark ]]; then
    if [[ -d requests-wsgi-adapter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-wsgi-adapter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-wsgi-adapter-feedstock.mark ) && true) || ( (echo "requests-wsgi-adapter-feedstock" >>failed.28 ) && (echo "requests-wsgi-adapter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-wsgi-adapter-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f requests_download-feedstock.mark ]]; then
    if [[ -d requests_download-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests_download-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests_download-feedstock.mark ) && true) || ( (echo "requests_download-feedstock" >>failed.28 ) && (echo "requests_download-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests_download-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f rise-feedstock.mark ]]; then
    if [[ -d rise-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./rise-feedstock >d 2>&1 && rm -f d && ( echo "done" >>rise-feedstock.mark ) && true) || ( (echo "rise-feedstock" >>failed.28 ) && (echo "rise-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "rise-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f runipy-feedstock.mark ]]; then
    if [[ -d runipy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./runipy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>runipy-feedstock.mark ) && true) || ( (echo "runipy-feedstock" >>failed.28 ) && (echo "runipy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "runipy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f s3fs-feedstock.mark ]]; then
    if [[ -d s3fs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./s3fs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>s3fs-feedstock.mark ) && true) || ( (echo "s3fs-feedstock" >>failed.28 ) && (echo "s3fs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "s3fs-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f schema-feedstock.mark ]]; then
    if [[ -d schema-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./schema-feedstock >d 2>&1 && rm -f d && ( echo "done" >>schema-feedstock.mark ) && true) || ( (echo "schema-feedstock" >>failed.28 ) && (echo "schema-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "schema-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f scikit-bio-feedstock.mark ]]; then
    if [[ -d scikit-bio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-bio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-bio-feedstock.mark ) && true) || ( (echo "scikit-bio-feedstock" >>failed.28 ) && (echo "scikit-bio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-bio-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f scikit-learn-intelex-feedstock.mark ]]; then
    if [[ -d scikit-learn-intelex-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-learn-intelex-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-learn-intelex-feedstock.mark ) && true) || ( (echo "scikit-learn-intelex-feedstock" >>failed.28 ) && (echo "scikit-learn-intelex-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-learn-intelex-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f scons-feedstock.mark ]]; then
    if [[ -d scons-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scons-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scons-feedstock.mark ) && true) || ( (echo "scons-feedstock" >>failed.28 ) && (echo "scons-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scons-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f scrapy-feedstock.mark ]]; then
    if [[ -d scrapy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scrapy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scrapy-feedstock.mark ) && true) || ( (echo "scrapy-feedstock" >>failed.28 ) && (echo "scrapy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scrapy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f selenium-feedstock.mark ]]; then
    if [[ -d selenium-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./selenium-feedstock >d 2>&1 && rm -f d && ( echo "done" >>selenium-feedstock.mark ) && true) || ( (echo "selenium-feedstock" >>failed.28 ) && (echo "selenium-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "selenium-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f sentencepiece-feedstock.mark ]]; then
    if [[ -d sentencepiece-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sentencepiece-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sentencepiece-feedstock.mark ) && true) || ( (echo "sentencepiece-feedstock" >>failed.28 ) && (echo "sentencepiece-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sentencepiece-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f sentry-sdk-feedstock.mark ]]; then
    if [[ -d sentry-sdk-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sentry-sdk-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sentry-sdk-feedstock.mark ) && true) || ( (echo "sentry-sdk-feedstock" >>failed.28 ) && (echo "sentry-sdk-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sentry-sdk-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f serverfiles-feedstock.mark ]]; then
    if [[ -d serverfiles-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./serverfiles-feedstock >d 2>&1 && rm -f d && ( echo "done" >>serverfiles-feedstock.mark ) && true) || ( (echo "serverfiles-feedstock" >>failed.28 ) && (echo "serverfiles-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "serverfiles-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f sh-feedstock.mark ]]; then
    if [[ -d sh-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sh-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sh-feedstock.mark ) && true) || ( (echo "sh-feedstock" >>failed.28 ) && (echo "sh-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sh-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f simplegeneric-feedstock.mark ]]; then
    if [[ -d simplegeneric-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./simplegeneric-feedstock >d 2>&1 && rm -f d && ( echo "done" >>simplegeneric-feedstock.mark ) && true) || ( (echo "simplegeneric-feedstock" >>failed.28 ) && (echo "simplegeneric-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "simplegeneric-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f slack-sdk-feedstock.mark ]]; then
    if [[ -d slack-sdk-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./slack-sdk-feedstock >d 2>&1 && rm -f d && ( echo "done" >>slack-sdk-feedstock.mark ) && true) || ( (echo "slack-sdk-feedstock" >>failed.28 ) && (echo "slack-sdk-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "slack-sdk-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f slackclient-feedstock.mark ]]; then
    if [[ -d slackclient-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./slackclient-feedstock >d 2>&1 && rm -f d && ( echo "done" >>slackclient-feedstock.mark ) && true) || ( (echo "slackclient-feedstock" >>failed.28 ) && (echo "slackclient-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "slackclient-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f smartypants-feedstock.mark ]]; then
    if [[ -d smartypants-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./smartypants-feedstock >d 2>&1 && rm -f d && ( echo "done" >>smartypants-feedstock.mark ) && true) || ( (echo "smartypants-feedstock" >>failed.28 ) && (echo "smartypants-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "smartypants-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f snowflake-connector-python-feedstock.mark ]]; then
    if [[ -d snowflake-connector-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./snowflake-connector-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>snowflake-connector-python-feedstock.mark ) && true) || ( (echo "snowflake-connector-python-feedstock" >>failed.28 ) && (echo "snowflake-connector-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "snowflake-connector-python-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f spacy-alignments-feedstock.mark ]]; then
    if [[ -d spacy-alignments-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spacy-alignments-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spacy-alignments-feedstock.mark ) && true) || ( (echo "spacy-alignments-feedstock" >>failed.28 ) && (echo "spacy-alignments-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spacy-alignments-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f spacy-feedstock.mark ]]; then
    if [[ -d spacy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spacy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spacy-feedstock.mark ) && true) || ( (echo "spacy-feedstock" >>failed.28 ) && (echo "spacy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spacy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f sparkmagic-feedstock.mark ]]; then
    if [[ -d sparkmagic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sparkmagic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sparkmagic-feedstock.mark ) && true) || ( (echo "sparkmagic-feedstock" >>failed.28 ) && (echo "sparkmagic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sparkmagic-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f sputnik-feedstock.mark ]]; then
    if [[ -d sputnik-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sputnik-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sputnik-feedstock.mark ) && true) || ( (echo "sputnik-feedstock" >>failed.28 ) && (echo "sputnik-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sputnik-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f spyder-feedstock.mark ]]; then
    if [[ -d spyder-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spyder-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spyder-feedstock.mark ) && true) || ( (echo "spyder-feedstock" >>failed.28 ) && (echo "spyder-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spyder-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f streamlit-feedstock.mark ]]; then
    if [[ -d streamlit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./streamlit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>streamlit-feedstock.mark ) && true) || ( (echo "streamlit-feedstock" >>failed.28 ) && (echo "streamlit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "streamlit-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f supervisor-feedstock.mark ]]; then
    if [[ -d supervisor-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./supervisor-feedstock >d 2>&1 && rm -f d && ( echo "done" >>supervisor-feedstock.mark ) && true) || ( (echo "supervisor-feedstock" >>failed.28 ) && (echo "supervisor-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "supervisor-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f tabula-py-feedstock.mark ]]; then
    if [[ -d tabula-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tabula-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tabula-py-feedstock.mark ) && true) || ( (echo "tabula-py-feedstock" >>failed.28 ) && (echo "tabula-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tabula-py-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f tbb-feedstock.mark ]]; then
    if [[ -d tbb-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tbb-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tbb-feedstock.mark ) && true) || ( (echo "tbb-feedstock" >>failed.28 ) && (echo "tbb-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tbb-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f testpath-feedstock.mark ]]; then
    if [[ -d testpath-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./testpath-feedstock >d 2>&1 && rm -f d && ( echo "done" >>testpath-feedstock.mark ) && true) || ( (echo "testpath-feedstock" >>failed.28 ) && (echo "testpath-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "testpath-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f testtools-feedstock.mark ]]; then
    if [[ -d testtools-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./testtools-feedstock >d 2>&1 && rm -f d && ( echo "done" >>testtools-feedstock.mark ) && true) || ( (echo "testtools-feedstock" >>failed.28 ) && (echo "testtools-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "testtools-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f thefuzz-feedstock.mark ]]; then
    if [[ -d thefuzz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thefuzz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thefuzz-feedstock.mark ) && true) || ( (echo "thefuzz-feedstock" >>failed.28 ) && (echo "thefuzz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thefuzz-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f thrift_sasl-feedstock.mark ]]; then
    if [[ -d thrift_sasl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thrift_sasl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thrift_sasl-feedstock.mark ) && true) || ( (echo "thrift_sasl-feedstock" >>failed.28 ) && (echo "thrift_sasl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thrift_sasl-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f thriftpy2-feedstock.mark ]]; then
    if [[ -d thriftpy2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thriftpy2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thriftpy2-feedstock.mark ) && true) || ( (echo "thriftpy2-feedstock" >>failed.28 ) && (echo "thriftpy2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thriftpy2-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f tokenizers-feedstock.mark ]]; then
    if [[ -d tokenizers-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tokenizers-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tokenizers-feedstock.mark ) && true) || ( (echo "tokenizers-feedstock" >>failed.28 ) && (echo "tokenizers-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tokenizers-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f toro-feedstock.mark ]]; then
    if [[ -d toro-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./toro-feedstock >d 2>&1 && rm -f d && ( echo "done" >>toro-feedstock.mark ) && true) || ( (echo "toro-feedstock" >>failed.28 ) && (echo "toro-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "toro-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f traceback2-feedstock.mark ]]; then
    if [[ -d traceback2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./traceback2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>traceback2-feedstock.mark ) && true) || ( (echo "traceback2-feedstock" >>failed.28 ) && (echo "traceback2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "traceback2-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f transaction-feedstock.mark ]]; then
    if [[ -d transaction-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./transaction-feedstock >d 2>&1 && rm -f d && ( echo "done" >>transaction-feedstock.mark ) && true) || ( (echo "transaction-feedstock" >>failed.28 ) && (echo "transaction-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "transaction-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f trio-feedstock.mark ]]; then
    if [[ -d trio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./trio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>trio-feedstock.mark ) && true) || ( (echo "trio-feedstock" >>failed.28 ) && (echo "trio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "trio-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f trustme-feedstock.mark ]]; then
    if [[ -d trustme-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./trustme-feedstock >d 2>&1 && rm -f d && ( echo "done" >>trustme-feedstock.mark ) && true) || ( (echo "trustme-feedstock" >>failed.28 ) && (echo "trustme-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "trustme-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f twofish-feedstock.mark ]]; then
    if [[ -d twofish-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./twofish-feedstock >d 2>&1 && rm -f d && ( echo "done" >>twofish-feedstock.mark ) && true) || ( (echo "twofish-feedstock" >>failed.28 ) && (echo "twofish-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "twofish-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f twython-feedstock.mark ]]; then
    if [[ -d twython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./twython-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>twython-feedstock.mark ) && true) || ( (echo "twython-feedstock" >>failed.28 ) && (echo "twython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "twython-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f unicodedata2-feedstock.mark ]]; then
    if [[ -d unicodedata2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./unicodedata2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>unicodedata2-feedstock.mark ) && true) || ( (echo "unicodedata2-feedstock" >>failed.28 ) && (echo "unicodedata2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "unicodedata2-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f uvloop-feedstock.mark ]]; then
    if [[ -d uvloop-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./uvloop-feedstock >d 2>&1 && rm -f d && ( echo "done" >>uvloop-feedstock.mark ) && true) || ( (echo "uvloop-feedstock" >>failed.28 ) && (echo "uvloop-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "uvloop-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f vcrpy-feedstock.mark ]]; then
    if [[ -d vcrpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./vcrpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>vcrpy-feedstock.mark ) && true) || ( (echo "vcrpy-feedstock" >>failed.28 ) && (echo "vcrpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "vcrpy-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f vcversioner-feedstock.mark ]]; then
    if [[ -d vcversioner-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./vcversioner-feedstock >d 2>&1 && rm -f d && ( echo "done" >>vcversioner-feedstock.mark ) && true) || ( (echo "vcversioner-feedstock" >>failed.28 ) && (echo "vcversioner-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "vcversioner-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f verboselogs-feedstock.mark ]]; then
    if [[ -d verboselogs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./verboselogs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>verboselogs-feedstock.mark ) && true) || ( (echo "verboselogs-feedstock" >>failed.28 ) && (echo "verboselogs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "verboselogs-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f vyper-config-feedstock.mark ]]; then
    if [[ -d vyper-config-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./vyper-config-feedstock >d 2>&1 && rm -f d && ( echo "done" >>vyper-config-feedstock.mark ) && true) || ( (echo "vyper-config-feedstock" >>failed.28 ) && (echo "vyper-config-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "vyper-config-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f ws4py-feedstock.mark ]]; then
    if [[ -d ws4py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ws4py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ws4py-feedstock.mark ) && true) || ( (echo "ws4py-feedstock" >>failed.28 ) && (echo "ws4py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ws4py-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f xcb-proto-feedstock.mark ]]; then
    if [[ -d xcb-proto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xcb-proto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xcb-proto-feedstock.mark ) && true) || ( (echo "xcb-proto-feedstock" >>failed.28 ) && (echo "xcb-proto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xcb-proto-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f xlwings-feedstock.mark ]]; then
    if [[ -d xlwings-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xlwings-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xlwings-feedstock.mark ) && true) || ( (echo "xlwings-feedstock" >>failed.28 ) && (echo "xlwings-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xlwings-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f xlwt-feedstock.mark ]]; then
    if [[ -d xlwt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xlwt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xlwt-feedstock.mark ) && true) || ( (echo "xlwt-feedstock" >>failed.28 ) && (echo "xlwt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xlwt-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f yt-feedstock.mark ]]; then
    if [[ -d yt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./yt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>yt-feedstock.mark ) && true) || ( (echo "yt-feedstock" >>failed.28 ) && (echo "yt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "yt-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f zeep-feedstock.mark ]]; then
    if [[ -d zeep-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zeep-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zeep-feedstock.mark ) && true) || ( (echo "zeep-feedstock" >>failed.28 ) && (echo "zeep-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zeep-feedstock not present" >>failed.28
    fi
fi


if [[ ! -f zfpy-feedstock.mark ]]; then
    if [[ -d zfpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zfpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zfpy-feedstock.mark ) && true) || ( (echo "zfpy-feedstock" >>failed.28 ) && (echo "zfpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zfpy-feedstock not present" >>failed.28
    fi
fi

