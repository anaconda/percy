"""
Provides a sync method which can be used to sync an existing recipe with content form grayskull.

Disclaimer:
This is putting together a bunch of code previously written.
This does not claim to be pretty or bullet-proof.
Code in general should be updated to use the CRM renderer whenenver possible.
perseverance-scripts diff-deps may in a better state at the time you are reading this.
https://github.com/anaconda/perseverance-scripts/blob/main/perseverance_scripts/commands/diff_deps.py
"""

import logging
import os
import re
import subprocess
import tempfile
from pathlib import Path

import percy.render.recipe
from percy.render._renderer import RendererType


def gen_grayskull_recipe(gs_file_path: Path, package_spec: str, no_run_constrained: bool = True):
    """
    Calls grayskull and format the resulting recipe for easy processing.

    :param gs_file_path: Path of the grayskull recipe (out)

    :param package_spec: Package spec accepted by grayskull pypi

    :param no_run_constrained: Do not add run_constrained sections

    :returns: (raw_recipe, rendered_recipe, sections)
    """
    sections = ["build", "host", "run"]
    with tempfile.NamedTemporaryFile(mode="w+", encoding="utf-8") as tmp_file:
        # call grayskull
        cmd = "grayskull pypi"
        if not no_run_constrained:
            cmd += " --extras-require-all"
        cmd += f" -o {tmp_file.name} {package_spec}"
        print(cmd)
        subprocess.run(
            cmd,
            shell=True,
            encoding="utf-8",
            capture_output=True,
            check=True,
        )
        content = tmp_file.read()

        # format run_constrained to match what we usually keep
        content = re.sub(r"# Extra: .*(test|dev|bench|ruff|lint|doc|sphinx|quality).*\n(\s*-.*\n)+", "", content)
        p = re.findall(r"# Extra: (.*)", content)
        for m in p:
            sec = f"run_constrained_{m}"
            sections.append(sec)
            content = re.sub(rf"# Extra: ({m}).*", rf"  {sec}:", content)
        # write final grayskull recipe
        with open(gs_file_path, "w", encoding="utf-8") as f:
            f.write(content)

        # render recipe - RAW
        rendered_recipes = percy.render.recipe.render(
            recipe_path=gs_file_path,
            renderer=RendererType.RUAMEL_JINJA,
        )
        raw_recipe = next((x for x in rendered_recipes if not x.skip), next(iter(rendered_recipes)))

        # render recipe - rendered
        rendered_recipes = percy.render.recipe.render(
            recipe_path=gs_file_path,
            renderer=RendererType.PYYAML,
        )
        rendered_recipe = next((x for x in rendered_recipes if not x.skip), next(iter(rendered_recipes)))

        return raw_recipe, rendered_recipe, sections


def sync(
    recipe_path: Path,
    package_spec: str | None,
    no_run_constrained: bool,
    no_bump: bool,
    no_linter: bool,
    no_temp_files: bool,
):
    """
    Sync a recipe with content fetched from grayskull.

    :param recipe_path: Path to meta.yaml

    :param package_spec: Package spec accepted by grayskull pypi (optional)

    :param no_run_constrained: Do not add run_constrained sections

    :param no_bump: If no version update, do not bump build number

    :param no_linter: Do not run linter

    :param no_temp_files: Do leave intermediate files

    """

    try:
        # render recipe - processing jinja and selectors
        rendered_recipes = percy.render.recipe.render(
            recipe_path=recipe_path,
            renderer=RendererType.PYYAML,
        )
        rendered_recipe = next((x for x in rendered_recipes if not x.skip), next(iter(rendered_recipes)))

        # render recipe - RAW
        rendered_recipes = percy.render.recipe.render(
            recipe_path=recipe_path,
            renderer=RendererType.RUAMEL_JINJA,
        )
        raw_recipe = next((x for x in rendered_recipes if not x.skip), next(iter(rendered_recipes)))

        # package spec
        if package_spec is None:
            package_spec = next(iter(rendered_recipe.packages.keys()))
    except Exception as error:  # pylint: disable=broad-exception-caught
        logging.error("Failed to render existing recipe. %s", error)
        return

    try:
        # load grayskull recipe
        gs_file_path = recipe_path.parent / "grayskull.yaml"
        gs_raw_recipe, gs_rendered_recipe, sections = gen_grayskull_recipe(
            gs_file_path, package_spec, no_run_constrained
        )
        if no_temp_files:
            try:
                os.remove(gs_file_path)
            except OSError:
                pass
    except Exception as error:  # pylint: disable=broad-exception-caught
        logging.error("Failed to load data from grayskull. %s", error)
        return

    try:
        # sync changes
        grayskull_version = gs_rendered_recipe.meta.get("package", {}).get("version", "-1")
        local_version = rendered_recipe.meta.get("package", {}).get("version", "-1")
        if grayskull_version == local_version:
            # no version change, bump build number
            if not no_bump:
                build_number = str(int(rendered_recipe.meta.get("build", {}).get("number", "0")) + 1)
                raw_recipe.set_build_number(build_number)
        else:
            raw_recipe.set_version(grayskull_version)
            raw_recipe.set_sha256(gs_rendered_recipe.meta.get("source", {}).get("sha256", "unknown"))
            raw_recipe.set_build_number("0")

            # build dep patch instructions
            patch_instructions = []
            sep_map = {
                ">=": "<",
                ">": "<=",
                "==": "!=",
                "!=": "==",
                "<=": ">",
                "<": ">=",
            }
            skip_value = None
            for section in sections:
                try:
                    for pkg_spec in gs_raw_recipe.get(f"requirements/{section}"):
                        pkg_spec = pkg_spec.replace("<{", "{{")
                        if pkg_spec.startswith("python "):
                            for sep, opp in sep_map.items():
                                s = pkg_spec.split(sep)
                                if len(s) > 1:
                                    skip_value = "".join(s[1].strip().split(".")[:2])
                                    skip_value = f"py{opp}{skip_value}"
                                    pkg_spec = "python"
                                    break

                        section_name = section
                        print(section, pkg_spec)
                        if section.startswith("run_constrained"):
                            if len(pkg_spec.split()) < 2:
                                continue
                            (section_name, extra) = section.rsplit("_", 1)
                            pkg_spec = f"{pkg_spec} # extra:{extra}"

                        patch_instructions.append(
                            {
                                "op": "add",
                                "path": f"requirements/{section_name}",
                                "match": rf"{pkg_spec.split()[0]}( .*)?",
                                "value": [pkg_spec],
                            }
                        )
                except KeyError as e:
                    print(e)
                    continue

            if skip_value:
                raw_recipe.update_py_skip(skip_value)
            raw_recipe.patch(patch_instructions, False, False)

    except Exception as error:  # pylint: disable=broad-exception-caught
        logging.error("Failed to sync changes to recipe. %s", error)
        return

    try:
        # run linter with autofix
        if not no_linter:
            subprocess.call("conda lint . --fix", text=True, shell=True)
    except Exception as error:  # pylint: disable=broad-exception-caught
        logging.error("Failed to lint synced recipe. %s", error)
