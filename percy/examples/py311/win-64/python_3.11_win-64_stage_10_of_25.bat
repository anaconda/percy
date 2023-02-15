set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pytest-feedstock || echo "pytest-feedstock" >>failed.10 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pytest-6-feedstock || echo "pytest-6-feedstock" >>failed.10 || cmd /K "exit /b 0"
