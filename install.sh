#!/usr/bin/env bash

config=$(yq -r -o=json config.yaml | jq 'to_entries[] | "\(.key)=\(.value)"')

#!/bin/bash

# Loop through all key/value pairs in config.yaml
while read -r key value; do
  dest=$(echo "$HOME/$value")
  src=$(echo "$PWD/$key" | sed s/://g)
  ln -sf "$src" "$dest"
  #echo "Source: $src, Destination: $dest"
done < <(yq -r config.yaml)