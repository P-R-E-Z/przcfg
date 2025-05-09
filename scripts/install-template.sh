#!/usr/bin/env bash
# Template for tool installers in przcfg
# Usage: ./install-template.sh [version]

# Source shared install logic
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$REPO_DIR/lib/install-utils.sh"

set -euo pipefail

TOOL_NAME="tool-name"
VERSION="${1:-latest}"  # Default if no version passed
INSTALL_TYPE:"type" # "system" or "local"

# Change as needed per tool
INSTALL_PATH_LOCAL="$HOME/.local/bin/${TOOL_NAME}"
INSTALL_PATH_SYSTEM="/usr/local/bin/${TOOL_NAME}"
INSTALL_PATH=" "

if [[ "$INSTALL_TYPE" == "local" ]]; then
    INSTALL_PATH="$INSTALL_PATH_LOCAL"
else
    INSTALL_PATH="$INSTALL_PATH_SYSTEM"
fi

echo "[install-$TOOL_NAME] Starting $INSTALL_TYPE install of $TOOL_NAME $VERSION"

# Skip if already installed and matches desired version
if [[ -x "$INSTALL_PATH" ]]; then
  echo "[install-$TOOL_NAME] $TOOL_NAME already installed at $INSTALL_PATH"
  "$INSTALL_PATH" --version || "$INSTALL_PATH" -v || true
  exit 0
fi

# Create bin dir for local installs
if [[ "$INSTALL_TYPE" == "local" ]]; then
  mkdir -p "$(dirname "$INSTALL_PATH")"
fi

# Example placeholder install logic
echo "[install-$TOOL_NAME] Downloading and installing (this is a placeholder)"
# curl -LO "https://example.com/${TOOL_NAME}-${VERSION}.tar.gz"
# tar -xzf "${TOOL_NAME}-${VERSION}.tar.gz"
# make && make install PREFIX=...

# Simulate install
echo "#!/bin/bash" > "$INSTALL_PATH"
echo "echo '$TOOL_NAME version $VERSION'" >> "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

echo "[install-$TOOL_NAME] Installed $TOOL_NAME $VERSION to $INSTALL_PATH"

# Audit log
source "$REPO_DIR/lib/audit-log.sh"

# After successful install
log_install_event "tool" "$VERSION" "success"

# After failure install
log_install_event "tool" "$VERSION" "fail"
