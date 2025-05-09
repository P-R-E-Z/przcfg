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

# ─── Git ────────────────────────────────────

# Add & Commits
alias ga="git add ."
alias gaa="git add --all"
alias gcm="git commit -m"
alias gca="git commit --ammend --no-edit"
alias gcam="git commit --amend -m"

# Undo & Fix
alias gunstage="git reset HEAD --"
alias gundo="git reset --soft HEAD-1"
alias ghard="git reset --hard"

# Merge & Rebase
alias gmt="git mergetool"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"

# Stashing
alias gst="git stash"
alias gstp="git stash pop"
alias gstl="git stash list"
alias gstc="git stash clear"

# Inspect & Browse
alias glg="git log --oneline --graph --decorate --all"
alias gshow="git show"
alias gblame="git blame"

# Remotes
alias gfetch="git fetch --all --prune"
alias gclean="git clean -xdf"

# I will organize these later
alias gs="git status"
alias gd="git diff"
alias gp="git push"
alias gb="git branch"
alias gco="git checkout"
alias gpo="git push origin HEAD"
alias gpull="git pull origin"


# ─── Dev Tools ────────────────────────────────────

# IDE
alias vs="code ."
alias devup="devcontainer up"
alias nv="nvim"
alias pcharm="jetbrains-gateway"

# Python & Virtualenv
alias py="python3"
alias pyi="python3 -m venv venve && source venve/bin/activate"
alias serve="python3 -m http.server"
alias pclean="find . -type d -name '__pycache__ -exec rm -r {} + && find . -name '*.pyc' -delete"
alias pd="poetry run python"
alias pt="poetry run pytest"
alias pout="poetry export -f requirements.txt --without-hashes > requirements.txt"

# Podman
alias psp="podman ps --format '{{.Names}}\t{{.Status}}"
alias plogs="podman logs -f"
alias psh="podman exec -it"
alias pbuild="podman build -t"

# FastAPI / Uvicorn
alias apidev="uvicorn app.main:app --reload"
alias apiport="lsof -i :8000"

# Kubernetes / Kind
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgn="kubectl get nodes"
alias kctx="kubectl config current-context"
alias kdesc="kubectl describe"
alias krm="kubectl delete pod --grace-period=0 --force"
alias klogs="kubectl logs -f"

# Postgres / Redis
alias pgstart="sudo systemctl start postgresql"
alias pgstop="sudo systemctl stop postgresql"
alias pgstatus="sudo systemctl status postgresql"
alias pgcli="sudo -u postgres psql"
alias pgshell="PGPASSWORD=<password> psql -U <user> -h localhost -d <db>"
alias rediscli="redis-cli"

# LLM / LangChain / Inference
alias langlog="tail -f logs/langchain.log"
alias lsynth="poetry run python scripts/synthesize.py"

# Networking & API Tools
alias curljson="curl -H 'Content-Type: application/json'"
alias jwtdecode="python -m jwt.cli decode"
alias pingapi="curl -I http://localhost:8000"

# Testing / QA
alias ptest="pytest -v --tb=short"
alias ptestcov="pytest --cov=."
alias testweb="playwright test"
alias testhead="playwright test --headed"

# Docs / MkDocs
alias mkdocsup="mkdocs serve"
alias mkdocsbuild="mkdocs build && mkdocs gh-deploy"

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

# ─── Safety ───────────────────────────────────────

alias cp="cp -i"
alias mv="mv -i"
