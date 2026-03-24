#!/bin/bash
DIR=$(pwd)
pkg install zsh proot-distro git -y
mkdir -p ~/.zsh
[[ ! -d ~/.zsh/zsh-autosuggestions ]] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[[ ! -d ~/.zsh/zsh-syntax-highlighting ]] && git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
mkdir -p ~/.termux
if [ -f "$DIR/termux.properties" ]; then
    cp "$DIR/termux.properties" ~/.termux/termux.properties
    termux-reload-settings
fi
rm -f $PREFIX/etc/motd
touch $PREFIX/etc/motd
rm -f ~/.zshrc
echo "source $DIR/mytheme.zsh-theme" > ~/.zshrc
chsh -s zsh
