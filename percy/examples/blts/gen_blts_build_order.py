""" Generate build scripts to build all packages depending on python.
"""

import os
from itertools import groupby

import yaml

import percy.render.aggregate as aggregate


def gen_blts_build_order(aggregate_path, subdir, python_ref, packages):
    os.makedirs(f"./{subdir}/", exist_ok=True)

    # load aggregate
    aggregate_repo = aggregate.Aggregate(aggregate_path)
    others = {"r_implementation": "r-base"}
    others["blas_impl"] = "openblas"
    if subdir.startswith("win-"):
        others["rust_compiler"] = "rust"
        aggregate_repo.load_local_feedstocks(subdir, python_ref, others)
    else:
        aggregate_repo.load_local_feedstocks(subdir, python_ref, others)

    # write package to feedstock mapping file - for reference
    with open(f"./{subdir}/map_to_p.yaml", "w") as f:
        yaml.dump(aggregate_repo.package_to_feedstock_path(), f)

    # get feedstock build order
    blts_buildout = aggregate_repo.get_build_order([], packages)

    # write stage build order
    stages = [list(result) for key, result in groupby(blts_buildout, key=lambda f: f.weight)]
    build_order = {"python": python_ref, "stages": {}}
    for i, stage in enumerate(stages):
        stage_id = f"{i:03}"
        build_order["stages"][stage_id] = []
        for feedstock in stage:
            build_order["stages"][stage_id].append(feedstock.path)
    with open(f"./{subdir}/blts_{subdir}_build_order.yaml", "w") as f:
        yaml.dump(build_order, f)


if __name__ == "__main__":
    gen_blts_build_order(
        "/Users/cbousseau/work/recipes/aggregate/",
        "linux-64",
        "3.10",
        [
            "python",
            "numpy",
            "scikit-learn",
            "pandas",
            "scikit-image",
            "xgboost",
            "scipy",
            "conda",
            "conda-build",
        ],
    )

    gen_blts_build_order(
        "/Users/cbousseau/work/recipes/aggregate/",
        "osx-arm64",
        "3.10",
        [
            "python",
            "numpy",
            "scikit-learn",
            "pandas",
            "scikit-image",
            "xgboost",
            "scipy",
            "conda",
            "conda-build",
        ],
    )
