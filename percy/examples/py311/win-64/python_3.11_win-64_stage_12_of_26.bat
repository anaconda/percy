set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./hatch-vcs-feedstock || echo "hatch-vcs-feedstock" >>failed.12 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pytest-runner-feedstock || echo "pytest-runner-feedstock" >>failed.12 || cmd /K "exit /b 0"
