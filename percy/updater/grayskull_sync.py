import re
import subprocess
import tempfile

import percy.render.recipe
from percy.render._renderer import RendererType


def gen_grayskull_recipe(
    gs_file_path,
    package_spec,
    with_run_constrained=True,
):
    """
    Calls grayskull and format the resulting recipe for easy processing.

    :param gs_file_path: Path of the grayskull recipe (out)

    :param package_spec: Package spec accepted by grayskull pypi

    :param with_run_constrained: Add run_constrained sections

    :returns: (raw_recipe, rendered_recipe, sections)
    """
    sections = ["build", "host", "run"]
    with tempfile.NamedTemporaryFile(mode="w+", encoding="utf-8") as tmp_file:
        # call grayskull
        cmd = "grayskull pypi"
        if with_run_constrained:
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
        with open(gs_file_path, "w") as f:
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


def sync(recipe_path, package_spec, with_run_constrained, bump, run_linter):
    """
    Sync a recipe with content fetched from grayskull.

    :param recipe_path: Path to meta.yaml

    :param package_spec: Package spec accepted by grayskull pypi (optional)

    :param with_run_constrained: Add run_constrained sections

    :param bump: If no version update, bump build number

    :param run_linter: Run linter

    """

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

    # load grayskull recipe
    gs_file_path = recipe_path.parent / "grayskull.yaml"
    gs_raw_recipe, gs_rendered_recipe, sections = gen_grayskull_recipe(gs_file_path, package_spec, with_run_constrained)

    # sync changes
    grayskull_version = gs_rendered_recipe.meta.get("package", {}).get("version", "-1")
    local_version = rendered_recipe.meta.get("package", {}).get("version", "-1")
    if grayskull_version == local_version:
        # no version change, bump build number
        if bump:
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

                    if pkg_spec.startswith("python "):
                        for sep, opp in sep_map.items():
                            s = pkg_spec.split(sep)
                            if len(s) > 1:
                                skip_value = f"py{opp}{s[1].strip().replace('.','')}"
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

        # run linter with autofix
        if run_linter:
            subprocess.call("conda lint . --fix", text=True, shell=True)
