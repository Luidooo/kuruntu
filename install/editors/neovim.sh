#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/.dotfiles"

sudo snap install nvim --classic

if [ -d "$CONFIG_DIR/nvim" ]; then
  rm -rf "$CONFIG_DIR/nvim"
fi
cp -r "$DOTFILES_DIR/dots/dot_nvim" "$CONFIG_DIR/nvim"
