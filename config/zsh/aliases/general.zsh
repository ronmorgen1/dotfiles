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
alias ls="ls -G"  # List all files colorized in long format
alias l="ls -lAh" # List all files colorized in long format, including dot file

# grep
GREP_EXCL=(.bzr CVS .git .hg .svn .idea .tox)
alias grep="${aliases[grep]:-grep} --exclude-dir={\${(j.,.)GREP_EXCL}}" # Exclude common VCS directories

# bat
if command -v bat &>/dev/null; then
	alias cat="bat -pp --theme \"Visual Studio Dark+\"" # Use bat instead of cat
fi

# tmu
alias tl="tmux list-sessions"
alias tk="tmux ls | grep -vq attached && tmux kill-session -a"

if [[ "$(type -w list_aliases | awk '{print $2}')" == "function" ]]; then
	alias la="list_aliases"
fi
