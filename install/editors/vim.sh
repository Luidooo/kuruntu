#!/bin/bash

set -e

# Variables
export KURUNTU_PATH="$HOME/.local/share/kuruntu"

# Install Vim
sudo apt update
sudo apt install -y vim

# Configure Vim
if [ -d "$HOME/.vim" ]; then
  rm -rf "$HOME/.vim"
fi
cp -r "$KURUNTU_PATH/dots/dot_vim" "$HOME/.vim"

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# run
#vim +PlugInstall +qall
