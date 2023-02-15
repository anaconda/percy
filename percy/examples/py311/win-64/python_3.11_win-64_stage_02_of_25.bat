set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./setuptools-feedstock || echo "setuptools-feedstock" >>failed.2 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./setuptools-52.0.0-feedstock || echo "setuptools-52.0.0-feedstock" >>failed.2 || cmd /K "exit /b 0"
