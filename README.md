# Welcome to ~/.*

These are my personal configuration dotfiles for pretty much everything I use across all systems.

![image](https://github.com/user-attachments/assets/680386ff-b822-4115-8a92-db4fee73e3c8)

## What's inside

| Path | Description |
| --- | --- |
| `Brewfile` | Homebrew formulae, casks, and fonts |
| `config/wezterm/` | WezTerm terminal config |
| `config/tmux/` | tmux overrides (`.tmux.conf.local`, on top of [gpakosz/.tmux](https://github.com/gpakosz/.tmux)) |
| `config/zsh/` | `.zshrc`, Powerlevel10k theme, and shell aliases (work/personal git emails prompted on install) |
| `config/git/` | global `.gitconfig` |
| `config/wakatime/` | WakaTime config (API key prompted on install) |
| `prompts/` | AI agent instructions (`AGENTS.md`), symlinked to `~/.claude/CLAUDE.md` and `~/.config/opencode/AGENTS.md`; `context7.md` rule loaded by opencode via `instructions` |
| `scripts/` | bootstrap and GCP helper scripts |

## Install

Clone anywhere and run the bootstrap script — it installs Homebrew, Oh My Zsh,
tmux, the Brewfile, and symlinks every config. It's safe to re-run.

```sh
git clone https://github.com/<you>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./scripts/setup_dotfiles
```

Open `nvim` once afterwards to finish the NvChad plugin install.

`make all` (or `make git-identity`) prompts for your work/personal git
emails and writes them to the gitignored `config/zsh/git-identity.local`,
read by the `set-git-identity` alias. Already-set values are skipped.

## Makefile targets

Symlink individual configs without the full bootstrap:

```sh
make help    # list all targets
make all     # symlink every config
make zsh     # just the zsh config, etc.
make lint    # run shellcheck over scripts/
```
