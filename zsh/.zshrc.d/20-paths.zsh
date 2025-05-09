# PATH Setup - Centralized for all runtimes and tools

# Volta (Node.js tool manager) - must be first
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# User-local binaries
export PATH="$HOME/.local/bin:$PATH"

# Python environment manager
export PATH="$HOME/.pyenv/bin:$PATH"

# Rust (Cargo)
export PATH="$HOME/.cargo/bin:$PATH"

# Go binaries (installed via go install)
export PATH="$HOME/go/bin:$PATH"

# Node.js
export PATH="$HOME/.volta/bin:$PATH"

# OPTIONALS:
# NPM Global bin (optional fallback, not needed with volta)
export PATH="$HOME/.npm-global/bin:$PATH"

# System-wide Go (legacy)
export PATH="/usr/local/go/bin:$PATH"

# Java
export PATH="$JAVA_HOME/bin:$PATH"