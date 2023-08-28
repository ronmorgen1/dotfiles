#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# ## Git Functions #####
# ######################

# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

# ######################
# ## Functions ########
# ######################

function current_branch() {
  git -C "$1" branch | sed  '/^\*/!d;s/\* //'
}

function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in main master; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
}

function git_candidate_branch() {
   command git rev-parse --git-dir &>/dev/null || return
   local branch
   for branch in master-candidate; do
     if command git show-ref -q --verify refs/heads/$branch; then
       echo $branch
       return
     fi
   done
   echo master-candidate
}

function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in staging dev; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo staging
}
