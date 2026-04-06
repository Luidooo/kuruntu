#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"
ZELLIJ_PATH="$HOME/.config/zellij"

# Install zellij via snap
sudo snap install zellij --classic

# Link config
mkdir -p "$ZELLIJ_PATH"

if [ -f "$ZELLIJ_PATH/config.kdl" ]; then
  mv "$ZELLIJ_PATH/config.kdl" "$ZELLIJ_PATH/config.kdl.bak"
fi

ln -sf "$KURUNTU_PATH/dots/zellij/config.kdl" "$ZELLIJ_PATH/config.kdl"
