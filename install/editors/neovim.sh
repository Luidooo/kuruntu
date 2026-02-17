#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"
NVIM_PATH="$HOME/.local/share/nvim"

sudo snap install nvim --classic

if [ -d $NVIM_PATH ]; then
  rm -rf $NVIM_PATH
fi
cp -r "$KURUNTU_PATH/dots/dot_nvim" $NVIM_PATH
