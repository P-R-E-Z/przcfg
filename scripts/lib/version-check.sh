#!/usr/bin/env bash
# Validate tool version vs registry

REGISTRY="$HOME/dotfiles/przcfg/installed_tools.json"  # place holder

check_tool_version() {
    local tool="$1"
    local expected
    local actual

    expected="$(jq -r --arg tool "$tool" '.[$tool].version' "$REGISTRY")"
    actual="$("$tool" --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -n1)"

    if [[ "$expected" != "$actual" ]]; then
        echo "[$tool] Version mismatch! Expected: $expected, Found: $actual"
        return 1
    else
        echo "[$tool] Version OK ($actual)"
        return 0
    fi
}