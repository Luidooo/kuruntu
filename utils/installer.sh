#!/bin/bash
ERROR="-1"
SUCESS="0"
INFO="1"
LINE="======================================================="

DOTFILES="$HOME/.config/dotfiles"
CONFIG_DIR="$HOME/.config"
GH_USER="Luidooo"
SSH_EMAIL="eng.limaluis@gmail.com"
MACHINE_NAME="test"
WAKATIME_KEY="acho mesmo que ia pegar aqui é"

print() {
  local GREEN='\033[0;32m'
  local YELLOW='\033[1;33m'
  local RED='\033[0;31m'
  local NO_COLOR='\033[0m'

  if [ $1 -eq "$ERROR" ]; then
    echo -e "${RED}$LINE${NO_COLOR}"
    echo -e "${RED}[ERROR] - $2${NO_COLOR}"
    echo -e "${RED}$LINE${NO_COLOR}"

  else
    if [ $1 -eq "$SUCESS" ]; then
      echo -e "${GREEN}$LINE${NO_COLOR}"
      echo -e "${GREEN}[SUCESS] - $2!${NO_COLOR}"
      echo -e "${GREEN}$LINE${NO_COLOR}"

    else
      echo $LINE
      echo -e "[INFO] - Setting $2!"
      echo $LINE

    fi
  fi
}

verify() {
  if [ $? -eq 0 ]; then
    print $SUCESS "$1"
  else
    print $ERROR "Error! See the last [INFO] for more information!"
    echo $2
  fi

}

clone_dotfiles() {
  print $INFO "Cloning the $GH_USER dotfiles from github..."
  rm -rf $DOTFILES
  git clone "https://github.com/$GH_USER/dotfiles.git" $DOTFILES
  verify "Dotfiles"
}

install_docker() {
  print $INFO "Docker"
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo wget -qO /etc/apt/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
  sudo usermod -aG docker ${USER}
  verify "Docker"

}

#virtualization() {
#TODO: set kvm, qemu e virsh
#TODO: maybe install some famous isos two
#}

install_nvim() {
  print $INFO "Neovim"
  sudo snap install nvim --classic
  if [ -d "$CONFIG_DIR/nvim" ]; then
    rm -rf "$CONFIG_DIR/nvim"
  fi
  cp -r "$DOTFILES/dot_nvim" "$CONFIG_DIR/nvim"
  echo "For use wakatime, copy this api key and paste in the neovim"
  echo $WAKATIME_KEY
  verify "Neovim"
}

install_vim() {
  sudo apt install vim -y
  if [ -d "$HOME/.vim"]; then
    rm -rf "$HOME/.vim/"
  fi
  cp -r "$DOTFILES/dot_vim/" "$HOME/.vim/"

}

utilities() {
  print "Starting to dowload the most useful packages (utiiles) "
  sudo apt install \
    tree \
    unzip \
    git \
    curl \
    figlet \
    cmatrix -y
  verify "Utilities!"

}

setting_ssh() {
  print "ssh utilities"
  sudo apt install -y ssh
  if [ ! -f $HOME/.ssh/id_ed25519.pub ]; then
    ssh-keygen -t ed25519 -C $SSH_EMAIL
  fi
  print $INFO "This is your ssh pub key, you can see using 'cat ~/.ssh/id_ed25519.pub
'"
  cat ~/.ssh/id_ed25519.pub
  verify "SSH"
}

setting_gh() {
  print "Github CLI(gh)"
  sudo apt install gh -Y
  gh auth login
  gh ssh-key add ~/.ssh/id_ed25519.pub -t $MACHINE_NAME
  verify "Github CLI(gh)"
}

setting_bash() {
  print "Bashrc"
  if [ -f "$HOME/.bashrc"]; then
    rm ~/.bashrc
  fi
  if [ -f "$HOME/.bash_aliases"]; then
    rm ~/.bash_aliases
  fi
  #cp "$DOTFILES/dot_bashrc" "$HOME/.bashrc"
  cp "$DOTFILES/dot_bash_aliases" "$HOME/.bash_aliases"
  source ~/.bashrc
  verify "Bashrc"
}

install_ruby() {
  echo "ai toma"
}

install_node() {
  print "Setting Node"

  if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    print "NVM not found. Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  else
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  fi

  print_info "Installing and setting up Node.js v18..."
  nvm install 18
  nvm use 18
  nvm alias default 18

  print "Node.js v18 is configured and ready to use."
}

main() {
  print $INFO "Update"
  sudo apt update -y
  verify "Update"
  print $INFO "Upgrade"
  sudo apt upgrade -y
  verify "Upgrade"
  utilities
  clone_dotfiles
  setting_bash
  # setting_ssh
  # install_vim
  install_nvim
  # install_docker
  setting_ssh

}

main
