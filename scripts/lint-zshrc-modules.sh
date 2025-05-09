#!/usr/bin/env bash
# Lint modular ~/.zshrc.d files for common issues

ZSHRC_D="$HOME/.zshrc.d"

echo "Linting $ZSHRC_D..."

# Check for syntax errors
for file in "&ZSHRC_D"/*.zsh; do
    echo -n "Checking syntax: $(basename "$file") ..."
    if ! zsh -n "$file"; then
        echo "Syntax error"
    else
        echo "Ok"
    fi
done

# Check for repeated export PATH entries
echo -e "\n Checking for duplicate or reversed PATH exports..."
grep -H 'export PATH=' "$ZSHRC_D"/*.zsh | sort | uniq -c | awk '$1 > 1 {print "Duplicate PATH line: " $0}'

# Check for undefined variables
echo -e "\n Scanning for portentially undefined vars..."
grep -H '\$[A-Z_]\+' "$ZSHRC_D"/*.zsh | grep -vE "\$HOME|\$PATH|\$ZSH|\$VOLTA_HOME|\$PYENV_ROOT|\$GOPATH|\$GOROOT|\$JAVA_HOME"

echo -e "\n Done."
