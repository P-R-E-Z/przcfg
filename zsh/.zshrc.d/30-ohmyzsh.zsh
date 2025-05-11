# Core Oh My Zsh Init

export ZSH="$HOME/.oh-my-zsh"
export ZSH_LOADED=1
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf z zoxide zsh-autosuggestions zsh-syntax-highlighting) # zsh-syntax-highlighting always last

# Oh My Zsh core
ZSH_THEME="powerlevel10k/powerlevel10k"



# Performance tuning
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

