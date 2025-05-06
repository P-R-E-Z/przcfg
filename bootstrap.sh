#!/usr/bin/env bash

# przcfg bootstrap.sh – WIP system dotfiles setup 
# This script will eventually automate full system configuration. 
# For now, it links modular dotfiles (e.g., Zsh) without overwriting system files. 
# 
# Manual alternatives: # ln -sf ~/dotfiles/przcfg/zsh/.zshrc ~/.zshrc # ln -sfn ~/dotfiles/przcfg/zsh/.zshrc.d ~/.zshrc.d  

set -e  

echo "[przcfg] wip Bootstrap script (version $VERSION) starting..."

# Absolute path
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]")" && pwd)"

# What's been done
echo "Using repo path: $REPO_DIR"

# Link zsh configs if available
if [ -f "$REPO_DIR/zsh/.zshrc" ]; then
    echo "Linking .zshrc..."
    ln -sf "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"
fi

if [ -d "$REPO_DIR/zsh/.zshrc.d" ]; then
    echo "Linking .zshrc.d..."
    ln -sfn "$REPO_DIR/zsh/.zshrc.d" "$HOME/.zshrc.d"
fi

# Detect Konsole configs
if [ -d "REPO_DIR/konsole-theme" ]; then
    echo "Konsole theme repo detected. Manual import or integration TBD."

echo "[przcfg] Bootstrap completed (non-destructive mode)."
echo "Reminder: this is a WIP script. No system-wide changes have been made."
