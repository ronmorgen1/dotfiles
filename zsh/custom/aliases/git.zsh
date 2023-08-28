#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# ## Git Aliases #######
# ######################

# add
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
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'

# reset
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias groh='git reset origin/$(current_branch) --hard'
