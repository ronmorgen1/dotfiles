#!/usr/bin/env bash

# Loop through all key/value pairs in config.yaml
while read -r key value; do
  dest=$(echo "$HOME/$value")
  src=$(echo "$PWD/$key" | sed s/://g)
  ln -sf "$src" "$dest"
done < <(yq -r config.yaml)
