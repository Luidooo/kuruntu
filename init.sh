#!/bin/bash

set -e

export KURUNTU_PATH="$HOME/.local/share/kuruntu"
REPO_URL="https://github.com/luidooo/kuruntu.git"

if [ -d "$KURUNTU_PATH" ]; then
  echo "Kuruntu directory already exists. Pulling latest changes."
  cd "$KURUNTU_PATH"
  echo "git pull" #debug
else
  echo "Cloning dotfiles repository."
  echo "sudo git clone " #$ $REPO_URL" "$KURUNTU_PATH"" #debug
fi

cd "$KURUNTU_PATH"

bash $KURUNTU_PATH/utils/ascii.sh
echo -e "\033[0m"

bash "$KURUNTU_PATH/utils/menus/welcome.sh"
#bash "$KURUNTU_PATH/utils/installer.sh"
