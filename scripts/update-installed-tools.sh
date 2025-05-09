#!/usr/bin/env bash
# Update installed tool metadata in installed_tools.json

set -e

CONFIG_FILE="$HOME/dotfiles/przcfg/installed_tools.json"
TOOL="$1"
VERSION="$2"
INSTALL_TYPE="$3"   # "system" or "local"
INSTALL_PATH="$4"   # Can include $HOME

# Expand $HOME if not already expanded
INSTALL_PATH="${INSTALL_PATH/\$HOME/$HOME}"

if [[ -z "$TOOL" || -z "$VERSION" || -z "$INSTALL_TYPE" || -z "$INSTALL_PATH" ]]; then
    echo "Usage: $0 <tool> <version> <system|local> <install_path>"
    exit 1
fi

# Create file if it doesn't exist
if [[ ! -f "$CONFIG_FILE" ]]; then
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo "{}" > "$CONFIG_FILE"
fi

echo "[update-installed-tools] Updating $TOOL entry in $CONFIG_FILE..."

jq --arg tool "$TOOL" \
    --arg ver "$VERSION" \
    --arg type "$INSTALL_TYPE" \
    --arg path "$INSTALL_PATH" \
   '.[$tool] = {
      version: $ver,
      installed: true,
      install_type: $type,
      install_path: $path
   }' "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"

echo "[update-installed-tools] Done."