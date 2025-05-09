for file in $(ls -1 ~/.zshrc.d/*.zsh | sort); do source "$file"; done

