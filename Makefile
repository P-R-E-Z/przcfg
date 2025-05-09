SHELL := /bin/bash

.PHONY: all bootstrap lint-zsh konsole nvim push audit

all: bootstrap

prez-setup:
	@echo "Running system bootstrap..."
	bash ./prez-dev-setup.sh

lint-zsh:
	@echo "Linting Zsh config..."
	bash ./scripts/lint-zshrc-modules.sh

konsole:
	@echo "Installing Konsole config..."
	bash ./scripts/install-konsole.sh

nvim:
	@echo "Installing Neovim config..."
	bash ./scripts/install-nvim.sh

audit:
	@echo "Checking path environment..."
	bash ./scripts/check-paths.zsh

push:
	@echo "Committing and pushing dotfiles to GitHub..."
	git add .
	git commit -m "Update dotfiles"
	git push

# Optional local overrides
-include Makefile.local