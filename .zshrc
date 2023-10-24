#!/bin/env zsh

# Source configuration files
source "${HOME}/.zsh/options.zsh"
source "${HOME}/.zsh/exports.zsh"
source "${HOME}/.zsh/bindings.zsh"
source "${HOME}/.zsh/completions.zsh"
source "${HOME}/.zsh/aliases.zsh"
source "${HOME}/.zsh/functions.zsh"

# pyenv
#export PATH="$HOME/.pyenv/bin:$PATH"
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)" # This makes pyenv work in the shell.
#eval "$(pyenv virtualenv-init -)" # Enabling virtualenv so it works natively.

# check if atuin -v is installed
if command -v atuin >/dev/null; then
	export ATUIN_NOBIND="true"
	eval "$(atuin init zsh)"
	bindkey '^r' _atuin_search_widget
else
	bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
fi

# Theme
source "${HOME}/.zsh/themes/simple.zsh-theme"

# Local configuration
if [ -f "$HOME/.zshrc.local" ]; then
	source "$HOME/.zshrc.local"
fi

# check if $HOME/.autojump/etc/profile.d/autojump.sh exists
if [ -f "$HOME/.autojump/etc/profile.d/autojump.sh" ]; then
	source "$HOME/.autojump/etc/profile.d/autojump.sh"
fi

# Load and initialize completion system
autoload -Uz compinit
compinit
