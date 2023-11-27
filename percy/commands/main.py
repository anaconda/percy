"""
File:           main.py
Description:    Primary execution point of the `click` command line interface
"""
from __future__ import annotations

import os

import click

from percy.commands.aggregate import aggregate
from percy.commands.recipe import recipe


# root click group
@click.group()
def cli() -> None:
    pass


# add subcommands
cli.add_command(recipe)
cli.add_command(aggregate)


@cli.command()
def tabcompletion() -> None:
    """
    Print out shell commands for setting up shell completion.

    For local shell use:
        eval "`percy tabcompletion`"

    Add to shell init (i.e. .bashrc, .zshrc) for persistent setup.
    """

    shell = os.environ["SHELL"]

    if not shell:
        raise click.ClickException("Must set SHELL environment variable")

    if shell.endswith("zsh"):
        os.system("_PERCY_COMPLETE=zsh_source percy")
    elif shell.endswith("bash"):
        os.system("_PERCY_COMPLETE=bash_source percy")
    else:
        raise click.ClickException(f"Unknown SHELL {shell}")


if __name__ == "__main__":
    cli()
