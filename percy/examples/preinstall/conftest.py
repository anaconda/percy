_DEFAULT_AGGREGATE = "~/work/recipes/aggregate/"
_DEFAULT_PYTHON = ["3.8", "3.9", "3.10", "3.11"]
_DEFAULT_SUBDIRS = [
    "linux-64",
    "linux-ppc64le",
    "linux-aarch64",
    "osx-64",
    "osx-arm64",
    "win-64",
    "linux-s390x",
]


def pytest_addoption(parser):
    parser.addoption("--feedstock", action="store", help="feedstock path")
    parser.addoption("--arch", nargs="+", default=_DEFAULT_SUBDIRS)
    parser.addoption("--python", nargs="+", default=_DEFAULT_PYTHON)
    parser.addoption("--channels", nargs="+", default=["default"])
    parser.addoption(
        "--aggregate",
        action="store",
        default=_DEFAULT_AGGREGATE,
        help="directory containing aggregate",
    )
    parser.addoption("--extras", nargs="+", default=[])
