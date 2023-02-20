#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f accelerate-feedstock.mark ]]; then
    if [[ -d accelerate-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./accelerate-feedstock >d 2>&1 && rm -f d && ( echo "done" >>accelerate-feedstock.mark ) && true) || ( (echo "accelerate-feedstock" >>failed.24 ) && (echo "accelerate-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "accelerate-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f aiopg-feedstock.mark ]]; then
    if [[ -d aiopg-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aiopg-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aiopg-feedstock.mark ) && true) || ( (echo "aiopg-feedstock" >>failed.24 ) && (echo "aiopg-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aiopg-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f alembic-feedstock.mark ]]; then
    if [[ -d alembic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./alembic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>alembic-feedstock.mark ) && true) || ( (echo "alembic-feedstock" >>failed.24 ) && (echo "alembic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "alembic-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f anaconda-clean-feedstock.mark ]]; then
    if [[ -d anaconda-clean-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-clean-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-clean-feedstock.mark ) && true) || ( (echo "anaconda-clean-feedstock" >>failed.24 ) && (echo "anaconda-clean-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-clean-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f anaconda-linter-feedstock.mark ]]; then
    if [[ -d anaconda-linter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-linter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-linter-feedstock.mark ) && true) || ( (echo "anaconda-linter-feedstock" >>failed.24 ) && (echo "anaconda-linter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-linter-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f anaconda-project-feedstock.mark ]]; then
    if [[ -d anaconda-project-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anaconda-project-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anaconda-project-feedstock.mark ) && true) || ( (echo "anaconda-project-feedstock" >>failed.24 ) && (echo "anaconda-project-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anaconda-project-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f anyjson-feedstock.mark ]]; then
    if [[ -d anyjson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./anyjson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>anyjson-feedstock.mark ) && true) || ( (echo "anyjson-feedstock" >>failed.24 ) && (echo "anyjson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "anyjson-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apache-airflow-providers-common-sql-feedstock.mark ]]; then
    if [[ -d apache-airflow-providers-common-sql-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-airflow-providers-common-sql-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-airflow-providers-common-sql-feedstock.mark ) && true) || ( (echo "apache-airflow-providers-common-sql-feedstock" >>failed.24 ) && (echo "apache-airflow-providers-common-sql-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-airflow-providers-common-sql-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apache-airflow-providers-ftp-feedstock.mark ]]; then
    if [[ -d apache-airflow-providers-ftp-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-airflow-providers-ftp-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-airflow-providers-ftp-feedstock.mark ) && true) || ( (echo "apache-airflow-providers-ftp-feedstock" >>failed.24 ) && (echo "apache-airflow-providers-ftp-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-airflow-providers-ftp-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apache-airflow-providers-http-feedstock.mark ]]; then
    if [[ -d apache-airflow-providers-http-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-airflow-providers-http-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-airflow-providers-http-feedstock.mark ) && true) || ( (echo "apache-airflow-providers-http-feedstock" >>failed.24 ) && (echo "apache-airflow-providers-http-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-airflow-providers-http-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apache-airflow-providers-imap-feedstock.mark ]]; then
    if [[ -d apache-airflow-providers-imap-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-airflow-providers-imap-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-airflow-providers-imap-feedstock.mark ) && true) || ( (echo "apache-airflow-providers-imap-feedstock" >>failed.24 ) && (echo "apache-airflow-providers-imap-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-airflow-providers-imap-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apache-airflow-providers-sqlite-feedstock.mark ]]; then
    if [[ -d apache-airflow-providers-sqlite-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apache-airflow-providers-sqlite-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apache-airflow-providers-sqlite-feedstock.mark ) && true) || ( (echo "apache-airflow-providers-sqlite-feedstock" >>failed.24 ) && (echo "apache-airflow-providers-sqlite-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apache-airflow-providers-sqlite-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f apipkg-feedstock.mark ]]; then
    if [[ -d apipkg-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./apipkg-feedstock >d 2>&1 && rm -f d && ( echo "done" >>apipkg-feedstock.mark ) && true) || ( (echo "apipkg-feedstock" >>failed.24 ) && (echo "apipkg-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "apipkg-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f arrow-feedstock.mark ]]; then
    if [[ -d arrow-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./arrow-feedstock >d 2>&1 && rm -f d && ( echo "done" >>arrow-feedstock.mark ) && true) || ( (echo "arrow-feedstock" >>failed.24 ) && (echo "arrow-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "arrow-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f asn1crypto-feedstock.mark ]]; then
    if [[ -d asn1crypto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asn1crypto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asn1crypto-feedstock.mark ) && true) || ( (echo "asn1crypto-feedstock" >>failed.24 ) && (echo "asn1crypto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asn1crypto-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f astor-feedstock.mark ]]; then
    if [[ -d astor-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./astor-feedstock >d 2>&1 && rm -f d && ( echo "done" >>astor-feedstock.mark ) && true) || ( (echo "astor-feedstock" >>failed.24 ) && (echo "astor-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "astor-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f astropy-feedstock.mark ]]; then
    if [[ -d astropy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./astropy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>astropy-feedstock.mark ) && true) || ( (echo "astropy-feedstock" >>failed.24 ) && (echo "astropy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "astropy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f asyncpg-feedstock.mark ]]; then
    if [[ -d asyncpg-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./asyncpg-feedstock >d 2>&1 && rm -f d && ( echo "done" >>asyncpg-feedstock.mark ) && true) || ( (echo "asyncpg-feedstock" >>failed.24 ) && (echo "asyncpg-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "asyncpg-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f atlasclient-feedstock.mark ]]; then
    if [[ -d atlasclient-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./atlasclient-feedstock >d 2>&1 && rm -f d && ( echo "done" >>atlasclient-feedstock.mark ) && true) || ( (echo "atlasclient-feedstock" >>failed.24 ) && (echo "atlasclient-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "atlasclient-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f atom-feedstock.mark ]]; then
    if [[ -d atom-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./atom-feedstock >d 2>&1 && rm -f d && ( echo "done" >>atom-feedstock.mark ) && true) || ( (echo "atom-feedstock" >>failed.24 ) && (echo "atom-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "atom-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f authlib-feedstock.mark ]]; then
    if [[ -d authlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./authlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>authlib-feedstock.mark ) && true) || ( (echo "authlib-feedstock" >>failed.24 ) && (echo "authlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "authlib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f aws-xray-sdk-feedstock.mark ]]; then
    if [[ -d aws-xray-sdk-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./aws-xray-sdk-feedstock >d 2>&1 && rm -f d && ( echo "done" >>aws-xray-sdk-feedstock.mark ) && true) || ( (echo "aws-xray-sdk-feedstock" >>failed.24 ) && (echo "aws-xray-sdk-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "aws-xray-sdk-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f backports.weakref-feedstock.mark ]]; then
    if [[ -d backports.weakref-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./backports.weakref-feedstock >d 2>&1 && rm -f d && ( echo "done" >>backports.weakref-feedstock.mark ) && true) || ( (echo "backports.weakref-feedstock" >>failed.24 ) && (echo "backports.weakref-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "backports.weakref-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f backports_abc-feedstock.mark ]]; then
    if [[ -d backports_abc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./backports_abc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>backports_abc-feedstock.mark ) && true) || ( (echo "backports_abc-feedstock" >>failed.24 ) && (echo "backports_abc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "backports_abc-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f bcj-cffi-feedstock.mark ]]; then
    if [[ -d bcj-cffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bcj-cffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bcj-cffi-feedstock.mark ) && true) || ( (echo "bcj-cffi-feedstock" >>failed.24 ) && (echo "bcj-cffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bcj-cffi-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f biopython-feedstock.mark ]]; then
    if [[ -d biopython-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./biopython-feedstock >d 2>&1 && rm -f d && ( echo "done" >>biopython-feedstock.mark ) && true) || ( (echo "biopython-feedstock" >>failed.24 ) && (echo "biopython-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "biopython-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f bitarray-feedstock.mark ]]; then
    if [[ -d bitarray-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bitarray-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bitarray-feedstock.mark ) && true) || ( (echo "bitarray-feedstock" >>failed.24 ) && (echo "bitarray-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bitarray-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f bkcharts-feedstock.mark ]]; then
    if [[ -d bkcharts-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./bkcharts-feedstock >d 2>&1 && rm -f d && ( echo "done" >>bkcharts-feedstock.mark ) && true) || ( (echo "bkcharts-feedstock" >>failed.24 ) && (echo "bkcharts-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "bkcharts-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f boltons-feedstock.mark ]]; then
    if [[ -d boltons-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boltons-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boltons-feedstock.mark ) && true) || ( (echo "boltons-feedstock" >>failed.24 ) && (echo "boltons-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boltons-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f boto3-feedstock.mark ]]; then
    if [[ -d boto3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./boto3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>boto3-feedstock.mark ) && true) || ( (echo "boto3-feedstock" >>failed.24 ) && (echo "boto3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "boto3-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f brotlicffi-feedstock.mark ]]; then
    if [[ -d brotlicffi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./brotlicffi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>brotlicffi-feedstock.mark ) && true) || ( (echo "brotlicffi-feedstock" >>failed.24 ) && (echo "brotlicffi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "brotlicffi-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f category_encoders-feedstock.mark ]]; then
    if [[ -d category_encoders-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./category_encoders-feedstock >d 2>&1 && rm -f d && ( echo "done" >>category_encoders-feedstock.mark ) && true) || ( (echo "category_encoders-feedstock" >>failed.24 ) && (echo "category_encoders-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "category_encoders-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cattrs-feedstock.mark ]]; then
    if [[ -d cattrs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cattrs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cattrs-feedstock.mark ) && true) || ( (echo "cattrs-feedstock" >>failed.24 ) && (echo "cattrs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cattrs-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cftime-feedstock.mark ]]; then
    if [[ -d cftime-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cftime-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cftime-feedstock.mark ) && true) || ( (echo "cftime-feedstock" >>failed.24 ) && (echo "cftime-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cftime-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cgroupspy-feedstock.mark ]]; then
    if [[ -d cgroupspy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cgroupspy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cgroupspy-feedstock.mark ) && true) || ( (echo "cgroupspy-feedstock" >>failed.24 ) && (echo "cgroupspy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cgroupspy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cheroot-feedstock.mark ]]; then
    if [[ -d cheroot-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cheroot-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cheroot-feedstock.mark ) && true) || ( (echo "cheroot-feedstock" >>failed.24 ) && (echo "cheroot-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cheroot-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f clickhouse-cityhash-feedstock.mark ]]; then
    if [[ -d clickhouse-cityhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./clickhouse-cityhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>clickhouse-cityhash-feedstock.mark ) && true) || ( (echo "clickhouse-cityhash-feedstock" >>failed.24 ) && (echo "clickhouse-cityhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "clickhouse-cityhash-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f colorcet-feedstock.mark ]]; then
    if [[ -d colorcet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colorcet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colorcet-feedstock.mark ) && true) || ( (echo "colorcet-feedstock" >>failed.24 ) && (echo "colorcet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colorcet-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f coloredlogs-feedstock.mark ]]; then
    if [[ -d coloredlogs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./coloredlogs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>coloredlogs-feedstock.mark ) && true) || ( (echo "coloredlogs-feedstock" >>failed.24 ) && (echo "coloredlogs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "coloredlogs-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f colorlog-feedstock.mark ]]; then
    if [[ -d colorlog-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colorlog-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colorlog-feedstock.mark ) && true) || ( (echo "colorlog-feedstock" >>failed.24 ) && (echo "colorlog-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colorlog-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f colour-feedstock.mark ]]; then
    if [[ -d colour-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./colour-feedstock >d 2>&1 && rm -f d && ( echo "done" >>colour-feedstock.mark ) && true) || ( (echo "colour-feedstock" >>failed.24 ) && (echo "colour-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "colour-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f comm-feedstock.mark ]]; then
    if [[ -d comm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./comm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>comm-feedstock.mark ) && true) || ( (echo "comm-feedstock" >>failed.24 ) && (echo "comm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "comm-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f conda-content-trust-feedstock.mark ]]; then
    if [[ -d conda-content-trust-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-content-trust-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-content-trust-feedstock.mark ) && true) || ( (echo "conda-content-trust-feedstock" >>failed.24 ) && (echo "conda-content-trust-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-content-trust-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f conda-index-feedstock.mark ]]; then
    if [[ -d conda-index-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-index-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-index-feedstock.mark ) && true) || ( (echo "conda-index-feedstock" >>failed.24 ) && (echo "conda-index-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-index-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f conda-libmamba-solver-feedstock.mark ]]; then
    if [[ -d conda-libmamba-solver-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-libmamba-solver-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-libmamba-solver-feedstock.mark ) && true) || ( (echo "conda-libmamba-solver-feedstock" >>failed.24 ) && (echo "conda-libmamba-solver-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-libmamba-solver-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f conda-lock-feedstock.mark ]]; then
    if [[ -d conda-lock-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./conda-lock-feedstock >d 2>&1 && rm -f d && ( echo "done" >>conda-lock-feedstock.mark ) && true) || ( (echo "conda-lock-feedstock" >>failed.24 ) && (echo "conda-lock-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "conda-lock-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f configupdater-feedstock.mark ]]; then
    if [[ -d configupdater-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./configupdater-feedstock >d 2>&1 && rm -f d && ( echo "done" >>configupdater-feedstock.mark ) && true) || ( (echo "configupdater-feedstock" >>failed.24 ) && (echo "configupdater-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "configupdater-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f constructor-feedstock.mark ]]; then
    if [[ -d constructor-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./constructor-feedstock >d 2>&1 && rm -f d && ( echo "done" >>constructor-feedstock.mark ) && true) || ( (echo "constructor-feedstock" >>failed.24 ) && (echo "constructor-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "constructor-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cron-descriptor-feedstock.mark ]]; then
    if [[ -d cron-descriptor-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cron-descriptor-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cron-descriptor-feedstock.mark ) && true) || ( (echo "cron-descriptor-feedstock" >>failed.24 ) && (echo "cron-descriptor-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cron-descriptor-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f croniter-feedstock.mark ]]; then
    if [[ -d croniter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./croniter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>croniter-feedstock.mark ) && true) || ( (echo "croniter-feedstock" >>failed.24 ) && (echo "croniter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "croniter-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cryptography-vectors-feedstock.mark ]]; then
    if [[ -d cryptography-vectors-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cryptography-vectors-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cryptography-vectors-feedstock.mark ) && true) || ( (echo "cryptography-vectors-feedstock" >>failed.24 ) && (echo "cryptography-vectors-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cryptography-vectors-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cryptominisat-feedstock.mark ]]; then
    if [[ -d cryptominisat-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cryptominisat-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cryptominisat-feedstock.mark ) && true) || ( (echo "cryptominisat-feedstock" >>failed.24 ) && (echo "cryptominisat-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cryptominisat-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cx_oracle-feedstock.mark ]]; then
    if [[ -d cx_oracle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cx_oracle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cx_oracle-feedstock.mark ) && true) || ( (echo "cx_oracle-feedstock" >>failed.24 ) && (echo "cx_oracle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cx_oracle-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f cython-blis-feedstock.mark ]]; then
    if [[ -d cython-blis-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./cython-blis-feedstock >d 2>&1 && rm -f d && ( echo "done" >>cython-blis-feedstock.mark ) && true) || ( (echo "cython-blis-feedstock" >>failed.24 ) && (echo "cython-blis-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "cython-blis-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f dash-feedstock.mark ]]; then
    if [[ -d dash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dash-feedstock.mark ) && true) || ( (echo "dash-feedstock" >>failed.24 ) && (echo "dash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dash-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f dask-glm-feedstock.mark ]]; then
    if [[ -d dask-glm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dask-glm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dask-glm-feedstock.mark ) && true) || ( (echo "dask-glm-feedstock" >>failed.24 ) && (echo "dask-glm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dask-glm-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f dateparser-feedstock.mark ]]; then
    if [[ -d dateparser-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dateparser-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dateparser-feedstock.mark ) && true) || ( (echo "dateparser-feedstock" >>failed.24 ) && (echo "dateparser-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dateparser-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f dbus-python-feedstock.mark ]]; then
    if [[ -d dbus-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./dbus-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>dbus-python-feedstock.mark ) && true) || ( (echo "dbus-python-feedstock" >>failed.24 ) && (echo "dbus-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "dbus-python-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f django-feedstock.mark ]]; then
    if [[ -d django-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./django-feedstock >d 2>&1 && rm -f d && ( echo "done" >>django-feedstock.mark ) && true) || ( (echo "django-feedstock" >>failed.24 ) && (echo "django-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "django-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f docstring-to-markdown-feedstock.mark ]]; then
    if [[ -d docstring-to-markdown-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./docstring-to-markdown-feedstock >d 2>&1 && rm -f d && ( echo "done" >>docstring-to-markdown-feedstock.mark ) && true) || ( (echo "docstring-to-markdown-feedstock" >>failed.24 ) && (echo "docstring-to-markdown-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "docstring-to-markdown-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f editdistance-feedstock.mark ]]; then
    if [[ -d editdistance-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./editdistance-feedstock >d 2>&1 && rm -f d && ( echo "done" >>editdistance-feedstock.mark ) && true) || ( (echo "editdistance-feedstock" >>failed.24 ) && (echo "editdistance-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "editdistance-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f eventlet-feedstock.mark ]]; then
    if [[ -d eventlet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./eventlet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>eventlet-feedstock.mark ) && true) || ( (echo "eventlet-feedstock" >>failed.24 ) && (echo "eventlet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "eventlet-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f fastcache-feedstock.mark ]]; then
    if [[ -d fastcache-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastcache-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastcache-feedstock.mark ) && true) || ( (echo "fastcache-feedstock" >>failed.24 ) && (echo "fastcache-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastcache-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f fastcluster-feedstock.mark ]]; then
    if [[ -d fastcluster-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./fastcluster-feedstock >d 2>&1 && rm -f d && ( echo "done" >>fastcluster-feedstock.mark ) && true) || ( (echo "fastcluster-feedstock" >>failed.24 ) && (echo "fastcluster-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "fastcluster-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-admin-feedstock.mark ]]; then
    if [[ -d flask-admin-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-admin-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-admin-feedstock.mark ) && true) || ( (echo "flask-admin-feedstock" >>failed.24 ) && (echo "flask-admin-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-admin-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-apscheduler-feedstock.mark ]]; then
    if [[ -d flask-apscheduler-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-apscheduler-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-apscheduler-feedstock.mark ) && true) || ( (echo "flask-apscheduler-feedstock" >>failed.24 ) && (echo "flask-apscheduler-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-apscheduler-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-bcrypt-feedstock.mark ]]; then
    if [[ -d flask-bcrypt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-bcrypt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-bcrypt-feedstock.mark ) && true) || ( (echo "flask-bcrypt-feedstock" >>failed.24 ) && (echo "flask-bcrypt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-bcrypt-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-caching-feedstock.mark ]]; then
    if [[ -d flask-caching-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-caching-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-caching-feedstock.mark ) && true) || ( (echo "flask-caching-feedstock" >>failed.24 ) && (echo "flask-caching-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-caching-feedstock not present" >>failed.24
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


if [[ ! -f flask-openid-feedstock.mark ]]; then
    if [[ -d flask-openid-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-openid-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-openid-feedstock.mark ) && true) || ( (echo "flask-openid-feedstock" >>failed.24 ) && (echo "flask-openid-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-openid-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-restful-feedstock.mark ]]; then
    if [[ -d flask-restful-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-restful-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-restful-feedstock.mark ) && true) || ( (echo "flask-restful-feedstock" >>failed.24 ) && (echo "flask-restful-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-restful-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-restx-feedstock.mark ]]; then
    if [[ -d flask-restx-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-restx-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-restx-feedstock.mark ) && true) || ( (echo "flask-restx-feedstock" >>failed.24 ) && (echo "flask-restx-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-restx-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-session-feedstock.mark ]]; then
    if [[ -d flask-session-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-session-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-session-feedstock.mark ) && true) || ( (echo "flask-session-feedstock" >>failed.24 ) && (echo "flask-session-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-session-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f flask-socketio-feedstock.mark ]]; then
    if [[ -d flask-socketio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./flask-socketio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>flask-socketio-feedstock.mark ) && true) || ( (echo "flask-socketio-feedstock" >>failed.24 ) && (echo "flask-socketio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "flask-socketio-feedstock not present" >>failed.24
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


if [[ ! -f folium-feedstock.mark ]]; then
    if [[ -d folium-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./folium-feedstock >d 2>&1 && rm -f d && ( echo "done" >>folium-feedstock.mark ) && true) || ( (echo "folium-feedstock" >>failed.24 ) && (echo "folium-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "folium-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f geoviews-core-feedstock.mark ]]; then
    if [[ -d geoviews-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./geoviews-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>geoviews-core-feedstock.mark ) && true) || ( (echo "geoviews-core-feedstock" >>failed.24 ) && (echo "geoviews-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "geoviews-core-feedstock not present" >>failed.24
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


if [[ ! -f google-auth-oauthlib-feedstock.mark ]]; then
    if [[ -d google-auth-oauthlib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-auth-oauthlib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-auth-oauthlib-feedstock.mark ) && true) || ( (echo "google-auth-oauthlib-feedstock" >>failed.24 ) && (echo "google-auth-oauthlib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-auth-oauthlib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f google-cloud-storage-feedstock.mark ]]; then
    if [[ -d google-cloud-storage-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./google-cloud-storage-feedstock >d 2>&1 && rm -f d && ( echo "done" >>google-cloud-storage-feedstock.mark ) && true) || ( (echo "google-cloud-storage-feedstock" >>failed.24 ) && (echo "google-cloud-storage-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "google-cloud-storage-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f graphql-core-feedstock.mark ]]; then
    if [[ -d graphql-core-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./graphql-core-feedstock >d 2>&1 && rm -f d && ( echo "done" >>graphql-core-feedstock.mark ) && true) || ( (echo "graphql-core-feedstock" >>failed.24 ) && (echo "graphql-core-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "graphql-core-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f h5py-feedstock.mark ]]; then
    if [[ -d h5py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./h5py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>h5py-feedstock.mark ) && true) || ( (echo "h5py-feedstock" >>failed.24 ) && (echo "h5py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "h5py-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f hdmedians-feedstock.mark ]]; then
    if [[ -d hdmedians-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hdmedians-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hdmedians-feedstock.mark ) && true) || ( (echo "hdmedians-feedstock" >>failed.24 ) && (echo "hdmedians-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hdmedians-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f hiredis-feedstock.mark ]]; then
    if [[ -d hiredis-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hiredis-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hiredis-feedstock.mark ) && true) || ( (echo "hiredis-feedstock" >>failed.24 ) && (echo "hiredis-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hiredis-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f holidays-feedstock.mark ]]; then
    if [[ -d holidays-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./holidays-feedstock >d 2>&1 && rm -f d && ( echo "done" >>holidays-feedstock.mark ) && true) || ( (echo "holidays-feedstock" >>failed.24 ) && (echo "holidays-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "holidays-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f hsluv-feedstock.mark ]]; then
    if [[ -d hsluv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./hsluv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>hsluv-feedstock.mark ) && true) || ( (echo "hsluv-feedstock" >>failed.24 ) && (echo "hsluv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "hsluv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f huggingface_hub-feedstock.mark ]]; then
    if [[ -d huggingface_hub-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./huggingface_hub-feedstock >d 2>&1 && rm -f d && ( echo "done" >>huggingface_hub-feedstock.mark ) && true) || ( (echo "huggingface_hub-feedstock" >>failed.24 ) && (echo "huggingface_hub-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "huggingface_hub-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ijson-feedstock.mark ]]; then
    if [[ -d ijson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ijson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ijson-feedstock.mark ) && true) || ( (echo "ijson-feedstock" >>failed.24 ) && (echo "ijson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ijson-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f immutables-feedstock.mark ]]; then
    if [[ -d immutables-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./immutables-feedstock >d 2>&1 && rm -f d && ( echo "done" >>immutables-feedstock.mark ) && true) || ( (echo "immutables-feedstock" >>failed.24 ) && (echo "immutables-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "immutables-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f inflect-feedstock.mark ]]; then
    if [[ -d inflect-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./inflect-feedstock >d 2>&1 && rm -f d && ( echo "done" >>inflect-feedstock.mark ) && true) || ( (echo "inflect-feedstock" >>failed.24 ) && (echo "inflect-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "inflect-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ipyparallel-feedstock.mark ]]; then
    if [[ -d ipyparallel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipyparallel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipyparallel-feedstock.mark ) && true) || ( (echo "ipyparallel-feedstock" >>failed.24 ) && (echo "ipyparallel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipyparallel-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f ipython-sql-feedstock.mark ]]; then
    if [[ -d ipython-sql-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./ipython-sql-feedstock >d 2>&1 && rm -f d && ( echo "done" >>ipython-sql-feedstock.mark ) && true) || ( (echo "ipython-sql-feedstock" >>failed.24 ) && (echo "ipython-sql-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "ipython-sql-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jellyfish-feedstock.mark ]]; then
    if [[ -d jellyfish-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jellyfish-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jellyfish-feedstock.mark ) && true) || ( (echo "jellyfish-feedstock" >>failed.24 ) && (echo "jellyfish-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jellyfish-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jpype1-feedstock.mark ]]; then
    if [[ -d jpype1-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jpype1-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jpype1-feedstock.mark ) && true) || ( (echo "jpype1-feedstock" >>failed.24 ) && (echo "jpype1-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jpype1-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jsonpickle-feedstock.mark ]]; then
    if [[ -d jsonpickle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jsonpickle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jsonpickle-feedstock.mark ) && true) || ( (echo "jsonpickle-feedstock" >>failed.24 ) && (echo "jsonpickle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jsonpickle-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jupyter_kernel_gateway-feedstock.mark ]]; then
    if [[ -d jupyter_kernel_gateway-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyter_kernel_gateway-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyter_kernel_gateway-feedstock.mark ) && true) || ( (echo "jupyter_kernel_gateway-feedstock" >>failed.24 ) && (echo "jupyter_kernel_gateway-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyter_kernel_gateway-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f jupyterlab_launcher-feedstock.mark ]]; then
    if [[ -d jupyterlab_launcher-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jupyterlab_launcher-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jupyterlab_launcher-feedstock.mark ) && true) || ( (echo "jupyterlab_launcher-feedstock" >>failed.24 ) && (echo "jupyterlab_launcher-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jupyterlab_launcher-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f kombu-feedstock.mark ]]; then
    if [[ -d kombu-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./kombu-feedstock >d 2>&1 && rm -f d && ( echo "done" >>kombu-feedstock.mark ) && true) || ( (echo "kombu-feedstock" >>failed.24 ) && (echo "kombu-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "kombu-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f lark-feedstock.mark ]]; then
    if [[ -d lark-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lark-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lark-feedstock.mark ) && true) || ( (echo "lark-feedstock" >>failed.24 ) && (echo "lark-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lark-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f leather-feedstock.mark ]]; then
    if [[ -d leather-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./leather-feedstock >d 2>&1 && rm -f d && ( echo "done" >>leather-feedstock.mark ) && true) || ( (echo "leather-feedstock" >>failed.24 ) && (echo "leather-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "leather-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f lightgbm-feedstock.mark ]]; then
    if [[ -d lightgbm-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lightgbm-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lightgbm-feedstock.mark ) && true) || ( (echo "lightgbm-feedstock" >>failed.24 ) && (echo "lightgbm-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lightgbm-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f linkify-it-py-feedstock.mark ]]; then
    if [[ -d linkify-it-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./linkify-it-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>linkify-it-py-feedstock.mark ) && true) || ( (echo "linkify-it-py-feedstock" >>failed.24 ) && (echo "linkify-it-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "linkify-it-py-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f llvmdev-feedstock.mark ]]; then
    if [[ -d llvmdev-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./llvmdev-feedstock >d 2>&1 && rm -f d && ( echo "done" >>llvmdev-feedstock.mark ) && true) || ( (echo "llvmdev-feedstock" >>failed.24 ) && (echo "llvmdev-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "llvmdev-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f loguru-feedstock.mark ]]; then
    if [[ -d loguru-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./loguru-feedstock >d 2>&1 && rm -f d && ( echo "done" >>loguru-feedstock.mark ) && true) || ( (echo "loguru-feedstock" >>failed.24 ) && (echo "loguru-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "loguru-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f macholib-feedstock.mark ]]; then
    if [[ -d macholib-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./macholib-feedstock >d 2>&1 && rm -f d && ( echo "done" >>macholib-feedstock.mark ) && true) || ( (echo "macholib-feedstock" >>failed.24 ) && (echo "macholib-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "macholib-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mapclassify-feedstock.mark ]]; then
    if [[ -d mapclassify-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mapclassify-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mapclassify-feedstock.mark ) && true) || ( (echo "mapclassify-feedstock" >>failed.24 ) && (echo "mapclassify-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mapclassify-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f markdown-feedstock.mark ]]; then
    if [[ -d markdown-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./markdown-feedstock >d 2>&1 && rm -f d && ( echo "done" >>markdown-feedstock.mark ) && true) || ( (echo "markdown-feedstock" >>failed.24 ) && (echo "markdown-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "markdown-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f marshmallow-enum-feedstock.mark ]]; then
    if [[ -d marshmallow-enum-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./marshmallow-enum-feedstock >d 2>&1 && rm -f d && ( echo "done" >>marshmallow-enum-feedstock.mark ) && true) || ( (echo "marshmallow-enum-feedstock" >>failed.24 ) && (echo "marshmallow-enum-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "marshmallow-enum-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f marshmallow-oneofschema-feedstock.mark ]]; then
    if [[ -d marshmallow-oneofschema-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./marshmallow-oneofschema-feedstock >d 2>&1 && rm -f d && ( echo "done" >>marshmallow-oneofschema-feedstock.mark ) && true) || ( (echo "marshmallow-oneofschema-feedstock" >>failed.24 ) && (echo "marshmallow-oneofschema-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "marshmallow-oneofschema-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f matrixprofile-feedstock.mark ]]; then
    if [[ -d matrixprofile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./matrixprofile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>matrixprofile-feedstock.mark ) && true) || ( (echo "matrixprofile-feedstock" >>failed.24 ) && (echo "matrixprofile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "matrixprofile-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mdit-py-plugins-feedstock.mark ]]; then
    if [[ -d mdit-py-plugins-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mdit-py-plugins-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mdit-py-plugins-feedstock.mark ) && true) || ( (echo "mdit-py-plugins-feedstock" >>failed.24 ) && (echo "mdit-py-plugins-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mdit-py-plugins-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f meson-python-feedstock.mark ]]; then
    if [[ -d meson-python-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./meson-python-feedstock >d 2>&1 && rm -f d && ( echo "done" >>meson-python-feedstock.mark ) && true) || ( (echo "meson-python-feedstock" >>failed.24 ) && (echo "meson-python-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "meson-python-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mmh3-feedstock.mark ]]; then
    if [[ -d mmh3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mmh3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mmh3-feedstock.mark ) && true) || ( (echo "mmh3-feedstock" >>failed.24 ) && (echo "mmh3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mmh3-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mpld3-feedstock.mark ]]; then
    if [[ -d mpld3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mpld3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mpld3-feedstock.mark ) && true) || ( (echo "mpld3-feedstock" >>failed.24 ) && (echo "mpld3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mpld3-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f multiprocess-feedstock.mark ]]; then
    if [[ -d multiprocess-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./multiprocess-feedstock >d 2>&1 && rm -f d && ( echo "done" >>multiprocess-feedstock.mark ) && true) || ( (echo "multiprocess-feedstock" >>failed.24 ) && (echo "multiprocess-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "multiprocess-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f murmurhash-feedstock.mark ]]; then
    if [[ -d murmurhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./murmurhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>murmurhash-feedstock.mark ) && true) || ( (echo "murmurhash-feedstock" >>failed.24 ) && (echo "murmurhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "murmurhash-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mxnet-feedstock.mark ]]; then
    if [[ -d mxnet-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mxnet-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mxnet-feedstock.mark ) && true) || ( (echo "mxnet-feedstock" >>failed.24 ) && (echo "mxnet-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mxnet-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f mypy-feedstock.mark ]]; then
    if [[ -d mypy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mypy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mypy-feedstock.mark ) && true) || ( (echo "mypy-feedstock" >>failed.24 ) && (echo "mypy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mypy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f nbsmoke-feedstock.mark ]]; then
    if [[ -d nbsmoke-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbsmoke-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbsmoke-feedstock.mark ) && true) || ( (echo "nbsmoke-feedstock" >>failed.24 ) && (echo "nbsmoke-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbsmoke-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f nose_parameterized-feedstock.mark ]]; then
    if [[ -d nose_parameterized-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nose_parameterized-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nose_parameterized-feedstock.mark ) && true) || ( (echo "nose_parameterized-feedstock" >>failed.24 ) && (echo "nose_parameterized-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nose_parameterized-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f numpydoc-feedstock.mark ]]; then
    if [[ -d numpydoc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./numpydoc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>numpydoc-feedstock.mark ) && true) || ( (echo "numpydoc-feedstock" >>failed.24 ) && (echo "numpydoc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "numpydoc-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f onnxmltools-feedstock.mark ]]; then
    if [[ -d onnxmltools-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./onnxmltools-feedstock >d 2>&1 && rm -f d && ( echo "done" >>onnxmltools-feedstock.mark ) && true) || ( (echo "onnxmltools-feedstock" >>failed.24 ) && (echo "onnxmltools-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "onnxmltools-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f openpyxl-feedstock.mark ]]; then
    if [[ -d openpyxl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./openpyxl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>openpyxl-feedstock.mark ) && true) || ( (echo "openpyxl-feedstock" >>failed.24 ) && (echo "openpyxl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "openpyxl-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pandarallel-feedstock.mark ]]; then
    if [[ -d pandarallel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandarallel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandarallel-feedstock.mark ) && true) || ( (echo "pandarallel-feedstock" >>failed.24 ) && (echo "pandarallel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandarallel-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pandas-profiling-feedstock.mark ]]; then
    if [[ -d pandas-profiling-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandas-profiling-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandas-profiling-feedstock.mark ) && true) || ( (echo "pandas-profiling-feedstock" >>failed.24 ) && (echo "pandas-profiling-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandas-profiling-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pathlib2-feedstock.mark ]]; then
    if [[ -d pathlib2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pathlib2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pathlib2-feedstock.mark ) && true) || ( (echo "pathlib2-feedstock" >>failed.24 ) && (echo "pathlib2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pathlib2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pefile-feedstock.mark ]]; then
    if [[ -d pefile-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pefile-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pefile-feedstock.mark ) && true) || ( (echo "pefile-feedstock" >>failed.24 ) && (echo "pefile-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pefile-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pep8-feedstock.mark ]]; then
    if [[ -d pep8-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep8-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep8-feedstock.mark ) && true) || ( (echo "pep8-feedstock" >>failed.24 ) && (echo "pep8-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep8-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pep8-naming-feedstock.mark ]]; then
    if [[ -d pep8-naming-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pep8-naming-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pep8-naming-feedstock.mark ) && true) || ( (echo "pep8-naming-feedstock" >>failed.24 ) && (echo "pep8-naming-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pep8-naming-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pipenv-feedstock.mark ]]; then
    if [[ -d pipenv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pipenv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pipenv-feedstock.mark ) && true) || ( (echo "pipenv-feedstock" >>failed.24 ) && (echo "pipenv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pipenv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f plac-feedstock.mark ]]; then
    if [[ -d plac-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./plac-feedstock >d 2>&1 && rm -f d && ( echo "done" >>plac-feedstock.mark ) && true) || ( (echo "plac-feedstock" >>failed.24 ) && (echo "plac-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "plac-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f plyvel-feedstock.mark ]]; then
    if [[ -d plyvel-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./plyvel-feedstock >d 2>&1 && rm -f d && ( echo "done" >>plyvel-feedstock.mark ) && true) || ( (echo "plyvel-feedstock" >>failed.24 ) && (echo "plyvel-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "plyvel-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pmdarima-feedstock.mark ]]; then
    if [[ -d pmdarima-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pmdarima-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pmdarima-feedstock.mark ) && true) || ( (echo "pmdarima-feedstock" >>failed.24 ) && (echo "pmdarima-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pmdarima-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pre-commit-feedstock.mark ]]; then
    if [[ -d pre-commit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pre-commit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pre-commit-feedstock.mark ) && true) || ( (echo "pre-commit-feedstock" >>failed.24 ) && (echo "pre-commit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pre-commit-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pretend-feedstock.mark ]]; then
    if [[ -d pretend-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pretend-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pretend-feedstock.mark ) && true) || ( (echo "pretend-feedstock" >>failed.24 ) && (echo "pretend-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pretend-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f prison-feedstock.mark ]]; then
    if [[ -d prison-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./prison-feedstock >d 2>&1 && rm -f d && ( echo "done" >>prison-feedstock.mark ) && true) || ( (echo "prison-feedstock" >>failed.24 ) && (echo "prison-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "prison-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f progressbar2-feedstock.mark ]]; then
    if [[ -d progressbar2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./progressbar2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>progressbar2-feedstock.mark ) && true) || ( (echo "progressbar2-feedstock" >>failed.24 ) && (echo "progressbar2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "progressbar2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f proto-plus-feedstock.mark ]]; then
    if [[ -d proto-plus-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./proto-plus-feedstock >d 2>&1 && rm -f d && ( echo "done" >>proto-plus-feedstock.mark ) && true) || ( (echo "proto-plus-feedstock" >>failed.24 ) && (echo "proto-plus-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "proto-plus-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f py4j-feedstock.mark ]]; then
    if [[ -d py4j-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./py4j-feedstock >d 2>&1 && rm -f d && ( echo "done" >>py4j-feedstock.mark ) && true) || ( (echo "py4j-feedstock" >>failed.24 ) && (echo "py4j-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "py4j-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pycairo-feedstock.mark ]]; then
    if [[ -d pycairo-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycairo-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycairo-feedstock.mark ) && true) || ( (echo "pycairo-feedstock" >>failed.24 ) && (echo "pycairo-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycairo-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyclipper-feedstock.mark ]]; then
    if [[ -d pyclipper-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyclipper-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyclipper-feedstock.mark ) && true) || ( (echo "pyclipper-feedstock" >>failed.24 ) && (echo "pyclipper-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyclipper-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pycrypto-feedstock.mark ]]; then
    if [[ -d pycrypto-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycrypto-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycrypto-feedstock.mark ) && true) || ( (echo "pycrypto-feedstock" >>failed.24 ) && (echo "pycrypto-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycrypto-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pycryptodome-feedstock.mark ]]; then
    if [[ -d pycryptodome-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycryptodome-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycryptodome-feedstock.mark ) && true) || ( (echo "pycryptodome-feedstock" >>failed.24 ) && (echo "pycryptodome-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycryptodome-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pycryptodomex-feedstock.mark ]]; then
    if [[ -d pycryptodomex-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycryptodomex-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycryptodomex-feedstock.mark ) && true) || ( (echo "pycryptodomex-feedstock" >>failed.24 ) && (echo "pycryptodomex-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycryptodomex-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pycurl-feedstock.mark ]]; then
    if [[ -d pycurl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pycurl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pycurl-feedstock.mark ) && true) || ( (echo "pycurl-feedstock" >>failed.24 ) && (echo "pycurl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pycurl-feedstock not present" >>failed.24
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


if [[ ! -f pydot-feedstock.mark ]]; then
    if [[ -d pydot-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pydot-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pydot-feedstock.mark ) && true) || ( (echo "pydot-feedstock" >>failed.24 ) && (echo "pydot-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pydot-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyface-feedstock.mark ]]; then
    if [[ -d pyface-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyface-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyface-feedstock.mark ) && true) || ( (echo "pyface-feedstock" >>failed.24 ) && (echo "pyface-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyface-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pygraphviz-feedstock.mark ]]; then
    if [[ -d pygraphviz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pygraphviz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pygraphviz-feedstock.mark ) && true) || ( (echo "pygraphviz-feedstock" >>failed.24 ) && (echo "pygraphviz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pygraphviz-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyicu-feedstock.mark ]]; then
    if [[ -d pyicu-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyicu-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyicu-feedstock.mark ) && true) || ( (echo "pyicu-feedstock" >>failed.24 ) && (echo "pyicu-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyicu-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pykdtree-feedstock.mark ]]; then
    if [[ -d pykdtree-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pykdtree-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pykdtree-feedstock.mark ) && true) || ( (echo "pykdtree-feedstock" >>failed.24 ) && (echo "pykdtree-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pykdtree-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pylint-venv-feedstock.mark ]]; then
    if [[ -d pylint-venv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pylint-venv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pylint-venv-feedstock.mark ) && true) || ( (echo "pylint-venv-feedstock" >>failed.24 ) && (echo "pylint-venv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pylint-venv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pymc3-feedstock.mark ]]; then
    if [[ -d pymc3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pymc3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pymc3-feedstock.mark ) && true) || ( (echo "pymc3-feedstock" >>failed.24 ) && (echo "pymc3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pymc3-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pymssql-feedstock.mark ]]; then
    if [[ -d pymssql-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pymssql-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pymssql-feedstock.mark ) && true) || ( (echo "pymssql-feedstock" >>failed.24 ) && (echo "pymssql-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pymssql-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pynacl-feedstock.mark ]]; then
    if [[ -d pynacl-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pynacl-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pynacl-feedstock.mark ) && true) || ( (echo "pynacl-feedstock" >>failed.24 ) && (echo "pynacl-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pynacl-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyodbc-feedstock.mark ]]; then
    if [[ -d pyodbc-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyodbc-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyodbc-feedstock.mark ) && true) || ( (echo "pyodbc-feedstock" >>failed.24 ) && (echo "pyodbc-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyodbc-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pypdf2-feedstock.mark ]]; then
    if [[ -d pypdf2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pypdf2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pypdf2-feedstock.mark ) && true) || ( (echo "pypdf2-feedstock" >>failed.24 ) && (echo "pypdf2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pypdf2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyppmd-feedstock.mark ]]; then
    if [[ -d pyppmd-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyppmd-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyppmd-feedstock.mark ) && true) || ( (echo "pyppmd-feedstock" >>failed.24 ) && (echo "pyppmd-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyppmd-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyproj-feedstock.mark ]]; then
    if [[ -d pyproj-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyproj-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyproj-feedstock.mark ) && true) || ( (echo "pyproj-feedstock" >>failed.24 ) && (echo "pyproj-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyproj-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyqt-builder-feedstock.mark ]]; then
    if [[ -d pyqt-builder-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyqt-builder-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyqt-builder-feedstock.mark ) && true) || ( (echo "pyqt-builder-feedstock" >>failed.24 ) && (echo "pyqt-builder-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyqt-builder-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyserial-feedstock.mark ]]; then
    if [[ -d pyserial-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyserial-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyserial-feedstock.mark ) && true) || ( (echo "pyserial-feedstock" >>failed.24 ) && (echo "pyserial-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyserial-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyspnego-feedstock.mark ]]; then
    if [[ -d pyspnego-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyspnego-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyspnego-feedstock.mark ) && true) || ( (echo "pyspnego-feedstock" >>failed.24 ) && (echo "pyspnego-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyspnego-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytables-feedstock.mark ]]; then
    if [[ -d pytables-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytables-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytables-feedstock.mark ) && true) || ( (echo "pytables-feedstock" >>failed.24 ) && (echo "pytables-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytables-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-astropy-feedstock.mark ]]; then
    if [[ -d pytest-astropy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-astropy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-astropy-feedstock.mark ) && true) || ( (echo "pytest-astropy-feedstock" >>failed.24 ) && (echo "pytest-astropy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-astropy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-asyncio-feedstock.mark ]]; then
    if [[ -d pytest-asyncio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-asyncio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-asyncio-feedstock.mark ) && true) || ( (echo "pytest-asyncio-feedstock" >>failed.24 ) && (echo "pytest-asyncio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-asyncio-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-base-url-feedstock.mark ]]; then
    if [[ -d pytest-base-url-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-base-url-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-base-url-feedstock.mark ) && true) || ( (echo "pytest-base-url-feedstock" >>failed.24 ) && (echo "pytest-base-url-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-base-url-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-benchmark-feedstock.mark ]]; then
    if [[ -d pytest-benchmark-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-benchmark-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-benchmark-feedstock.mark ) && true) || ( (echo "pytest-benchmark-feedstock" >>failed.24 ) && (echo "pytest-benchmark-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-benchmark-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-describe-feedstock.mark ]]; then
    if [[ -d pytest-describe-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-describe-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-describe-feedstock.mark ) && true) || ( (echo "pytest-describe-feedstock" >>failed.24 ) && (echo "pytest-describe-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-describe-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-metadata-feedstock.mark ]]; then
    if [[ -d pytest-metadata-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-metadata-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-metadata-feedstock.mark ) && true) || ( (echo "pytest-metadata-feedstock" >>failed.24 ) && (echo "pytest-metadata-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-metadata-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytest-variables-feedstock.mark ]]; then
    if [[ -d pytest-variables-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytest-variables-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytest-variables-feedstock.mark ) && true) || ( (echo "pytest-variables-feedstock" >>failed.24 ) && (echo "pytest-variables-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytest-variables-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-bidi-feedstock.mark ]]; then
    if [[ -d python-bidi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-bidi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-bidi-feedstock.mark ) && true) || ( (echo "python-bidi-feedstock" >>failed.24 ) && (echo "python-bidi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-bidi-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-crfsuite-feedstock.mark ]]; then
    if [[ -d python-crfsuite-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-crfsuite-feedstock/ >d 2>&1 && rm -f d && ( echo "done" >>python-crfsuite-feedstock.mark ) && true) || ( (echo "python-crfsuite-feedstock" >>failed.24 ) && (echo "python-crfsuite-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-crfsuite-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-graphviz-feedstock.mark ]]; then
    if [[ -d python-graphviz-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-graphviz-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-graphviz-feedstock.mark ) && true) || ( (echo "python-graphviz-feedstock" >>failed.24 ) && (echo "python-graphviz-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-graphviz-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-hdfs-feedstock.mark ]]; then
    if [[ -d python-hdfs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-hdfs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-hdfs-feedstock.mark ) && true) || ( (echo "python-hdfs-feedstock" >>failed.24 ) && (echo "python-hdfs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-hdfs-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-kubernetes-feedstock.mark ]]; then
    if [[ -d python-kubernetes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-kubernetes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-kubernetes-feedstock.mark ) && true) || ( (echo "python-kubernetes-feedstock" >>failed.24 ) && (echo "python-kubernetes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-kubernetes-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-lsp-black-feedstock.mark ]]; then
    if [[ -d python-lsp-black-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-lsp-black-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-lsp-black-feedstock.mark ) && true) || ( (echo "python-lsp-black-feedstock" >>failed.24 ) && (echo "python-lsp-black-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-lsp-black-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-snappy-feedstock.mark ]]; then
    if [[ -d python-snappy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-snappy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-snappy-feedstock.mark ) && true) || ( (echo "python-snappy-feedstock" >>failed.24 ) && (echo "python-snappy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-snappy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f python-xxhash-feedstock.mark ]]; then
    if [[ -d python-xxhash-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./python-xxhash-feedstock >d 2>&1 && rm -f d && ( echo "done" >>python-xxhash-feedstock.mark ) && true) || ( (echo "python-xxhash-feedstock" >>failed.24 ) && (echo "python-xxhash-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "python-xxhash-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pytoolconfig-feedstock.mark ]]; then
    if [[ -d pytoolconfig-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pytoolconfig-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pytoolconfig-feedstock.mark ) && true) || ( (echo "pytoolconfig-feedstock" >>failed.24 ) && (echo "pytoolconfig-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pytoolconfig-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f pyzstd-feedstock.mark ]]; then
    if [[ -d pyzstd-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pyzstd-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pyzstd-feedstock.mark ) && true) || ( (echo "pyzstd-feedstock" >>failed.24 ) && (echo "pyzstd-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pyzstd-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f redis-py-feedstock.mark ]]; then
    if [[ -d redis-py-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./redis-py-feedstock >d 2>&1 && rm -f d && ( echo "done" >>redis-py-feedstock.mark ) && true) || ( (echo "redis-py-feedstock" >>failed.24 ) && (echo "redis-py-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "redis-py-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f reportlab-feedstock.mark ]]; then
    if [[ -d reportlab-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./reportlab-feedstock >d 2>&1 && rm -f d && ( echo "done" >>reportlab-feedstock.mark ) && true) || ( (echo "reportlab-feedstock" >>failed.24 ) && (echo "reportlab-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "reportlab-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f requests-futures-feedstock.mark ]]; then
    if [[ -d requests-futures-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-futures-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-futures-feedstock.mark ) && true) || ( (echo "requests-futures-feedstock" >>failed.24 ) && (echo "requests-futures-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-futures-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f requests-wsgi-adapter-feedstock.mark ]]; then
    if [[ -d requests-wsgi-adapter-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./requests-wsgi-adapter-feedstock >d 2>&1 && rm -f d && ( echo "done" >>requests-wsgi-adapter-feedstock.mark ) && true) || ( (echo "requests-wsgi-adapter-feedstock" >>failed.24 ) && (echo "requests-wsgi-adapter-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "requests-wsgi-adapter-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f routes-feedstock.mark ]]; then
    if [[ -d routes-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./routes-feedstock >d 2>&1 && rm -f d && ( echo "done" >>routes-feedstock.mark ) && true) || ( (echo "routes-feedstock" >>failed.24 ) && (echo "routes-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "routes-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f runipy-feedstock.mark ]]; then
    if [[ -d runipy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./runipy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>runipy-feedstock.mark ) && true) || ( (echo "runipy-feedstock" >>failed.24 ) && (echo "runipy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "runipy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f s3fs-feedstock.mark ]]; then
    if [[ -d s3fs-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./s3fs-feedstock >d 2>&1 && rm -f d && ( echo "done" >>s3fs-feedstock.mark ) && true) || ( (echo "s3fs-feedstock" >>failed.24 ) && (echo "s3fs-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "s3fs-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f schema-feedstock.mark ]]; then
    if [[ -d schema-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./schema-feedstock >d 2>&1 && rm -f d && ( echo "done" >>schema-feedstock.mark ) && true) || ( (echo "schema-feedstock" >>failed.24 ) && (echo "schema-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "schema-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f scikit-image-feedstock.mark ]]; then
    if [[ -d scikit-image-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scikit-image-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scikit-image-feedstock.mark ) && true) || ( (echo "scikit-image-feedstock" >>failed.24 ) && (echo "scikit-image-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scikit-image-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f scons-feedstock.mark ]]; then
    if [[ -d scons-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./scons-feedstock >d 2>&1 && rm -f d && ( echo "done" >>scons-feedstock.mark ) && true) || ( (echo "scons-feedstock" >>failed.24 ) && (echo "scons-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "scons-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f sentry-sdk-feedstock.mark ]]; then
    if [[ -d sentry-sdk-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sentry-sdk-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sentry-sdk-feedstock.mark ) && true) || ( (echo "sentry-sdk-feedstock" >>failed.24 ) && (echo "sentry-sdk-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sentry-sdk-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f setuptools-git-versioning-feedstock.mark ]]; then
    if [[ -d setuptools-git-versioning-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./setuptools-git-versioning-feedstock >d 2>&1 && rm -f d && ( echo "done" >>setuptools-git-versioning-feedstock.mark ) && true) || ( (echo "setuptools-git-versioning-feedstock" >>failed.24 ) && (echo "setuptools-git-versioning-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "setuptools-git-versioning-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f simplegeneric-feedstock.mark ]]; then
    if [[ -d simplegeneric-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./simplegeneric-feedstock >d 2>&1 && rm -f d && ( echo "done" >>simplegeneric-feedstock.mark ) && true) || ( (echo "simplegeneric-feedstock" >>failed.24 ) && (echo "simplegeneric-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "simplegeneric-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f simplejson-feedstock.mark ]]; then
    if [[ -d simplejson-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./simplejson-feedstock >d 2>&1 && rm -f d && ( echo "done" >>simplejson-feedstock.mark ) && true) || ( (echo "simplejson-feedstock" >>failed.24 ) && (echo "simplejson-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "simplejson-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f slack-sdk-feedstock.mark ]]; then
    if [[ -d slack-sdk-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./slack-sdk-feedstock >d 2>&1 && rm -f d && ( echo "done" >>slack-sdk-feedstock.mark ) && true) || ( (echo "slack-sdk-feedstock" >>failed.24 ) && (echo "slack-sdk-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "slack-sdk-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f smart_open-feedstock.mark ]]; then
    if [[ -d smart_open-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./smart_open-feedstock >d 2>&1 && rm -f d && ( echo "done" >>smart_open-feedstock.mark ) && true) || ( (echo "smart_open-feedstock" >>failed.24 ) && (echo "smart_open-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "smart_open-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f smartypants-feedstock.mark ]]; then
    if [[ -d smartypants-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./smartypants-feedstock >d 2>&1 && rm -f d && ( echo "done" >>smartypants-feedstock.mark ) && true) || ( (echo "smartypants-feedstock" >>failed.24 ) && (echo "smartypants-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "smartypants-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f snakebite-py3-feedstock.mark ]]; then
    if [[ -d snakebite-py3-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./snakebite-py3-feedstock >d 2>&1 && rm -f d && ( echo "done" >>snakebite-py3-feedstock.mark ) && true) || ( (echo "snakebite-py3-feedstock" >>failed.24 ) && (echo "snakebite-py3-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "snakebite-py3-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f spacy-alignments-feedstock.mark ]]; then
    if [[ -d spacy-alignments-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spacy-alignments-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spacy-alignments-feedstock.mark ) && true) || ( (echo "spacy-alignments-feedstock" >>failed.24 ) && (echo "spacy-alignments-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spacy-alignments-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f spacy-legacy-feedstock.mark ]]; then
    if [[ -d spacy-legacy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spacy-legacy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spacy-legacy-feedstock.mark ) && true) || ( (echo "spacy-legacy-feedstock" >>failed.24 ) && (echo "spacy-legacy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spacy-legacy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f sparkmagic-feedstock.mark ]]; then
    if [[ -d sparkmagic-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sparkmagic-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sparkmagic-feedstock.mark ) && true) || ( (echo "sparkmagic-feedstock" >>failed.24 ) && (echo "sparkmagic-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sparkmagic-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f spyder-kernels-feedstock.mark ]]; then
    if [[ -d spyder-kernels-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./spyder-kernels-feedstock >d 2>&1 && rm -f d && ( echo "done" >>spyder-kernels-feedstock.mark ) && true) || ( (echo "spyder-kernels-feedstock" >>failed.24 ) && (echo "spyder-kernels-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "spyder-kernels-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f srsly-feedstock.mark ]]; then
    if [[ -d srsly-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./srsly-feedstock >d 2>&1 && rm -f d && ( echo "done" >>srsly-feedstock.mark ) && true) || ( (echo "srsly-feedstock" >>failed.24 ) && (echo "srsly-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "srsly-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f swagger-ui-bundle-feedstock.mark ]]; then
    if [[ -d swagger-ui-bundle-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./swagger-ui-bundle-feedstock >d 2>&1 && rm -f d && ( echo "done" >>swagger-ui-bundle-feedstock.mark ) && true) || ( (echo "swagger-ui-bundle-feedstock" >>failed.24 ) && (echo "swagger-ui-bundle-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "swagger-ui-bundle-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f sympy-feedstock.mark ]]; then
    if [[ -d sympy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sympy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sympy-feedstock.mark ) && true) || ( (echo "sympy-feedstock" >>failed.24 ) && (echo "sympy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sympy-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f tabulate-feedstock.mark ]]; then
    if [[ -d tabulate-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tabulate-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tabulate-feedstock.mark ) && true) || ( (echo "tabulate-feedstock" >>failed.24 ) && (echo "tabulate-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tabulate-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f tbb-feedstock.mark ]]; then
    if [[ -d tbb-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tbb-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tbb-feedstock.mark ) && true) || ( (echo "tbb-feedstock" >>failed.24 ) && (echo "tbb-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tbb-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f termcolor-feedstock.mark ]]; then
    if [[ -d termcolor-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./termcolor-feedstock >d 2>&1 && rm -f d && ( echo "done" >>termcolor-feedstock.mark ) && true) || ( (echo "termcolor-feedstock" >>failed.24 ) && (echo "termcolor-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "termcolor-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f testpath-feedstock.mark ]]; then
    if [[ -d testpath-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./testpath-feedstock >d 2>&1 && rm -f d && ( echo "done" >>testpath-feedstock.mark ) && true) || ( (echo "testpath-feedstock" >>failed.24 ) && (echo "testpath-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "testpath-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f thrift-feedstock.mark ]]; then
    if [[ -d thrift-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thrift-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thrift-feedstock.mark ) && true) || ( (echo "thrift-feedstock" >>failed.24 ) && (echo "thrift-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thrift-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f thriftpy2-feedstock.mark ]]; then
    if [[ -d thriftpy2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./thriftpy2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>thriftpy2-feedstock.mark ) && true) || ( (echo "thriftpy2-feedstock" >>failed.24 ) && (echo "thriftpy2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "thriftpy2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f tokenizers-feedstock.mark ]]; then
    if [[ -d tokenizers-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tokenizers-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tokenizers-feedstock.mark ) && true) || ( (echo "tokenizers-feedstock" >>failed.24 ) && (echo "tokenizers-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tokenizers-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f toro-feedstock.mark ]]; then
    if [[ -d toro-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./toro-feedstock >d 2>&1 && rm -f d && ( echo "done" >>toro-feedstock.mark ) && true) || ( (echo "toro-feedstock" >>failed.24 ) && (echo "toro-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "toro-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f traceback2-feedstock.mark ]]; then
    if [[ -d traceback2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./traceback2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>traceback2-feedstock.mark ) && true) || ( (echo "traceback2-feedstock" >>failed.24 ) && (echo "traceback2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "traceback2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f trio-feedstock.mark ]]; then
    if [[ -d trio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./trio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>trio-feedstock.mark ) && true) || ( (echo "trio-feedstock" >>failed.24 ) && (echo "trio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "trio-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f trustme-feedstock.mark ]]; then
    if [[ -d trustme-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./trustme-feedstock >d 2>&1 && rm -f d && ( echo "done" >>trustme-feedstock.mark ) && true) || ( (echo "trustme-feedstock" >>failed.24 ) && (echo "trustme-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "trustme-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f twisted-feedstock.mark ]]; then
    if [[ -d twisted-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./twisted-feedstock >d 2>&1 && rm -f d && ( echo "done" >>twisted-feedstock.mark ) && true) || ( (echo "twisted-feedstock" >>failed.24 ) && (echo "twisted-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "twisted-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f typer-feedstock.mark ]]; then
    if [[ -d typer-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typer-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typer-feedstock.mark ) && true) || ( (echo "typer-feedstock" >>failed.24 ) && (echo "typer-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typer-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f typing-feedstock.mark ]]; then
    if [[ -d typing-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./typing-feedstock >d 2>&1 && rm -f d && ( echo "done" >>typing-feedstock.mark ) && true) || ( (echo "typing-feedstock" >>failed.24 ) && (echo "typing-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "typing-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f unicodecsv-feedstock.mark ]]; then
    if [[ -d unicodecsv-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./unicodecsv-feedstock >d 2>&1 && rm -f d && ( echo "done" >>unicodecsv-feedstock.mark ) && true) || ( (echo "unicodecsv-feedstock" >>failed.24 ) && (echo "unicodecsv-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "unicodecsv-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f unicodedata2-feedstock.mark ]]; then
    if [[ -d unicodedata2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./unicodedata2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>unicodedata2-feedstock.mark ) && true) || ( (echo "unicodedata2-feedstock" >>failed.24 ) && (echo "unicodedata2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "unicodedata2-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f uvloop-feedstock.mark ]]; then
    if [[ -d uvloop-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./uvloop-feedstock >d 2>&1 && rm -f d && ( echo "done" >>uvloop-feedstock.mark ) && true) || ( (echo "uvloop-feedstock" >>failed.24 ) && (echo "uvloop-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "uvloop-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f vyper-config-feedstock.mark ]]; then
    if [[ -d vyper-config-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./vyper-config-feedstock >d 2>&1 && rm -f d && ( echo "done" >>vyper-config-feedstock.mark ) && true) || ( (echo "vyper-config-feedstock" >>failed.24 ) && (echo "vyper-config-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "vyper-config-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f wasabi-feedstock.mark ]]; then
    if [[ -d wasabi-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./wasabi-feedstock >d 2>&1 && rm -f d && ( echo "done" >>wasabi-feedstock.mark ) && true) || ( (echo "wasabi-feedstock" >>failed.24 ) && (echo "wasabi-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "wasabi-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f xlwt-feedstock.mark ]]; then
    if [[ -d xlwt-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xlwt-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xlwt-feedstock.mark ) && true) || ( (echo "xlwt-feedstock" >>failed.24 ) && (echo "xlwt-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xlwt-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f xyzservices-feedstock.mark ]]; then
    if [[ -d xyzservices-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./xyzservices-feedstock >d 2>&1 && rm -f d && ( echo "done" >>xyzservices-feedstock.mark ) && true) || ( (echo "xyzservices-feedstock" >>failed.24 ) && (echo "xyzservices-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "xyzservices-feedstock not present" >>failed.24
    fi
fi


if [[ ! -f zfpy-feedstock.mark ]]; then
    if [[ -d zfpy-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./zfpy-feedstock >d 2>&1 && rm -f d && ( echo "done" >>zfpy-feedstock.mark ) && true) || ( (echo "zfpy-feedstock" >>failed.24 ) && (echo "zfpy-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "zfpy-feedstock not present" >>failed.24
    fi
fi

