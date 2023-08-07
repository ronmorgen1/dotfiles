#! /usr/bin/env zsh
# vim: set fdm=marker:

alias vi="lvim"
alias j='jump'
alias op="code $(fd -e code-workspace 'pgy-projects')"
alias r='exec ${SHELL} -l'

# grep
GREP_EXCL=(.bzr CVS .git .hg .svn .idea .tox)
alias grep="${aliases[grep]:-grep} --exclude-dir={\${(j.,.)GREP_EXCL}}"

alias print-fpath='for fp in $fpath; do echo $fp; done; unset fp'
alias print-path='echo $PATH | tr ":" "\n"'
alias print-functions='print -l ${(k)functions[(I)[^_]*]} | sort'

# date/time
alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
alias datestamp="date '+%Y-%m-%d'"
alias isodate="date +%Y-%m-%dT%H:%M:%S%z"
alias utc="date -u +%Y-%m-%dT%H:%M:%SZ"
alias unixepoch="date +%s"

# disk usage
alias biggest='du -s ./* | sort -nr | awk '\''{print $2}'\'' | xargs du -sh'
alias dux='du -x --max-depth=1 | sort -n'
alias dud='du -d 1 -h'
alias duf='du -sh *'

# bat
if command -v bat &>/dev/null; then
	alias cat="bat -pp --theme \"Visual Studio Dark+\""
fi

alias la='ls -lah'

# AWS
alias aws_prod="export AWS_PROFILE=Eng-Prod"
alias aws_dev="export AWS_PROFILE=Eng-Dev"

# dbt
alias dls='fd -e sql | rev | cut -d'/' -f-1 | rev | sed -e "s/.sql//" | sort'

# tmux
alias tls='tmux list-sessions'
alias tks='tmux kill-session -a'














######################
## Git ###############
######################

# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

# The name of the current branch
function current_branch() {
  git_current_branch
}

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

# Check for develop and similarly named branches
function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo staging
}

alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'

# Commit
alias gc!='git commit --verbose --no-edit --amend'
alias gc='git commit'
alias gca='git commit --verbose --all'
alias gcam='git commit --all --message'
function gcas() {
  git commit --verbose --all --message "$(git_current_branch | cut -d "-" -f 1,2) $1"
}

alias gcb='git checkout -b'
alias gcd='git checkout $(git_develop_branch)'
alias gcm='git checkout $(git_main_branch)'
alias gco='git checkout'
alias gcoi='git checkout $(git branch -a | fzf | xargs)'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gfod='git fetch origin/$(git_develop_branch)'
alias gfom='git fetch origin/$(git_main_branch)'

# Git Log
alias gl="git --no-pager log --oneline --all -20"
alias gls='git --no-pager log --oneline --all -5 --stat'
alias gm='git merge'
alias gmff='git merge --ff-only'
alias gpl='git pull'
alias gplo='git pull origin $(git_current_branch)'
alias gpu!='git push --force'
alias gpu='git push'
alias gpuu='git push --set-upstream origin $(git_current_branch)'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase origin/$(git_develop_branch)'
alias grbi='git rebase --interactive'
alias grbm='git rebase origin/$(git_main_branch)'
alias grh='git reset'
alias grhh='git reset --hard'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grs='git restore'
alias grst='git restore --staged'
alias gs='git status'
alias gsb='git status --short --branch'
alias gss='git status --short'
alias gsw='git switch'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
