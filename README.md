Personal scoped dotfile configs for `Prez`.

This repo contains modular configurations used across my Fedora 42 Workstation setups. Each folder is purpose-built for a specific tool, keeping configs easy to track and deploy.

## Requirements

This config setup assumes you are running a Fedora-based Linux system (tested on Fedora 42+) and have the following tools installed:

### Shell & Terminal
- `zsh` – the main shell environment
- `oh-my-zsh` – plugin + theme framework for Zsh
- `starship` – cross-shell prompt (used alongside Powerlevel10k)
- `powerlevel10k` – Zsh theme (loaded via Oh My Zsh)
- `zoxide` – smarter `cd` alternative
- `fzf` – fuzzy finder used in terminal workflows

### CLI Tools
- `eza` – modern `ls` replacement
- `bat` – modern `cat` with syntax highlighting
- `btop` or `btm` – modern resource monitor (used in alias `btop`)
- `git` – version control system (required for syncing)

### Editors
- `neovim` – advanced terminal-based code editor (optional but supported)
- `kate` – used for opening dotfiles in GUI from terminal (e.g. `zrcfg` alias)

### KDE Plasma (optional but recommended)
- Konsole – KDE’s terminal emulator (theming support included)
- Plasma desktop environment – for applying full desktop config later

> Optional: `direnv`, `pyenv`, `flatpak`, `kubectl`, `redis-cli`, and `psql` if you use those aliases/modules.

---

> This repo is a **work-in-progress** and will evolve into a full system bootstrap. For now, configs are provided for developer CLI tools and KDE theming.


## Structure

- `zsh/` – `.zshrc`, modular `.zshrc.d` files, shell bootstrap script
- `konsole-theme/` – KDE Konsole profiles, colorschemes, and session settings

## Usage

Clone into your `~/dotfiles` directory:

```bash
git clone https://github.com/P-R-E-Z/przcfg ~/dotfiles/przcfg

## Bootstrap Script (WIP)

This repo includes a WIP `bootstrap.sh` script designed to link modular configuration files into your home directory.

## What It Does (So Far):
- Symlinks Zsh configs:
  - `zsh/.zshrc` → `~/.zshrc`
  - `zsh/.zshrc.d/` → `~/.zshrc.d/`
- Detects presence of Konsole theme files (manual step for now)
- Non-destructive: it won't overwrite existing system files or install any packages yet

### Run It Manually:

```bash
chmod +x bootstrap.sh
./bootstrap.sh

## Manual Symlink Instruction
ln -sf ~/dotfiles/przcfg/zsh/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/przcfg/zsh/.zshrc.d ~/.zshrc.d
