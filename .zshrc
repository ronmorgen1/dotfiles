#! /usr/bin/env zsh
# vim: set fdm=marker:

[ -f "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -f "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -f "$HOME/.zsh/exports.zsh" ] && source "$HOME/.zsh/exports.zsh"

# load local config
[ -f "$HOME/.local/etc/config.zsh" ] && source "$HOME/.local/etc/config.zsh"
[ -f "$HOME/.local/etc/local.zsh" ] && source "$HOME/.local/etc/local.zsh"
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Zoxide
if command -v zoxide >/dev/null; then
	eval "$(zoxide init zsh)"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Add tab completion for many Bash commands
if which brew >/dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-syntax-highlighting"
plug "$HOME/.zsh/plugins/jump.zsh"

autoload -Uz compinit && compinit
