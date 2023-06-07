import logging
from pathlib import Path

import pytest

import percy.render.recipe as recipe
from percy.examples.preinstall.dry_run import dry_run

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.DEBUG)

def render(feedstock_path, aggregate_path, arch, python):
    logging.debug(f'Render feedstock {feedstock_path} for { arch }')

    recipe_path = feedstock_path / 'recipe' / 'meta.yaml'
    others = {"r_implementation": "r-base"}
    if arch.startswith("win-"):
        others["rust_compiler"] = "rust"
    render_results = recipe.render(recipe_path, arch, python, others)

    return render_results

def check_deps(
        feedstock_path,
        aggregate_path,
        arch='linux-aarch64',
        python='3.10',
        channels=None,
        extras=None,
    ):
    # Set defaults to function-scoped locals if not specified as parameters.
    if not channels:
        channels = ['default']
    if not extras:
        extras = []

    logging.debug(f'Render feedstock {feedstock_path} for { arch }')

    recipe_path = feedstock_path / 'recipe' / 'meta.yaml'
    others = {"r_implementation": "r-base"}
    if arch.startswith("win-"):
        others["rust_compiler"] = "rust"
    render_results = recipe.render(recipe_path, arch, python, others)
    unresolved_deps = {}
    for render_result in render_results:
        meta = render_result.meta

        if meta:
            try:
                logging.debug('Check run environment')
                name = meta.get('package', {}).get('name', 'unknown')
                pkg_reqs = []
                if python != 'nopy':
                    pkg_reqs.extend([f'python={python}'])
                pkg_reqs.extend(extras)
                requirements = meta.get('requirements', {})
                if requirements is not None:
                    for e in ['build', 'host', 'run', 'run_constrained']:
                        req = requirements.get(e, [])
                        if req is not None:
                            pkg_reqs.extend(req)
                test = meta.get('test', {})
                if test is not None:
                    req = test.get('requires', [])
                    if req is not None:
                        pkg_reqs.extend(req)
                outputs = meta.get('outputs', [])
                if outputs:
                    for output in outputs:
                        name = output.get('name', '')
                        output_pkg_reqs = pkg_reqs
                        requirements = output.get('requirements', {})
                        if requirements is not None:
                            for e in ['build', 'host', 'run', 'run_constrained']:
                                req = requirements.get(e, [])
                                if req is not None:
                                    pkg_reqs.extend(req)
                        test = output.get('test', {})
                        if test is not None:
                            req = test.get('requires', [])
                            if req is not None:
                                pkg_reqs.extend(req)
                        unresolved_deps[name] = dry_run(
                            subdir=arch,
                            channels=channels,
                            packages=output_pkg_reqs,
                        )
                else:
                    unresolved_deps[name] = dry_run(
                        subdir=arch,
                        channels=channels,
                        packages=pkg_reqs,
                    )
        
            except:
                print(meta)
                raise

    return unresolved_deps


@pytest.fixture(scope='session')
def feedstock_path(pytestconfig):
    return Path(pytestconfig.getoption('feedstock')).expanduser().absolute()


@pytest.fixture(scope='session')
def aggregate_path(pytestconfig):
    return Path(pytestconfig.getoption('aggregate')).expanduser().absolute()


@pytest.fixture(scope='session')
def channels(pytestconfig):
    return pytestconfig.getoption('channels')


@pytest.fixture(scope='session')
def extras(pytestconfig):
    return pytestconfig.getoption('extras')


@pytest.hookimpl
def pytest_generate_tests(metafunc):
    if 'arch' in metafunc.fixturenames:
        values = metafunc.config.option.arch
        metafunc.parametrize('arch', values)
    recipe_path = Path(
        metafunc.config.option.feedstock
    ).expanduser().absolute() / 'recipe' / 'meta.yaml'
    with open(recipe_path, 'r') as stream:
        contents = stream.read()
        if 'python' in contents:
            values = metafunc.config.option.python
            metafunc.parametrize('python', values)
        else:
            metafunc.parametrize('python', ['nopy'])


def test_deps(feedstock_path, aggregate_path, arch, python, channels, extras):
    if not (arch == 'osx-arm64' and python == '3.7'):
        results = check_deps(feedstock_path, aggregate_path,
                            arch, python, channels, extras)
        for name, problems in results.items():
            success = problems.get("success", False)
            if not success:
                print(problems)
            assert success
