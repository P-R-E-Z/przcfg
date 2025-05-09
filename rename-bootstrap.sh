#!/usr/bin/env bash
# rename-prez-dev-setup.sh – Full repo-wide rename of prez-dev-setup.sh → prez-dev-setup.sh
# Also updates Makefile target from bootstrap → prez-setup

set -euo pipefail

OLD_SCRIPT="prez-dev-setup.sh"
NEW_SCRIPT="prez-dev-setup.sh"
OLD_TARGET="bootstrap"
NEW_TARGET="prez-setup"

echo "[+] Scanning and replacing all references in repo..."

# 1. Rename the actual file if it exists
if [ -f "$OLD_SCRIPT" ]; then
  echo "[+] Renaming $OLD_SCRIPT → $NEW_SCRIPT"
  mv "$OLD_SCRIPT" "$NEW_SCRIPT"
else
  echo "[!] $OLD_SCRIPT not found (file rename skipped)"
fi

# 2. Replace text in all tracked files (safe mass-replace)
grep -rl --exclude-dir=.git "$OLD_SCRIPT" . | xargs sed -i "s/$OLD_SCRIPT/$NEW_SCRIPT/g"
grep -rl --exclude-dir=.git "make $OLD_TARGET" . | xargs sed -i "s/make $OLD_TARGET/make $NEW_TARGET/g"
grep -rl --exclude-dir=.git "^$OLD_TARGET:" . | xargs sed -i "s/^$OLD_TARGET:/$NEW_TARGET:/g"

echo "[✓] All occurrences of '$OLD_SCRIPT' and 'make $OLD_TARGET' replaced."

# Optional git diff preview
echo "[?] Run 'git diff' to confirm changes before committing."
