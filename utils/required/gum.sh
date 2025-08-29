#!/bin/bash

cd /tmp
GUM_VERSION="0.14.3" #we use the same version dhh use on omakub
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt-get install -y --allow-downgrades ./gum.deb
rm gum.deb
cd -
