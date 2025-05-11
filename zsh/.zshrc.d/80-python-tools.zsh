# Python tool helpers

# Defer Poetry completions until after compinit (inside oh-my-zsh.sh)
if (( ${+functions[compdef]} )) && command -v poetry &>/dev/null; then
  eval "$(poetry completions zsh)"
fi

# Prevent Python from writing .pyc files outside of __pycache__
export PYTHONDONTWRITEBYTECODE=1
