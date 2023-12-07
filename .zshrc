#!/bin/env zsh

source "${HOME}/.zsh/00-environment.zsh"
source "${HOME}/.zsh/01-autocompletion.zsh"
source "${HOME}/.zsh/02-history.zsh"
source "${HOME}/.zsh/03-keybindings.zsh"
source "${HOME}/.zsh/04-prompt.zsh"
source "${HOME}/.zsh/05-aliases.zsh"
source "${HOME}/.zsh/06-functions.zsh"

# Local configuration
if [ -f "$HOME/.zshrc.local" ]; then
	source "$HOME/.zshrc.local"
fi
