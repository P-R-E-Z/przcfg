# ─── Navigation & System ──────────────────────────
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"
alias cls="clear && ls"
alias update="sudo dnf upgrade --refresh -y"
alias inst="sudo dnf install"
alias ports="sudo lsof -i -P -n | grep LISTEN"
alias rmf="rm -rf"
alias szsh="source ~/.zshrc"
alias cat="bat"

# ─── File & Folder Tools ──────────────────────────
alias mkcd='func() { mkdir -p "$1" && cd "$1"; }; func'
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias lsd="eza -lah --icons --only-dirs"
alias lsf="eza -lah --icons --only-files"

# ─── Dev Tools ────────────────────────────────────
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate --all"
alias py="python3"
alias pyi="python3 -m venv venve && source venve/bin/activate"
alias serve="python3 -m http.server"
alias code.="code ."
alias nv="nvim"

# ─── Fedora + System ──────────────────────────────
alias reboot="sudo reboot"
alias shutdown="sudo poweroff"
alias btop="btm"
alias flushdns="sudo system-resolve --flush-caches"

# ─── Cleanup ──────────────────────────────────────
alias cleanup="sudo dnf autoremove -y && sudo dnf clean all"
alias clrlog="sudo journalctl --vacuum-time=3d"

# ─── Ricing & Config ──────────────────────────────
alias koncfg="kate ~/.config/konsolerc &"
alias zrcfg="kate ~/.zshrc &"
alias ohmycfg="kate ~/.oh-my-zsh"
alias starcfg="kate ~/.config/starship.toml &"
alias kreload="killall plasmashell && kstart5 plasmashell"

# ─── Flatpak ──────────────────────────────────────
alias flist="flatpak list"
alias finstall="flatpak install flathub"
alias funinstall="flatpak uninstall"

# ─── Kubernetes ───────────────────────────────────
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgn="kubectl get nodes"

# ─── Redis ────────────────────────────────────────
alias rediscli="redis-cli"

# ─── PostgreSQL ───────────────────────────────────
alias pgcli="sudo -u postgres psql"

# ─── Safety ───────────────────────────────────────
alias cp="cp -i"
alias mv="mv -i"
