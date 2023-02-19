set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./editables-feedstock || echo "editables-feedstock" >>failed.8 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pathspec-feedstock || echo "pathspec-feedstock" >>failed.8 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pluggy-feedstock || echo "pluggy-feedstock" >>failed.8 || cmd /K "exit /b 0"
