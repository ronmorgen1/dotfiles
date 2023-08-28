#! /usr/bin/env zsh
# vim: set sw=2 ts=2 sts=2 et tw=80 ft=zsh fdm=marker:

# ######################
# Prompt ###############
# ######################

autoload -Uz promptinit
promptinit
prompt pure

# ######################
# ZSH Config Files #####
# ######################

ZSH_CONFIG_FILE=(options keybindings exports functions aliases)

declare -a ZSH_CONFIG_FILE

for ZSH_CONFIG in ${ZSH_CONFIG_FILE[@]}; do
    if [ -f "$HOME/.zsh/$ZSH_CONFIG.zsh" ]; then
        source "$HOME/.zsh/$ZSH_CONFIG.zsh"
    fi
done

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
