#! /usr/bin/env zsh
# vim: set fdm=marker:

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# bind ctrl + r to history search
bindkey '^R' history-incremental-search-backward
bindkey "\x1b[1;3D" backward-word # Option + Left Arrow to move to the beginning of the word
bindkey "\x1b[1;3C" forward-word  # Option + Right Arrow to move to the end of the word
bindkey '^H' backward-kill-word # Ctrl + Backspace to delete a whole word.
bindkey "^a" beginning-of-line  # Ctrl + a to move to the beginning of the line
bindkey "^e" end-of-line        # Ctrl + e to move to the end of the line
