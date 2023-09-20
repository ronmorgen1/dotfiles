#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# ## General Aliases ##
# ######################

alias vi="$EDITOR"
alias vim="$EDITOR"
alias r='exec ${SHELL} -l'
alias h='history'

# cd
alias ..="cd .."              # Go back 1 directory level (for fast typers).
alias ...="cd ../../"         # Go back 2 directory levels.
alias ....="cd ../../../"     # Go back 3 directory levels.
alias .....="cd ../../../../" # Go back 4 directory levels.

# ls
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -xB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.

# grep
GREP_EXCL=(.bzr CVS .git .hg .svn .idea .tox)
alias grep="${aliases[grep]:-grep} --exclude-dir={\${(j.,.)GREP_EXCL}}" # Exclude common VCS directories

# bat
if command -v bat &>/dev/null; then
    alias cat="bat -pp --theme \"Visual Studio Dark+\"" # Use bat instead of cat
fi

# tmux
alias tl="tmux list-sessions"
alias tk="tmux ls | grep -vq attached && tmux kill-session -a"