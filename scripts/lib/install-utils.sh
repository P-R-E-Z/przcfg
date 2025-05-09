#!/usr/bin/env bash
# Shared helpers for przcfg install script

detect_install_type() {
    if [[ "$(id -u)" -eq 0 ]]; then
        echo "system"
    else
        echo "local"
    fi
}

expand_path() {
    # Expands $HOME in install path
    local raw="$1"
    echo "${raw/\$HOME/$HOME}"
}