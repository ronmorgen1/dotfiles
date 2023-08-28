#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# Genetal Settings #####
# ######################

setopt AUTO_CD           # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD        # Push the old directory onto the stack on cd.kw
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME     # Push to home directory when no argument is given.
setopt CDABLE_VARS       # Change directory to a path stored in a variable.
setopt MULTIOS           # Write to multiple descriptors.
setopt EXTENDED_GLOB     # Use extended globbing syntax.
unsetopt CLOBBER         # Do not overwrite existing files with > and >>.
unsetopt BEEP            # no beep

# ######################
# Navigation ###########
# ######################

setopt auto_list         # automatically list choices on ambiguous completion
setopt auto_menu         # automatically use menu completion
setopt always_to_end     # move cursor to end if word had one match
setopt promptcr promptsp # move to new line before printing prompt

zstyle ':completion:*' menu select                             # menu completion
zstyle ':completion:*' group-name ''                           # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored # complete ignored files
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'         # case insensitive completion

# ######################
# History ##############
# ######################
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing non-existent history.

HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zhistory}" # The path to the history file.
HISTSIZE=10000                                      # The maximum number of events to save in the internal history.
SAVEHIST=10000                                      # The maximum number of events to save in the history file.
HISTDUP=erase                                       # Erase duplicates in the internal history.
HISTTIMEFORMAT="%d/%m/%y %T "                       # The format in which history events are printed.
HISTCONTROL=ignoreboth                              # Ignore both duplicate lines and lines starting with space.
HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"      # Do not record some commands in history.
