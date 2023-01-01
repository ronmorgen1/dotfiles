#!/bin/bash

set -e

# Remove old files/directories
rm -rf \
  "$HOME/.zshrc" \
  "$HOME/.vimrc" \
  "$HOME/.tmux.conf" \
  "$HOME/.gitignore" \
  "$HOME/.gitconfig" \
  "$HOME/zsh" \
  "$HOME/.vim" \
  "$HOME/.config/alacritty" \
  "$HOME/.config/bat"

ln -sfn "$PWD/.zshrc" "$HOME/.zshrc"
ln -sfn "$PWD/.vimrc" "$HOME/.vimrc"
ln -sfn "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sfn "$PWD/git/.gitignore" "$HOME/.gitignore"
ln -sfn "$PWD/git/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$PWD/zsh" "$HOME/zsh"
ln -sfn "$PWD/vim" "$HOME/.vim"
ln -sfn "$PWD/config/alacritty" "$HOME/.config/alacritty"
ln -sfn "$PWD/config/bat" "$HOME/.config/bat"
