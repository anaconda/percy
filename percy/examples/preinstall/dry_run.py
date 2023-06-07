import os
import subprocess
import sys
import json
import argparse

def dry_run(
    subdir="linux-64",
    glibc=None,
    solver="libmamba",
    channels=["defaults"],
    override_channels=False,
    packages=[],
):
    """ Dry-run an environment and return it's json result.
    """
    cmd = f"conda create -n test_env --dry-run --json --experimental-solver={solver}"
    for channel in channels:
        cmd += f" -c {channel}"
    if subdir.startswith("win-"):
        cmd += " -c msys2"
    if override_channels:
        cmd += " --override-channels"
    cmd = cmd.split(" ") + [f"'{p}'" for p in packages]
    my_env = os.environ.copy()
    conda_env = {}
    conda_env["CONDA_SUBDIR"] = f"{subdir}"
    if subdir.startswith("linux-"):
        if glibc is None:
            if subdir == "linux-aarch64":
                glibc = "2.19"
            else:
                glibc = "2.17"
        conda_env["CONDA_OVERRIDE_GLIBC"] = glibc
    my_env.update(conda_env)
    result = subprocess.run(cmd, capture_output=True, text=True, env=my_env)
    json_result = json.loads(result.stdout)
    json_result["__command__"] = {"cmd": " ".join(cmd), "env": conda_env}
    return json_result

def dry_run_assert(subdir, packages):
    """ Dry-run an environment and assert that it succeeds.
    """
    json_result = dry_run(
        subdir=subdir,
        channels=["defaults"],
        override_channels=True,
        packages=packages,
    )
    success = json_result.get("success", False)
    if not success:
        message = json_result["error"]
        message += "\nTo reproduce locally:"
        for k, v in json_result["__command__"]["env"].items():
            message += f"\nexport {k}={v}"
        message += f'\n{json_result["__command__"]["cmd"]}'
        message += f"\n\n{json.dumps(json_result, indent=4)}"
    assert json_result.get("success", False), message

def create_parser() -> argparse.ArgumentParser:
    """ Create command line parser.
    """
    parser = argparse.ArgumentParser(
        prog="test_env",
        description="Dry-run an environment.",
    )
    parser.add_argument(
        "-a", "--subdir", type=str, help="Subdir: e.g. linux-64", default="linux-64"
    )
    parser.add_argument("-g", "--glibc", type=str, help="glibc version", default=None)
    parser.add_argument(
        "-s",
        "--solver",
        type=str,
        help="Solver",
        choices=["classic", "libmamba"],
        default="libmamba",
    )
    parser.add_argument(
        "-c", "--channel", type=str, action="append", default=["defaults"]
    )
    parser.add_argument("--override-channels", action="store_true")
    parser.add_argument(
        "packages",
        type=str,
        help="Matchspec list. e.g: python[version=3.9] anaconda=2022.10",
        nargs="+",
    )
    parser.set_defaults(override_channels=False)

    return parser


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()
    json_result = dry_run(
        args.subdir,
        args.glibc,
        args.solver,
        args.channel,
        args.override_channels,
        args.packages,
    )
    print(json.dumps(json_result, indent=4))
    if json_result.get("success", False):
        sys.exit(0)
    else:
        sys.exit(1)
