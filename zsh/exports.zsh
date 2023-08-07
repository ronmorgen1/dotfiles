#! /usr/bin/env zsh
# vim: set fdm=marker:

# Encoding, Terminal and Editors
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="tmux-256color"
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
export VISUAL="lvim"
export EDITOR="$VISUAL"
export MANPAGER="$VISUAL +Man!"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# go
export GOROOT="/usr/lib/go"
export GOPATH="$HOME/go"

# general exports
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$HOME/.local/share/lunarvim"}"
export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$HOME/.config/lvim"}"
export LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-"$HOME/.cache/lvim"}"
export LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$HOME/.local/share/lunarvim/lvim"}"

# fzf catppuccin_mocha
export FZF_DEFAULT_OPTS=" \
--height 30% --border=rounded --margin=1% --inline-info --no-mouse \
--bind ctrl-p:toggle-preview,ctrl-f:page-down,ctrl-b:page-up --bind pgdn:preview-page-down,pgup:preview-page-up
"

export ZSH_AUTOSUGGEST_STRATEGY=(
	history
	completion
)

export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
	forward-char
	end-of-line
	vi-forward-char
	vi-end-of-line
	vi-add-eol
)
