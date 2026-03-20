#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"

cp $HOME/.bashrc $HOME/.backup_bashrc

rm $HOME/.bashrc

echo "source $KURUNTU_PATH/dots/bash/variables.sh" >>"$HOME/.bashrc"
echo "source $KURUNTU_PATH/dots/bash/aliases.sh" >>"$HOME/.bashrc"
echo "source $KURUNTU_PATH/dots/bash/functions.sh" >>"$HOME/.bashrc"
echo "source $KURUNTU_PATH/dots/bash/rc.sh" >>"$HOME/.bashrc"
