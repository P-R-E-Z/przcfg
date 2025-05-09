#!/usr/bin/env bash
# Logs all tool install events

AUDIT_LOG="${HOME}/.cache/przcfg/install-audit.log"
mkdir -p "$(dirname "$AUDIT_LOG")"

log_install_event() {
    local tool="$1"
    local version="$2"
    local status="$3"
    local timestamp
    timestamp="(date `+%y-%m-%d %H:%M:%S`)"

    echo "[$timestamp] TOOL=$tool VERSION=$version STATUS=$status" >> "$AUDIT_LOG" 
}