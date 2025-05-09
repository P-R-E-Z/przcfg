#!/usr/bin/env bash
# Build & install Lua locally in ~/.local

# Source shared install logic
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$REPO_DIR/lib/install-utils.sh"

set -euo pipefail

set -e

LUA_VERSION="${1:-5.4.7}"
LUA_TAR="lua-${LUA_VERSION}.tar.gz"
LUA_URL="https://www.lua.org/ftp/${LUA_TAR}"
PREFIX="${HOME}/.local/lua-${LUA_VERSION}"
BUILD_DIR="${HOME}/.local/build/lua-${LUA_VERSION}"

echo "[lua-local-install] Creating build directory at $BUILD_DIR..."
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo "[lua-local-install] Downloading Lua $LUA_VERSION..."
curl -LO "$LUA_URL"

echo "[lua-local-install] Extracting tarball..."
tar -xvf "$LUA_TAR"
cd "lua-${LUA_VERSION}"

echo "[lua-local-install] Building Lua..."
make linux MYCFLAGS="-fPIC" MYLDFLAGS="" INSTALL_TOP="$PREFIX"

echo "[lua-local-install] Installing to $PREFIX..."
make install INSTALL_TOP="$PREFIX"

echo "[lua-local-install] Adding Lua to PATH (non-persistent):"
echo "  export PATH=\"$PREFIX/bin:\$PATH\""

echo "[lua-local-install] Cleaning up build dir..."
rm -rf "$BUILD_DIR"

echo "[lua-local-install] Done. Run the following to use it now:"
echo "  export PATH=\"$PREFIX/bin:\$PATH\""

# Audit log
source "$REPO_DIR/lib/audit-log.sh"

echo "[lua-local-install] Installing to $PREFIX..."
if make install INSTALL_TOP="$PREFIX"; then
    echo "[lua-local-install] Installation successful."

    # Log the successful install
    log_install_event "lua-local" "$LUA_VERSION" "success"
else   
    echo "[lua-local-install] Installation failed."

    # Log the failed install
    log_install_event "lua-local" "$LUA_VERSION" "fail"
fi