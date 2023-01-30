def pytest_addoption(parser):
    parser.addoption("--feedstock", action="store", help="feedstock path")
    parser.addoption("--arch", nargs="+", default=['linux-64', 'linux-ppc64le', 'linux-aarch64', 'osx-64', 'osx-arm64', 'win-64', 'linux-s390x'])
    parser.addoption("--python", nargs="+", default=['3.7', '3.8', '3.9', '3.10'])
    parser.addoption("--channels", nargs="+", default=['default'])
    parser.addoption("--aggregate", action="store", default='~/work/recipes/aggregate/', help="aggregate path")
    parser.addoption("--extras", nargs="+", default=[])
