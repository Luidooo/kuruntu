#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"
NVIM_PATH="$HOME/.config/nvim"

sudo snap install nvim --classic

if [ -e "$NVIM_PATH" ]; then
  rm -rf "$NVIM_PATH"
fi

ln -sf "$KURUNTU_PATH/dots/nvim" "$NVIM_PATH"
