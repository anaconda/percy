import click
from percy.commands.recipe import recipe
from percy.commands.aggregate import aggregate

# root click group
@click.group()
def cli():
    pass


# add subcommands
cli.add_command(recipe)
cli.add_command(aggregate)


@cli.command()
def tabcompletion():
    """Print out shell commands for setting up shell completion.

    For local shell use:
        eval "`percy tabcompletion`"

    Add to shell init (i.e. .bashrc, .zshrc) for persistent setup.
    """
    import os

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
