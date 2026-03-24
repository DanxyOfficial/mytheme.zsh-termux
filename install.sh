#!/bin/bash
DIR=$(pwd)

# Install paket wajib
pkg install zsh neofetch proot-distro -y

# Setup Shortcut & Extra Keys
mkdir -p ~/.termux
cp $DIR/termux.properties ~/.termux/termux.properties
termux-reload-settings

# Setup .zshrc
rm -f ~/.zshrc
echo "neofetch" > ~/.zshrc
echo "source $DIR/mytheme.zsh-theme" >> ~/.zshrc

# Ganti Shell
chsh -s zsh
echo "Selesai! Restart Termux lo."
