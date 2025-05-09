# Python Environment - pyenv / poetry

# Set pyenv root (PATH is in 20-paths.zsh)
export PYENV_ROOT="$HOME/.pyenv"

# Init pyenv pyenv-virtualenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
fi
