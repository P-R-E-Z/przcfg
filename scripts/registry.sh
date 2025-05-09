#!/usr/bin/env bash
# Central tool registry for przcfg bootstrap

TOOLS=( # This isn't working yet
  # Format: "name|version|install_type|path|script"
  "lua|5.4.7|system|/usr/local/bin/lua|install-lua.sh"
  "lua-local|5.4.7|local|\$HOME/.local/lua-5.4.7/bin/lua|install-lua-local.sh"
  "nvim|nightly|local|\$HOME/.local/bin/nvim|install-nvim.sh"
  "zsh|oh-my-zsh|system|/usr/bin/zsh|install-zsh.sh"
  "konsole-theme|Carl|local|\$HOME/.local/share/konsole|install-konsole.sh"
)
