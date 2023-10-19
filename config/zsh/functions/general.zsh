#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# ## General Functions #
# ######################

function list_alias() {
    local alias_name=${1:-general}
    local alias_file="$XDG_CONFIG_HOME/zsh/aliases/${alias_name}.zsh"
    if [[ -f "$alias_file" ]]; then
        cat "$alias_file" | less
    else
        echo "No git aliases for $alias_name"
    fi
}


function edit_git_changed() {

}
