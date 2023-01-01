#!/bin/bash

set -e

# files
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.vimrc" "$HOME/.vimrc"
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/git/.gitignore" "$HOME/.gitignore"
ln -sf "$PWD/git/.gitconfig" "$HOME/.gitconfig"

# Directories
ln -sf "$PWD/zsh" "$HOME/zsh"
ln -sf "$PWD/vim" "$HOME/.vim"
ln -sf "$PWD/config/alacritty" "$HOME/.config/alacritty"
ln -sf "$PWD/config/bat" "$HOME/.config/bat"