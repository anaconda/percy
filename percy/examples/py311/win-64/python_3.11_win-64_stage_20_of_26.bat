set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./blinker-feedstock/ || echo "blinker-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./cachecontrol-feedstock || echo "cachecontrol-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./cmarkgfm-feedstock || echo "cmarkgfm-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./cppy-feedstock || echo "cppy-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./docutils-feedstock || echo "docutils-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./findpython-feedstock || echo "findpython-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./frozenlist-feedstock || echo "frozenlist-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./multidict-feedstock || echo "multidict-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./nbclassic-feedstock || echo "nbclassic-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pyqt-builder-feedstock || echo "pyqt-builder-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pyqt-feedstock || echo "pyqt-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./python-dotenv-feedstock || echo "python-dotenv-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./python-installer-feedstock || echo "python-installer-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./pywin32-ctypes-feedstock || echo "pywin32-ctypes-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./resolvelib-feedstock || echo "resolvelib-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./rich-feedstock || echo "rich-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./shellingham-feedstock || echo "shellingham-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./unearth-feedstock || echo "unearth-feedstock" >>failed.20 || cmd /K "exit /b 0"

conda-build --python=3.11 --numpy=1.22 --croot=c:/ci_311/ -c py311_bs/label/release --use-local --no-test ./virtualenv-feedstock || echo "virtualenv-feedstock" >>failed.20 || cmd /K "exit /b 0"
