#!/bin/bash

set -e

KURUNTU_DIR="$HOME/.local/share/dotfiles"
REPO_URL="https://github.com/luidooo/dotfiles.git"

if [ -d "$KURUNTU_DIR" ]; then
  echo "Dotfiles directory already exists. Pulling latest changes."
  cd "$KURUNTU_DIR"
  echo "git pull"
else
  echo "Cloning dotfiles repository."
  sudo git clone "$REPO_URL" "$KURUNTU_DIR"
fi

cd "$KURUNTU_DIR"

bash $KURUNTU_DIR/utils/ascii.sh
echo -e "\033[0m"

echo "Running the installer."
#bash utils/installer.sh
