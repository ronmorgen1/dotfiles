#! /usr/bin/env zsh
# vim: set fdm=marker:

# Directories and Paths
export PROJECT_HOME="$HOME/pgy-projects" # where all my projects are

# Encoding, Terminal and Editors
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="tmux-256color"
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
export EDITOR="$HOME/.bin/editor"
export VISUAL="$HOME/.bin/editor"
export MANPAGER="$VISUAL +Man!"

# go
export GOROOT="/usr/lib/go"
export GOPATH="$HOME/go"

# spark
export PATH="$PATH:/usr/local/spark/bin:$PATH"

# set fpath
fpath=(~/.zsh/completion $fpath)
