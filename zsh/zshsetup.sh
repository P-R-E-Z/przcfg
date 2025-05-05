#!/usr/bin/env bash

set -e  # Exit on error
DOTFILES_DIR="$HOME/dotfiles"
ZSH_TARGET="$HOME/.zshrc"
ZSHD_TARGET="$HOME/.zshrc.d"

echo "[ZSH] Linking .zshrc..."
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$ZSH_TARGET"

echo "[ZSH] Linking .zshrc.d directory..."
ln -sfn "$DOTFILES_DIR/zsh/.zshrc.d" "$ZSHD_TARGET"

echo "[ZSH] Setup complete."
