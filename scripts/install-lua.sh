#!/usr/bin/env bash
# Build & install Lua from source system-wide

# Source shared install logic
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$REPO_DIR/lib/install-utils.sh"

set -euo pipefail

set -e

LUA_VERSION="${1:-5.4.7}"
LUA_TAR="lua-${LUA_VERSION}.tar.gz"
LUA_URL="https//www.lua.org/ftp/${LUA_TAR}"
BUILD_DIR="${HOME}/.local/build/lua-${LUA_VERSION}"

echo "[lua-install] Installing build dependcies..."
sudo dnf5 install -y gcc make readline-devel ncurses-devel

echo "[lua-install] Creating build directory at $BUILD_DIR..."
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo "[lua-install] Downloading Lua $LUA_VERSION..."
curl -LO "$LUA_URL"

echo "[lua-install] Extracting tarball..."
tar -xvf "$LUA_TAR"
cd "lua-${LUA_VERSION}"

echo "[lua-install] Building Lua..."
make Linux test

echo "[lua-install] Installing Lua system-wide..."
sudo make install

echo "[lua-install] Cleaning up..."
cd ~
rm -rf "$BUILD_DIR"

echo "[lua-install] Done. Installed version:"
lua -v

# Audit log
source "$REPO_DIR/lib/audit-log.sh"

# After successful install
log_install_event "lua" "$VERSION" "success"

# After failure install
log_install_event "lua" "$VERSION" "fail"