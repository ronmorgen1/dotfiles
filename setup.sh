#!/bin/bash

set -e

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

FMT_RED=$(printf '\033[31m')
FMT_GREEN=$(printf '\033[32m')
FMT_YELLOW=$(printf '\033[33m')
FMT_BLUE=$(printf '\033[34m')
FMT_BOLD=$(printf '\033[1m')
FMT_RESET=$(printf '\033[0m')

create_symlinks() {
	echo "${FMT_BLUE}Crating Symbolic Links${FMT_RESET}"
	# zsh
	ln -sf "$DOTFILES/zsh" "$HOME/.zsh"
	# alacritty
	ln -sf "$DOTFILES/alacritty" "${XDG_CONFIG_HOME:-$HOME/.config}/alacritty"
	# tmux
	ln -sf "$DOTFILES/tmux" "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"
	# vim
	ln -sf "$DOTFILES/.vimrc" "$HOME/.vimrc"
	ln -sf "$DOTFILES/vim" "$HOME/.vim"
	# git
	ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
	ln -sf "$DOTFILES/git/.gitignore" "$HOME/.gitignore"
	# TODO: .vscode
}

main() {
	create_symlinks
}

main "$@"
