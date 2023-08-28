#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# Custom Aliases #######
# ######################

# Source file if it exists under "$HOME/.zsh/custom/aliases"
for f in $HOME/.zsh/custom/aliases/*.zsh; do
    if [[ -f "$f" ]]; then
        source "$f"
    fi
done

# ######################
# ## General ###########
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

# less
export LESS_TERMCAP_mb=$'\E[01;31m'       # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'           # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'           # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[38;5;246m'    # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'           # Ends underline.
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # Begins underline.

# aws
alias aws_prod="export AWS_PROFILE=Eng-Prod" # Set AWS_PROFILE to Eng-Prod
alias aws_dev="export AWS_PROFILE=Eng-Dev"   # Set AWS_PROFILE to Eng-Dev

# tmux
alias tls='tmux list-sessions'   # List all tmux sessions
alias tks='tmux kill-session -a' # Kill all tmux sessions
