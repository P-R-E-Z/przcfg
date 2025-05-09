#!/usr/bin/env zsh

echo "[PATH Checker] Validating important dev tool paths..."

declare -a path_dirs=(
    "$HOME/.local/bin"
    "$HOME/.pyenv/bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    "$HOME/.volta/bin"
    "$HOME/.npm-global/bin"
    "/usr/local/go/bin"
    "$JAVA_HOME/bin"
)

for dir in "${path_dirs[@]}"; do
    if [[ -d "$dir" ]]; then
        echo "Found: $dir"
    else
        echo "Missing: $dir"
    fi
done

# Copy & paste this in your terminal to make the script executable:
# chmod +x check-paths.zsh
