# Rust tool helpers

# Enable Clippy and Rustfmt if installed (silently skips if missing)
command -v cargo-clippy &>/dev/null && alias clippy="cargo clippy"
command -v rustfmt &>/dev/null && alias cfmt="cargo fmt"
