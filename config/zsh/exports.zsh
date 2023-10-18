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

# go
export GOROOT="/usr/lib/go"
export GOPATH="$HOME/go"

# spark
export PATH="$PATH:/usr/local/spark/bin:$PATH"

# brew
export HOMEBREW_NO_INSTALL_FROM_API=1
export PATH="/usr/local/sbin:$PATH"
