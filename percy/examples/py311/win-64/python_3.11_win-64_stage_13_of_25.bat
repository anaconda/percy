set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./entrypoints-feedstock || echo "entrypoints-feedstock" >>failed.13 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./hatch-nodejs-version-feedstock || echo "hatch-nodejs-version-feedstock" >>failed.13 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./jsonschema-feedstock || echo "jsonschema-feedstock" >>failed.13 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./jupyter_core-feedstock || echo "jupyter_core-feedstock" >>failed.13 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./nest-asyncio-feedstock || echo "nest-asyncio-feedstock" >>failed.13 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./python-fastjsonschema-feedstock || echo "python-fastjsonschema-feedstock" >>failed.13 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pyzmq-feedstock || echo "pyzmq-feedstock" >>failed.13 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./tornado-feedstock || echo "tornado-feedstock" >>failed.13 || cmd /K "exit /b 0"
