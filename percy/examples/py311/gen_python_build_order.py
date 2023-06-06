""" Generate build scripts to build all packages depending on python.
"""

import percy.render.aggregate as aggregate
from config import block_list
from config import extras_versions as extras
import argparse
from pathlib import Path
from itertools import groupby
import requests
import json
import os
import shutil
import yaml


def get_repodata_package_list(subdir, python_ref, include_noarch=False):
    def match_lower(mrv, rv, v):
        irv = int(rv) - 1
        hlp = ">={}.{}".format(mrv, irv)
        if v.find(hlp) >= 0:
            return True
        irv = irv - 1
        while irv > -1:
            hlp = ">={}.{}".format(mrv, irv)
            if v.find(hlp) >= 0:
                hlp += ","
                return v.find(hlp) < 0
            hlp = ">{}.{}".format(mrv, irv)
            if v.find(hlp) >= 0:
                hlp += ","
                return v.find(hlp) < 0
            irv = irv - 1
        return False

    def depends_on_python(repo_package, python_ref):
        buildstr = repo_package["build"]
        pyver = f"py{python_ref.replace('.','')}"
        if "py_" in buildstr or "pyh" in buildstr or pyver in buildstr:
            return True
        repo_package["depends"]

        hlp = ">=" + python_ref + ",<" + python_ref[0] + "."
        hlp2 = "=" + python_ref
        next_minor = str(int(python_ref.split(".")[-1]) + 1)
        for v in repo_package["depends"]:
            if v.find("python ") >= 0:
                if v.find(hlp) >= 0 or match_lower(python_ref[0], next_minor, v):
                    return True
            elif v.find(hlp2) >= 0:
                return True
            elif v == "python":
                return True

        return False

    session = requests.Session()

    repodata_subdir = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir = json.loads(response.text)

    pkgs = set(
        v["name"]
        for v in repodata_subdir["packages"].values()
        if (depends_on_python(v, python_ref))
    )

    if include_noarch:
        repodata_noarch = None
        url = "https://repo.anaconda.com/pkgs/main/noarch/repodata.json"
        response = session.get(url)
        if response.status_code != 200:
            raise Exception()
        else:
            repodata_noarch = json.loads(response.text)
        pkgs.update(
            set(
                v["name"]
                for v in repodata_noarch["packages"].values()
                if (depends_on_python(v, python_ref))
            )
        )

    return sorted(list(pkgs))


def _script(script_name_ending):
    return f"./{subdir}/python_{python_target}_{subdir}_{script_name_ending}"


def gen_python_build_order(
    aggregate_path, subdir, python_ref, python_target, numpy_target, croot, channel
):

    if croot is None:
        if not subdir.startswith("win-"):
            croot = f"../ci_py{python_target.replace('.','')}/"
        else:
            croot = f"c:/ci_{python_target.replace('.','')}/"

    os.makedirs(f"./{subdir}/", exist_ok=True)

    # load repodata package list
    repodata_package_list = sorted(get_repodata_package_list(subdir, python_ref, False))
    repodata_package_list_with_noarch = sorted(
        get_repodata_package_list(subdir, python_ref, True)
    )

    # load aggregate
    aggregate_repo = aggregate.Aggregate(aggregate_path)
    others = {"r_implementation": "r-base"}
    if subdir.startswith("win-"):
        others["rust_compiler"] = "rust"
        aggregate_repo.load_local_feedstocks(subdir, python_ref, others)
    else:
        aggregate_repo.load_local_feedstocks(subdir, python_ref, others)

    # write package to feedstock mapping file - for reference
    with open(f"./{subdir}/map_to_p.yaml", "w") as f:
        yaml.dump(aggregate_repo.package_to_feedstock_path(), f)

    # get feedstock build order
    allow_list = repodata_package_list  # only packages already in subdir defaults
    # only packages already in subdir and noarch defaults
    allow_list_noarch = repodata_package_list_with_noarch
    python_buildout = aggregate_repo.get_depends_build_order(
        [], ["python"], allow_list, block_list, True
    )

    # compare local aggregate package list to repodata package list - for reference
    aggregate_package_list = []
    for feedstock in python_buildout:
        for pkg_name in feedstock.packages.keys():
            aggregate_package_list.append(pkg_name)
    aggregate_package_list = sorted(aggregate_package_list)
    with open(
        f"./{subdir}/python_{python_target}_{subdir}_package_list.yaml", "w"
    ) as f:
        yaml.dump(aggregate_package_list, f)
    repodata_package_list = sorted(get_repodata_package_list(subdir, python_ref))
    with open(f"./{subdir}/python_{python_ref}_{subdir}_package_list.yaml", "w") as f:
        yaml.dump(repodata_package_list, f)
    with open(
        f"./{subdir}/python_{python_ref}_{subdir}_package_list_missing.yaml", "w"
    ) as f:
        yaml.dump(
            sorted(list(set(repodata_package_list) - set(aggregate_package_list))), f
        )
    with open(
        f"./{subdir}/python_{python_ref}_{subdir}_package_list_new.yaml", "w"
    ) as f:
        yaml.dump(
            sorted(list(set(aggregate_package_list) - set(repodata_package_list))), f
        )

    # also export subdir + noarch list
    python_buildout_with_noarch = aggregate_repo.get_depends_build_order(
        [], ["python"], allow_list_noarch, block_list, False
    )
    aggregate_package_list_with_noarch = []
    for feedstock in python_buildout_with_noarch:
        for pkg_name in feedstock.packages.keys():
            aggregate_package_list_with_noarch.append(pkg_name)
    aggregate_package_list_with_noarch = sorted(aggregate_package_list_with_noarch)
    with open(f"./{subdir}/python_full_package_list.yaml", "w") as f:
        yaml.dump(
            dict(
                map(lambda e: (e, [croot, channel]), aggregate_package_list_with_noarch)
            ),
            f,
        )
    shutil.copy(Path(__file__).parent / "test_install.py", f"./{subdir}/")

    # write stage build scripts
    stages = [
        list(result) for key, result in groupby(python_buildout, key=lambda f: f.weight)
    ]
    n_stages = len(stages)

    if not subdir.startswith("win-"):
        build = " ".join([
            "conda-build",
            "--python={python_ver}",
            "--numpy={numpy_ver}",
            "--croot={croot}",
            "-c {channel}",
            "--use-local",
            "--no-test",
            "{feedstockpath}",
            ">d 2>&1",
            "&& rm -f d",
            "&& ( echo done >>{feedstockname}.mark )",
        ])
        show_status = " && ".join([
            "( echo \"{feedstockname}\" >>failed.{stage} )",
            "( echo \"{feedstockname}\" >>errors.dump )",
            "( cat d >>errors.dump )",
            "cat d",
            "rm -f d",
        ])
        build_feedstock_template = f"""
if [[ ! -f {{feedstockname}}.mark ]]; then
    if [[ -d {{feedstockname}} ]]; then
        ( ( {build} ) || ( {show_status} ) )
    else
        echo '{{feedstockname}} not present' >>failed.{{stage}}
    fi
fi

"""

        issue_order = []
        with open(_script("build_all.sh"), "w") as g:
            g.write("#!/bin/bash\n")
            g.write("set -x\n")
            for i, stage in enumerate(stages, 1):
                fname = _script(f"stage_{i:02}_of_{n_stages:02}.sh")
                g.write(f"{fname}\n")
                with open(f"./{subdir}/{fname}", "w") as f:
                    f.write("#!/bin/bash\n")
                    f.write("CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0\n")
                    for feedstock in stage:
                        f.write(
                            build_feedstock_template.format(
                                feedstockname=feedstock.name,
                                feedstockpath=feedstock.path,
                                python_ver=python_target,
                                numpy_ver=numpy_target,
                                croot=croot,
                                channel=channel,
                                stage=i,
                            )
                        )

                        if feedstock.name in extras:
                            f.write(
                                build_feedstock_template.format(
                                    feedstockname=extras[feedstock.name],
                                    feedstockpath=f"./{extras[feedstock.name]}",
                                    python_ver=python_target,
                                    numpy_ver=numpy_target,
                                    croot=croot,
                                    channel=channel,
                                    stage=i,
                                )
                            )
                    g.write(f'echo "Done stage {i:02} of {n_stages:02}"\n')
            g.write('echo "Done"\n')

        # copy test script
        shutil.copy(Path(__file__).parent / "test_packages.sh", f"./{subdir}/")

        # copy tally script
        shutil.copy(Path(__file__).parent / "tally.sh", f"./{subdir}/")

    else:
        # Build the command template string.
        build = " ".join([
            "conda-build",
            "--python={python_ver}",
            "--numpy={numpy_ver}",
            "--croot={croot}",
            "-c {channel}",
            "--use-local",
            "--no-test",
            "{feedstockpath}",
        ])
        show_status = "echo \"{feedstockname}\" >>failed.{stage}"
        quit = "cmd /K \"exit /b 0\""
        build_feedstock_template = f"\n{build} || {show_status} || {quit}\n"

        with open(_script("build_all.bat"), "w") as g:
            for i, stage in enumerate(stages, 1):
                script = _script(f"stage_{i:02}_of_{n_stages:02}.bat")
                fname = script.rsplit("/", 1)[1]
                g.write(f"call {fname}\n")
                with open(script, "w") as f:
                    f.write("set CONDA_ADD_PIP_AS_PYTHON_DEPENDENCY=0\r\n")
                    for feedstock in stage:
                        f.write(
                            build_feedstock_template.format(
                                feedstockname=feedstock.name,
                                feedstockpath=feedstock.path,
                                python_ver=python_target,
                                numpy_ver=numpy_target,
                                croot=croot,
                                channel=channel,
                                stage=i,
                            )
                        )
                        if feedstock.name in extras:
                            f.write(
                                build_feedstock_template.format(
                                    feedstockname=extras[feedstock.name],
                                    feedstockpath=f"./{extras[feedstock.name]}",
                                    python_ver=python_target,
                                    numpy_ver=numpy_target,
                                    croot=croot,
                                    channel=channel,
                                    stage=i,
                                )
                            )
                    g.write(f'echo "Done stage {i:02} of {n_stages:02}"\n')
            g.write('echo "Done"\n')

        # copy test script
        shutil.copy("test_packages.bat", f"./{subdir}/")


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="gen_python_build_order",
        description="Build order for a new python release.",
    )
    parser.add_argument(
        "-a",
        "--aggregate",
        type=Path,
        help="aggregate path",
        default="/Users/cbousseau/work/recipes/aggregate/",
    )
    parser.add_argument(
        "-s", "--subdir", type=str, help="Architecture", default="linux-64"
    )
    parser.add_argument(
        "-r", "--python-ref", type=str, help="Reference python version", default="3.10"
    )
    parser.add_argument(
        "-p", "--python-target", type=str, help="Target python version", default="3.11"
    )
    parser.add_argument(
        "-n", "--numpy-target", type=str, help="Target numpy version", default="1.22"
    )
    parser.add_argument(
        "-c",
        "--channel",
        type=str,
        help="Python release channel",
        default="py311_bs/label/release",
    )
    parser.add_argument("-q", "--croot", type=str, help="croot")

    return parser


if __name__ == "__main__":

    parser = create_parser()
    args = parser.parse_args()
    gen_python_build_order(
        args.aggregate,
        args.subdir,
        args.python_ref,
        args.python_target,
        args.numpy_target,
        args.croot,
        args.channel,
    )
