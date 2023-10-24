#!/bin/env zsh
# vim: syntax=zsh
# vim: filetype=zsh
# vim60: fdm=marker

# --------- #
# Functions #
# --------- #

# general
# {{{
function mcd() {
    mkdir $1 && \
        cd $1
}
# }}}

# git
# {{{
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

function parse_git_branch() {
    git branch --show-current
}

function git_rebase() {
    if [ $# -eq 0 ]
    then
        BRANCH="master"
	else
		BRANCH=$1
	fi
    CURR_BRANCH=$(parse_git_branch)
    echo "Rebasing branch '$CURR_BRANCH' on '$BRANCH'"
    sleep 2
	git fetch origin $BRANCH && \
    git rebase origin/$BRANCH
}
# }}}

# aws
# {{{
function switch_aws_profile() {
    if [ "$AWS_PROFILE" == Eng-Prod ]; then
        export AWS_PROFILE=Eng-Dev
    else
        export AWS_PROFILE=Eng-Prod
    fi
}

function s3_ls() {
    local bucket=$1
    local prefix=$2
    aws s3api list-objects-v2 --bucket $bucket --prefix $prefix --query 'Contents[].{Key: Key, Size: Size}'
}
#}}}