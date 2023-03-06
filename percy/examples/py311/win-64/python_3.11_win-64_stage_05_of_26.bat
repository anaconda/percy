set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./typing_extensions-feedstock || echo "typing_extensions-feedstock" >>failed.5 || cmd /K "exit /b 0"
