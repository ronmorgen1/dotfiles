#! /usr/bin/env zsh
# vim: set fdm=marker:

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# source zsh config files
plug "$HOME/.zsh/aliases"
plug "$HOME/.zsh/git-aliases"
plug "$HOME/.zsh/functions"
plug "$HOME/.zsh/options"
plug "$HOME/.zsh/environment"
plug "$HOME/.zsh/settings"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "hlissner/zsh-autopair"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"
plug "zap-zsh/completions"

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

autoload -Uz compinit && compinit
