#!/bin/bash

cd /tmp
wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij
cd -

# Create Zellij config directories
mkdir -p ~/.config/zellij/themes

KURUNTU_DOTS="$(dirname "${BASH_SOURCE[0]}")/../../dots"
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp "$KURUNTU_DOTS/dot_zellij/config.kdl" ~/.config/zellij/config.kdl
cp "$KURUNTU_DOTS/dot_zellij/themes/tokyo-night.kdl" ~/.config/zellij/themes/tokyo-night.kdl
