""" Copy 311 packages to /www/pkgs/main
"""

import argparse
from pathlib import Path
import requests
import json
import logging

import grp
import os
import pwd
import shutil
import sys
from tempfile import NamedTemporaryFile
from typing import DefaultDict, List

ZEUS_DEST = Path("/www/pkgs/main")
DEFAULT_PERMISSIONS = 0o664

# A custom formatter for our logging purposes.
class CustomFormatter(logging.Formatter):
    """Custom logging format that adds color to different log levels."""

    blue = "\033[0;34m"
    yellow = "\x1b[33;20m"
    red = "\x1b[31;20m"
    boldRed = "\x1b[31;1m"
    reset = "\x1b[0m"
    format_str = "%(name)s - %(levelname)s - %(message)s"

    formats = {
        logging.DEBUG: blue + format_str + reset,
        logging.INFO: blue + format_str + reset,
        logging.WARNING: yellow + format_str + reset,
        logging.ERROR: red + format_str + reset,
        logging.CRITICAL: boldRed + format_str + reset,
    }

    def format(self, record):
        formatter = logging.Formatter(self.formats.get(record.levelno))
        return formatter.format(record)


# Basic logging with our custom formatter.
logger = logging.getLogger("311")
ch = logging.StreamHandler()
ch.setFormatter(CustomFormatter())
logger.addHandler(ch)
logger.setLevel(logging.INFO)


def filter_repodata(subdir, local_dir):

    has_errors = False
    has_warnings = False

    results = {
        "to_copy": set(),
        "present": set(),
        "missing": set(),
        "skip": set(),
    }

    # load defaults repodata
    session = requests.Session()
    repodata_subdir_defaults = None
    url = f"https://repo.anaconda.com/pkgs/main/{subdir}/repodata.json"
    response = session.get(url)
    if response.status_code != 200:
        raise Exception()
    else:
        repodata_subdir_defaults = json.loads(response.text)

    # load local repodata
    local_repodata = local_dir / subdir / "repodata.json"
    with open(local_repodata) as f:
        repodata_subdir_local = json.load(f)
        logger.info("verify local repodata.json against defaults")
        for k, v in repodata_subdir_local["packages"].items():
            if "python >=3.11,<3.12.0a0" in v["depends"]:
                if k in repodata_subdir_defaults["packages"] or not any(
                    [
                        m["name"] == v["name"]
                        and m["version"] == v["version"]
                        and m["build_number"] == v["build_number"]
                        and ("python >=3.11,<3.12.0a0" in m["depends"] or "py311" in p)
                        for p, m in repodata_subdir_defaults["packages"].items()
                    ]
                ):
                    def depends_on_mkl(package):
                        if "blas 1.0 mkl" in package["depends"]:
                            return True
                        return "mkl >=2021.4.0,<2022.0a0" in package["depends"]

                    if subdir == "osx-64" and depends_on_mkl(v):
                        logger.warning(f"Skipping osx-64 mkl related package { k }")
                        has_warnings = True
                        results["skip"].add(k)
                    else:
                        results["to_copy"].add(k)
                else:
                    results["present"].add(k)
            else:
                if k in repodata_subdir_defaults["packages"] or any(
                    [
                        m["name"] == v["name"]
                        and m["version"] == v["version"]
                        and m["build_number"] == v["build_number"]
                        for m in repodata_subdir_defaults["packages"].values()
                    ]
                ):
                    results["present"].add(k)
                else:
                    results["missing"].add(k)

    logger.info("Looking for missing packages")
    if not len(results["missing"]) == 0:
        logger.error(f"Missing packages { results['missing'] }")
        has_errors = True

    # verify every .tar.bz2 has a .conda match
    logger.info("verify cph was called")
    for k in results["to_copy"]:
        fpathtarbz2 = local_dir / subdir / k
        fpathconda = local_dir / subdir / k.replace(".tar.bz2", ".conda")
        if fpathtarbz2.is_file() and not fpathconda.is_file():
            logger.error(f"Package not transmuted to .conda {fpathconda}")
            has_errors = True

    # verify to_copy packages are not in local target folder
    logger.info("verify to_copy packages are not in local target folder")
    filter_to_copy = set()
    filter_copied = set()
    for k in results["to_copy"]:
        fpathtarbz2 = ZEUS_DEST / subdir / k
        fpathconda = ZEUS_DEST / subdir / k.replace(".tar.bz2", ".conda")
        if fpathtarbz2.is_file() or fpathconda.is_file():
            logger.warning(f"Package in target folder! {fpathtarbz2} {fpathconda}")
            has_warnings = True
            filter_copied.add(fpathtarbz2)
            filter_copied.add(fpathconda)
        else:
            fpathtarbz2 = local_dir / subdir / k
            fpathconda = local_dir / subdir / k.replace(".tar.bz2", ".conda")
            filter_to_copy.add(fpathtarbz2)
            filter_to_copy.add(fpathconda)
    results["to_copy"] = filter_to_copy

    return results, has_errors, has_warnings


def copy_failed(msg: str):
    logger.error(msg)
    logger.critical("Sorry captain; try again!")
    sys.exit()


# Actually copy the files.
def copy_files(files: DefaultDict[str, List[str]], dry_run: bool = True):
    if not files:  # if dict is empty it will be false
        logger.critical(
            (
               "Terminating; no files found to transfer. "
               "Better check your inventory captain!"
            )
        )
        sys.exit()

    if dry_run:
        logger.info("Setting transporter for a dry run, captain!")
    if input("Do you wish to continue? (y/n)").lower() != "y":
        logger.info("Terminating - not ready to be beamed up yet, captain?")
        sys.exit()

    user_id = os.getuid()
    user_name = pwd.getpwuid(user_id).pw_name
    group_name = "builders"
    try:
        group_id = grp.getgrnam(group_name).gr_gid
    except Exception:
        copy_failed(f"Failed to obtain id for group '{group_name}'; terminating!")

    for arch, list_of_files in files.items():
        final_path = ZEUS_DEST / arch
        for file in list_of_files:
            try:
                dest_filepath = final_path / os.path.split(file)[1]
                if not dry_run:
                    # doesn't delete but closes the open temporary file on __exit__
                    with NamedTemporaryFile(
                        delete=False,
                        prefix=f"{dest_filepath.name}.",
                        suffix=".scotty",
                        dir=final_path,
                    ) as tf:
                        try:
                            # avoid partially copied packages
                            shutil.copy2(file, tf.name)
                            os.rename(tf.name, dest_filepath)
                        except Exception:
                            os.unlink(tf.name)
                            raise

                logger.info("Copied file %s to %s", file, final_path)
            except Exception:
                copy_failed(f"Could not copy file {file}; terminating!")

            try:
                if not dry_run:
                    os.chmod(dest_filepath, DEFAULT_PERMISSIONS)
                logger.info(
                    "Permissions (%o) set for file %s",
                    DEFAULT_PERMISSIONS,
                    dest_filepath,
                )
            except Exception:
                copy_failed(
                    (
                        f"Could not set permissions ({DEFAULT_PERMISSIONS:o}) "
                        "for file {dest_filepath}; terminating!"
                    )
                )

            try:
                if not dry_run:
                    os.chown(dest_filepath, user_id, group_id)
                logger.info(
                    "Ownership (%s:%s) set for file %s\n",
                    user_name,
                    group_name,
                    dest_filepath,
                )
            except Exception:
                copy_failed(
                    (
                        f"Could not set ownership ({user_name}:{group_name}) "
                        "for file {dest_filepath}; terminating!"
                    )
                )

    if dry_run:
        finish_msg = "Transporter dry run complete"
    else:
        finish_msg = "Everything's up here"

    logger.info("Success - %s! Until next time, captain!", finish_msg)


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="copy what",
        description="Get a list of files to copy",
    )
    parser.add_argument(
        "-s",
        "--subdir",
        type=str,
        help="subdir",
    )

    parser.add_argument(
        "-l",
        "--local_dir",
        type=Path,
        help="local_dir",
    )

    parser.add_argument(
        "-n",
        "--dry-run",
        help="run in dry-run mode, where everything except the actual transfer occurs",
        action="store_true",
    )

    return parser


if __name__ == "__main__":

    parser = create_parser()
    args = parser.parse_args()

    results, has_errors, has_warnings = filter_repodata(args.subdir, args.local_dir)
    if has_errors:
        logger.error("Errors were found. Abort...")
        if input("Do you wish to continue? (y/n)").lower() != "y":
            logger.info("Terminating - not ready to be beamed up yet, captain?")
            sys.exit()

    if has_warnings:
        logger.warning("Warning were found.")
        if input("Do you wish to continue? (y/n)").lower() != "y":
            logger.info("Terminating - not ready to be beamed up yet, captain?")
            sys.exit()

    logger.info(f"TO_COPY {results['to_copy']}")
    final_files = {args.subdir: results["to_copy"]}
    copy_files(final_files, args.dry_run)
