# Changelog

All notable changes to this repository will be documented in this file.

This project follows a simplified version of [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

- Planning integration of `starship` and `konsole-theme` modules
- Preparing for full system bootstrap support (WIP)

---

## [0.5.0] – 2025-05-09

### Added

- README.md overhaul
- Added and reorganized the Git aliases
- Introduced `scripts/version-check.sh` to validate tool versions against `installed_tools.json`
- Created `scripts/audit-log.sh` for logging all tool install events
- Implemented `scripts/registry.sh` for centralized install tool definitions
- Added `scripts/lib/install-utils.sh` to standardize install type/path detection
- All install scripts now source `install-utils.sh` for consistency and modularity
- Introduced `installed_tools.json` to track installed tools, versions, and paths
- Started Docs/ folder
- Introduced `Makefile` with task targets: `bootstrap`, `lint-zsh`, `konsole`, `nvim`, `audit`, `push`
- Created `Makefile.local` support for private or system-specific overrides
- Added `scripts/lint-zshrc-modules.sh` for linting modular `.zshrc.d` files
- Created initial `80-*.zsh` helpers for: Python, Go, Node.js, Rust

### Changed

- Updated install scripts to log metadata and audit entries automatically post-install
- Centralized all `$PATH` management into `20-paths.zsh`
- Removed `72-nodejs.zsh` (redundant after Volta integration)
- Reorganized Volta and runtime environment logic across 70s and 80s series files

### Removed

- Deprecated `nvm` and global `npm install -g` usage in favor of Volta-managed tooling

## [0.1.0] – 2025-05-03

### Added in 0.1.0

- Initial repo structure for `przcfg`
- Added modular Zsh config with `.zshrc` and `.zshrc.d/`
- Added `prez-dev-setup.sh` (non-destructive)
- Added README and manual symlink instructions
