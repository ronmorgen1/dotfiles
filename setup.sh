#!/bin/bash

set -e

# Remove old files/directories 
rm -rf "$HOME/.zshrc"
rm -rf "$HOME/.vimrc"
rm -rf "$HOME/.tmux.conf"
rm -rf "$HOME/.gitignore"
rm -rf "$HOME/.gitconfig"
rm -rf "$HOME/zsh"
rm -rf "$HOME/.vim"
rm -rf "$HOME/.config/alacritty"
rm -rf "$HOME/.config/bat"

ln -sfn "$PWD/.zshrc" "$HOME/.zshrc" || exit 1
ln -sfn "$PWD/.vimrc" "$HOME/.vimrc" || exit 1
ln -sfn "$PWD/.tmux.conf" "$HOME/.tmux.conf" || exit 1
ln -sfn "$PWD/git/.gitignore" "$HOME/.gitignore" || exit 1
ln -sfn "$PWD/git/.gitconfig" "$HOME/.gitconfig" || exit 1
ln -sfn "$PWD/zsh" "$HOME/zsh" || exit 1
ln -sfn "$PWD/vim" "$HOME/.vim" || exit 1
ln -sfn "$PWD/config/alacritty" "$HOME/.config/alacritty" || exit 1
ln -sfn "$PWD/config/bat" "$HOME/.config/bat" || exit 1