#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"

sudo snap install nvim --classic

if [ -d "$KURUNTU_PATH/nvim" ]; then
  rm -rf "$HOME/.local/nvim"
fi
cp -r "$KURUNTU_PATH/dots/dot_nvim" "$HOME/.config/nvim"
