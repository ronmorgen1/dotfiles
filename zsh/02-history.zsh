#!/bin/env zsh

# ======= #
# Histroy #
# ======= #

HISTSIZE=130000
SAVEHIST=100000

export HISTFILE="${HOME}/.zsh-history"
export LESSHISTFILE=-

setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt APPEND_HISTORY         # Write to the history file immediately, not when the shell exits.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
