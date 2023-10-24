#!/bin/bash

set -e

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
REPO=${REPO:-ronmorgen1/dotfiles}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

FMT_RED=$(printf '\033[31m')
FMT_GREEN=$(printf '\033[32m')
FMT_YELLOW=$(printf '\033[33m')
FMT_BLUE=$(printf '\033[34m')
FMT_BOLD=$(printf '\033[1m')
FMT_RESET=$(printf '\033[0m')

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

fmt_error() {
    printf '%sError: %s%s\n' "${FMT_BOLD}${FMT_RED}" "$*" "$FMT_RESET" >&2
}

clone_repo() {

    echo "${FMT_BLUE}Cloning Dotfiles...${FMT_RESET}"

    # Check if git is installed
    command_exists git || {
        fmt_error "git is not installed"
        exit 1
    }

    git init --quiet "$DOTFILES" && cd "$DOTFILES" &&
        git config dotfiles.branch "$BRANCH" &&
        git remote add origin "$REMOTE" &&
        git fetch --depth=1 origin &&
        git checkout -b "$BRANCH" "origin/$BRANCH" || {
        [ ! -d "$DOTFILES" ] || {
            cd -
            rm -rf "$DOTFILES" 2>/dev/null
        }
        fmt_error "git clone failed"
        exit 1
    }
    # Exit installation directory
    cd -

    echo
}

create_symlinks() {

    echo "${FMT_BOLD}Removing old Symbolic Links${FMT_RESET}"
    for f in $(find $HOME -type l -maxdepth 1); do
        rm -rf $f
    done

    echo "${FMT_BLUE}Crating Symbolic Links${FMT_RESET}"

    # Zsh
    ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
    ln -sf "$DOTFILES/.zshenv" "$HOME/.zshenv"
    ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"
    ln -sf "$DOTFILES/.zlogout" "$HOME/.zlogout"
    ln -sf "$DOTFILES/.zlogin" "$HOME/.zlogin"
    ln -sf "$DOTFILES/zsh" "$HOME/.zsh"
    ln -sf "$DOTFILES/.zshrc.local" "$HOME/.zshrc.local"

    # Terminal
    ln -sf "$DOTFILES/alacritty" "$HOME/.config/alacritty"
    ln -sf "$DOTFILES/tmux" "$HOME/.config/tmux"

    # Vim
    ln -sf "$DOTFILES/.vimrc" "$HOME/.vimrc"
    ln -sf "$DOTFILES/vim" "$HOME/.vim"

    # Neovim
    ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"

    # Git
    ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
    ln -sf "$DOTFILES/git/.gitignore" "$HOME/.gitignore"
}

main() {

    #clone_repo
    create_symlinks
}

main "$@"
