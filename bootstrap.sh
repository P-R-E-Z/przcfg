#!/usr/bin/env bash

# przcfg bootstrap.sh – WIP system dotfiles setup
# This script will eventually automate full system configuration.
# For now, it links modular dotfiles (e.g., Zsh) without overwriting system files.
#
# Manual alternatives:
# ln -sf ~/dotfiles/przcfg/zsh/.zshrc ~/.zshrc
# ln -sfn ~/dotfiles/przcfg/zsh/.zshrc.d ~/.zshrc.d

set -e

# Read version from .version file
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION_FILE="$REPO_DIR/.version"
VERSION="unknown"

if [ -f "$VERSION_FILE" ]; then
  VERSION=$(cat "$VERSION_FILE")
fi

if [[ "$VERSION" == "dev" || "$VERSION" == "unreleased" ]]; then
  echo "Warning: this is a development version of przcfg."
fi

echo "[przcfg] Bootstrap script (version $VERSION) starting..."
