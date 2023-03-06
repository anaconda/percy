#!/bin/bash
CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

if [[ ! -f argon2-cffi-bindings-feedstock.mark ]]; then
    if [[ -d argon2-cffi-bindings-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./argon2-cffi-bindings-feedstock >d 2>&1 && rm -f d && ( echo "done" >>argon2-cffi-bindings-feedstock.mark ) && true) || ( (echo "argon2-cffi-bindings-feedstock" >>failed.15 ) && (echo "argon2-cffi-bindings-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "argon2-cffi-bindings-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f beautifulsoup4-feedstock.mark ]]; then
    if [[ -d beautifulsoup4-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./beautifulsoup4-feedstock >d 2>&1 && rm -f d && ( echo "done" >>beautifulsoup4-feedstock.mark ) && true) || ( (echo "beautifulsoup4-feedstock" >>failed.15 ) && (echo "beautifulsoup4-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "beautifulsoup4-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f jinja2-feedstock.mark ]]; then
    if [[ -d jinja2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./jinja2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>jinja2-feedstock.mark ) && true) || ( (echo "jinja2-feedstock" >>failed.15 ) && (echo "jinja2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "jinja2-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f lxml-feedstock.mark ]]; then
    if [[ -d lxml-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./lxml-feedstock >d 2>&1 && rm -f d && ( echo "done" >>lxml-feedstock.mark ) && true) || ( (echo "lxml-feedstock" >>failed.15 ) && (echo "lxml-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "lxml-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f mistune-feedstock.mark ]]; then
    if [[ -d mistune-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mistune-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mistune-feedstock.mark ) && true) || ( (echo "mistune-feedstock" >>failed.15 ) && (echo "mistune-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mistune-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f mistune-0.8.4-feedstock.mark ]]; then
    if [[ -d mistune-0.8.4-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./mistune-0.8.4-feedstock >d 2>&1 && rm -f d && ( echo "done" >>mistune-0.8.4-feedstock.mark ) && true) || ( (echo "mistune-0.8.4-feedstock" >>failed.15 ) && (echo "mistune-0.8.4-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "mistune-0.8.4-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f nbclient-feedstock.mark ]]; then
    if [[ -d nbclient-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./nbclient-feedstock >d 2>&1 && rm -f d && ( echo "done" >>nbclient-feedstock.mark ) && true) || ( (echo "nbclient-feedstock" >>failed.15 ) && (echo "nbclient-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "nbclient-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f pandocfilters-feedstock.mark ]]; then
    if [[ -d pandocfilters-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./pandocfilters-feedstock >d 2>&1 && rm -f d && ( echo "done" >>pandocfilters-feedstock.mark ) && true) || ( (echo "pandocfilters-feedstock" >>failed.15 ) && (echo "pandocfilters-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "pandocfilters-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f sniffio-feedstock.mark ]]; then
    if [[ -d sniffio-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./sniffio-feedstock >d 2>&1 && rm -f d && ( echo "done" >>sniffio-feedstock.mark ) && true) || ( (echo "sniffio-feedstock" >>failed.15 ) && (echo "sniffio-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "sniffio-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f tinycss2-feedstock.mark ]]; then
    if [[ -d tinycss2-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tinycss2-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tinycss2-feedstock.mark ) && true) || ( (echo "tinycss2-feedstock" >>failed.15 ) && (echo "tinycss2-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tinycss2-feedstock not present" >>failed.15
    fi
fi


if [[ ! -f tomlkit-feedstock.mark ]]; then
    if [[ -d tomlkit-feedstock ]]; then
        (conda-build --python=3.11 --numpy=1.22 --croot=../ci_py311/ -c py311_bs/label/release --use-local --no-test ./tomlkit-feedstock >d 2>&1 && rm -f d && ( echo "done" >>tomlkit-feedstock.mark ) && true) || ( (echo "tomlkit-feedstock" >>failed.15 ) && (echo "tomlkit-feedstock" >>errors.dump ) && ( cat d >>errors.dump ) && cat d && rm -f d && true) || true
    else
        echo "tomlkit-feedstock not present" >>failed.15
    fi
fi

