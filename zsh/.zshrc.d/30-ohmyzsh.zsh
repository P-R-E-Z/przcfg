# Core Oh My Zsh Init

# Prevent duplicate sourcing
if [[ -n "$ZSH_LOADED" ]]; then return; fi
export ZSH_LOADED=1

# Oh My Zsh core
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  fzf
  z
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting # Always last for proper rendering
)

# Performance: git plugin zstyle tweaks
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

source $ZSH/oh-my-zsh.sh

# Load powerlevel10k config if present
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
