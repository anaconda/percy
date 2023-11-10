"""
Test installation of all packages listed in python_full_package_list.yaml

Usage:
    pytest -n auto \
      --junit-xml="test_install.xml" \
      --html="test_install.html" \
      --self-contained-html \
      test_install.py
"""

import json
import subprocess

import pytest
import yaml


def dry_run(
    solver="libmamba",
    channels=["defaults"],
    override_channels=False,
    packages=[],
):
    """
    Dry-run an environment and return it's json result.
    """
    cmd = f"conda create -n test_env --dry-run --json --solver={solver}"
    for channel in channels:
        cmd += f" -c {channel}"
    if override_channels:
        cmd += " --override-channels"
    cmd = cmd.split(" ") + [f"'{p}'" for p in packages]
    json_result = {}
    retry = 5
    while retry > 0:
        retry = retry - 1
        result = subprocess.run(cmd, capture_output=True, text=True)
        json_result = {}
        try:
            json_result.update(json.loads(result.stdout))
            json_result["__command__"] = {"cmd": " ".join(cmd)}
            json_result["__result__"] = result.returncode
            break
        except json.decoder.JSONDecodeError:
            json_result["success"] = False
            json_result["error"] = "json.decoder.JSONDecodeError"
            json_result["stdout"] = result.stdout
            json_result["stderr"] = result.stderr
            json_result["__command__"] = {"cmd": " ".join(cmd)}
            json_result["__result__"] = result.returncode
    return json_result


def dry_run_assert(solver, packages, channels):
    """
    Dry-run an environment and assert that it succeeds.
    """
    json_result = dry_run(
        solver=solver,
        channels=channels,
        packages=packages,
    )
    success = json_result.get("success", False)
    if not success:
        message = json_result["error"]
        message += "\nTo reproduce locally:"
        message += f'\n{json_result["__command__"]["cmd"]}'
        message += f"\n\n{json.dumps(json_result, indent=4)}"
    assert json_result.get("success", False), message


def data_source(filename):
    import os

    print(f"data_source({filename=}", os.getcwd())  # XXX
    with open(filename, encoding="utf-8") as f:
        return yaml.safe_load(f).items()


@pytest.mark.parametrize(
    "package, channels",
    data_source("./python_full_package_list.yaml"),
)
def test_install(package, channels):
    packages = [f"{package}", "python[version=3.11]"]
    dry_run_assert("classic", packages, channels)
