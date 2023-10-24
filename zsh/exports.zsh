#! /usr/bin/env zsh
# vim: set fdm=marker:

# Encoding, Terminal and Editors
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="tmux-256color"
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
export EDITOR="nvim"
export VISUAL="$EDITOR"
export MANPAGER="$VISUAL"

export MYVIMRC=${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua

# go
export GOPATH="$HOME/golang"
export GOROOT="/usr/local/opt/go/libexec"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH"
export PATH="$PATH:$GOROOT/bin"

# spark
export PATH="$PATH:/usr/local/spark/bin:$PATH"

# brew
export HOMEBREW_NO_INSTALL_FROM_API=1
export PATH="/usr/local/sbin:$PATH"
