#!/bin/bash

# Exit on error
set -e

# Variables
DOTFILES_DIR="$HOME/.dotfiles"

# Install Vim
sudo apt update
sudo apt install -y vim

# Configure Vim
if [ -d "$HOME/.vim" ]; then
  rm -rf "$HOME/.vim"
fi
cp -r "$DOTFILES_DIR/dots/dot_vim" "$HOME/.vim"

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim +PlugInstall +qall
