#!/bin/bash
DIR=$(pwd)
pkg install zsh proot-distro -y
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
echo "-----------------------------------------------"
echo " Style Termux selesai di perbarui silahkan:"
echo " restart Termux atau ketik: zsh"
echo "-----------------------------------------------"
