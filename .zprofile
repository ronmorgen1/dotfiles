#!/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# ========= #
# .zprofile #
# ========= #

# Enviorment Variables
export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export LANG="${LANG:-en_US.UTF-8}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=${HOME}/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=${HOME}/.local/share}"

# Path Stuff
typeset -gU cdpath fpath path # Eliminate duplicated in *paths

# Make zsh search for executables
path=(
	/usr/local/{bin,sbin}
	$path
)
