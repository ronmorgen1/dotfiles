#!/bin/env zsh
# # vim:syntax=zsh
# # vim:filetype=zsh

# Source configuration files
source "${HOME}/.zsh/options.zsh"
source "${HOME}/.zsh/exports.zsh"
source "${HOME}/.zsh/bindings.zsh"
source "${HOME}/.zsh/completions.zsh"
source "${HOME}/.zsh/aliases.zsh"
source "${HOME}/.zsh/functions.zsh"

# Theme
source "${HOME}/.zsh/themes/simple.zsh-theme"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Local configuration
if [ -f "$HOME/.zshrc.local" ]; then
	source "$HOME/.zshrc.local"
fi

# Load and initialize completion system
autoload -Uz compinit
compinit
