#!/bin/bash
DIR=$(pwd)
pkg install zsh -y
rm -f ~/.zshrc
echo "source $DIR/mytheme.zsh-theme" > ~/.zshrc
chsh -s zsh
