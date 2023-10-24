#!/bin/env zsh
# vim60: fdm=marker

# ------ #
# Alises #
# ------ #

# general
# {{{

unalias run-help
unalias which-command
alias ls='ls -lAh'
alias vi="$EDITOR"
alias code="$VISUAL"
alias reload="exec ${SHELL} -l"

# cd
alias ..="cd .."              # Go back 1 directory level (for fast typers).
alias ...="cd ../../"         # Go back 2 directory levels.
alias ....="cd ../../../"     # Go back 3 directory levels.
alias .....="cd ../../../../" # Go back 4 directory levels.

# ls

if ls --color >/dev/null 2>&1; then
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

alias ls="ls -lAF ${colorflag}" # List all files colorized in long format, excluding . and ..
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'" # List only directories

# }}}

# git
#{{{

alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'

# commit
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gcam='git commit -v -am'
alias gcamd='git commit --amend'
alias gcm='git commit -v -m'
alias gci='git commit --interactive'
alias gcsam='git commit -S -am'

# diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git difftool'

# switch
alias gsw='git switch'
alias gswb='git switch -C'
alias gswm='git switch $(git_main_branch)'
alias gswd='git switch $(git_develop_branch)'
alias gswc='git switch $(git_candidate_branch)'

# checkout
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git checkout $(git_main_branch)'
alias gcc='git checkout $(git_candidate_branch)'
alias gcd='git checkout $(git_develop_branch)'

# fetch
alias gf='git fetch'
alias gfo='git fetch origin'

# log
alias gl='git log --graph --pretty=format:'\''%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset'\'' --abbrev-commit --date=relative'
alias gls='git log --stat --date=short --pretty=format:'\''%C(auto)%h %Cgreen%an%Creset %Cblue%cd%Creset %C(auto)%d %s'\'''

# status
alias gs='git status'
alias gss='git status -s'

# merge
alias gm='git merge'
alias gmff='git merge --ff-only'
alias gpl='git pull'
alias gplo='git pull origin $(current_branch)'

# push
alias gpu='git push'
alias gpuf='git push --force'
alias gpuu='git push --set-upstream origin $(current_branch)'

# rebase
alias gre='git rebase'
alias grea='git rebase --abort'
alias grec='git rebase --continue'
alias grei='git rebase --interactive'
alias gres='git rebase --skip'

# reset
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias groh='git reset origin/$(current_branch) --hard'

# restore
alias grs='git restore'
alias grss='git restore --staged'
alias grss='git restore --source'

#}}}

# aws
# {{{

alias sls='aws ls'

# }}}

# brew
# {{{

alias bup='brew update && brew upgrade'
alias bout='brew outdated'
alias bin='brew install'
alias brm='brew uninstall'
alias bcl='brew cleanup'
alias bls='brew list'
alias bsr='brew search'
alias binf='brew info'
alias bdr='brew doctor'
alias bed='brew edit'

# }}}
