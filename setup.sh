#!/bin/bash

set -e

declare -a dotfiles=(
  ".zshrc" 
  ".vimrc" 
  ".gitignore" 
  ".gitconfig" 
  ".tmux.conf" 
  ".config/alacritty" 
  ".config/bat" 
  ".vim"
)

for item in "${dotfiles[@]}"; do
  # Check if the file already exists in the home directory
  if [ -e "$HOME/$item" ]; then
    printf 'Removing existing file %s\n' "$item"
    rm -rf "$HOME/$item" >/dev/null 2>&1
  fi
  # Create a symlink to the file in the current directory
  printf 'Linking %s\n\n' "$item"
  ln -sf "$PWD/$item" "$HOME/$item"
done
