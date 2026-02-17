#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"

cp $HOME/.bashrc $HOME/.backup_bashrc

rm $HOME/.bashrc

echo "source $KURUNTU_PATH/dots/dot_bash/aliases.sh" >>"$HOME/.bashrc"
echo "source $KURUNTU_PATH/dots/dot_bash/functions.sh" >>"$HOME/.bashrc"
echo "source $KURUNTU_PATH/dots/dot_bash/rc.sh" >>"$HOME/.bashrc"
