#!/bin/zsh

# Source configuration files
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/options.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/exports.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/pyenv.zsh"

# Theme
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/themes/simple.zsh-theme"

# Aliases
for alias_file in "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases/"*.zsh; do
	source "$alias_file"
done

# Functions
for function_file in "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions/"*.zsh; do
	source "$function_file"
done

# Local configuration
if [ -f "$HOME/.zshrc.local" ]; then
	source "$HOME/.zshrc.local"
fi

# Load and initialize completion system
autoload -Uz compinit
compinit

