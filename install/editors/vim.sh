#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"

sudo apt update
sudo apt install -y vim

if [ -e "$HOME/.vim" ]; then
  rm -rf "$HOME/.vim"
fi

ln -sf "$KURUNTU_PATH/dots/vim" "$HOME/.vim"
