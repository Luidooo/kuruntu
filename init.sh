#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.local/share/dotfiles"
REPO_URL="https://github.com/luidooo/dotfiles.git"

if [ -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles directory already exists. Pulling latest changes."
  cd "$DOTFILES_DIR"
  git pull
else
  echo "Cloning dotfiles repository."
  sudo git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

echo "Running the installer."
bash utils/installer.sh
