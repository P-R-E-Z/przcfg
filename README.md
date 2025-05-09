(https://github.com/P-R-E-Z/przcfg)
[![Fedora 42](https://img.shields.io/badge/OS-Fedora%2042-blue)](https://getfedora.org/)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh](https://img.shields.io/badge/shell-zsh-informational)](https://www.zsh.org/)
[![Editor: Neovim](https://img.shields.io/badge/editor-neovim-purple)](https://neovim.io/)

**przcfg** is a Fedora 42 developer environment template, not just a dotfiles repo.

It includes:

- Shell and editor configs (Zsh, Neovim, Konsole, etc.)
- Dev tool install automation
- Audit + logging of installed tools
- Version checking and future GUI bootstrap support

It was built by Prez (a developer + ASRT student) to quickly spin up a reliable Linux development environment using one script. While originally structured inside a `~/dotfiles/` folder for personal use, it has now turned into a full on project to make a developer ready script that will install all the tools (that I use only, for now) and so much more. A quick TL,DR all of the install scripts that the prez-dev-setup.sh uses to install things like lua, neovim, zsh, etc., will be installed from official sources so wherever they are pathed to is decided by their devs not me, but I do have a registry.sh that tracks everything that was installed. Everything installed that isn't a script, like zshrc.d will go into your Home folder. There's some cool stuff here so if you don't want to use anything from my setup feel to check out the scripts and let me know if there's anything you think I could do better!

> No hardcoded paths. Everything is dynamically resolved at runtime.

---

<details>
<summary><strong>Cloning przcfg</strong></summary>

You **do not need to clone this into `~/dotfiles/przcfg/`** unless you want to for organizational purposes.

```bash
git clone https://github.com/P-R-E-Z/przcfg ~/Dev/przcfg
cd ~/Dev/przcfg
chmod +x prez-dev-setup.sh
./prez-dev-setup.sh
```

If you're using this as a full environment template, choose any path you want. If you're just trying out specific tools or configs (like Neovim), feel free to clone it into a project folder and run selective scripts manually.

---

### Optional Convention

I personally uses this structure:

```plaintext
~/dotfiles/przcfg/       # Main config + toolchain repo
~/dotfiles/other-repos/  # Any isolated module repos (if broken out)
```

But that’s just a convention — not a requirement. Clone it wherever you want. The scripts will still Just Work™... hopefully.
</details>

---

<details>
<summary><strong>Requirements</strong></summary>

### Shell & Terminal

- `zsh`, `oh-my-zsh`, `starship`, `powerlevel10k`
- `zoxide`, `fzf`, `eza`, `bat`, `btop`

### Editors

- `neovim` (primary, Lua-based)
- `kate` (used for `.md` and GUI editing during setup)

### KDE Plasma

- Konsole terminal, with custom themes
- Plasma desktop (optional, but recommended for full theming)

### Node & Python Toolchains

- `volta`, `npm`, `pnpm`
- `pyenv`, `poetry`, `direnv`

> Optional: `kubectl`, `redis-cli`, `psql`, `flatpak`

</details>

---

<details>
<summary><strong>Repo Structure</strong></summary>

```
przcfg/
├── zsh/                  # .zshrc and modular shell configs
├── nvim/                 # Neovim Lua config (WIP)
├── konsole/              # Konsole profiles and colors
├── scripts/              # Bootstrap logic, version checks, registry
├── logs/                 # Audit and metadata files (tracked)
├── prez-dev-setup.sh     # Main installer
├── Makefile              # CLI shortcuts for tasks
└── .gitignore
```

</details>

---

<details>
<summary><strong>Usage</strong></summary>

### Run Setup

```bash
cd /path/to/przcfg
chmod +x prez-dev-setup.sh
./prez-dev-setup.sh
```

Or use the `Makefile`:

```bash
make prez-setup
```

### Manual Symlinks (Optional)

```bash
ln -sf /path/to/przcfg/zsh/.zshrc ~/.zshrc
ln -sfn /path/to/przcfg/zsh/.zshrc.d ~/.zshrc.d
```

</details>

---

<details>
<summary><strong>Logs and Tool Metadata</strong></summary>

This repo includes a `logs/` directory containing files that track your dev environment state. These are versioned intentionally.

| File | Purpose |
|------|---------|
| `logs/installed_tools.json` | Expected tools and versions, updated via `update-installed-tools.sh` |
| `logs/version-check-results.json` | Output from `version-check.sh`, comparing live system state to registry |
| `logs/audit.log` | Output from `audit-log.sh`, documenting installs, version tests, and events |

---

### Sample `audit.log` Entry

```json
{
  "timestamp": "2025-05-09T15:12:03Z",
  "tool": "lua",
  "action": "install_check",
  "version_expected": "5.4.7",
  "version_actual": "5.4.7",
  "status": "pass",
  "source": "version-check.sh"
}
```

> Future audit logs will record system events, install results, version mismatches, or script errors with timestamps.

</details>
