#!/bin/env zsh

# =========== #
# Environment #
# =========== #

# General
export XDG_CACHE_HOME="${HOME}/.local/cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:=/tmp}"

export PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin

# Editors
export EDITOR=nvim
export VISUAL=codium

# Man
export MANPAGER="${EDITOR:=nvim} +Man!"
export MANWIDTH=999

# Language
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8
