# Python tool helpers

# Poetry shell completions

if command -v poetry &>/dev/null; then
    eval "$(poetry completions zsh)"
fi

# Prevent Python from writing .pyc files outside of __pycache__
export PYTHONDONTWRITEBYTECODE=1
