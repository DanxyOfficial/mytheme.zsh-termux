#!/bin/bash
DIR=$(pwd)

echo "Installing dependencies..."
pkg update && pkg upgrade -y
pkg install zsh proot-distro git figlet lolcat exa -y

# Setup Plugins Zsh
mkdir -p ~/.zsh
[[ ! -d ~/.zsh/zsh-autosuggestions ]] && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[[ ! -d ~/.zsh/zsh-syntax-highlighting ]] && git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# Setup Config Termux
mkdir -p ~/.termux
[[ -f "$DIR/termux.properties" ]] && cp "$DIR/termux.properties" ~/.termux/termux.properties

# Setup Boot Banner (File .draw)
[[ -f "$DIR/boot_banner.sh" ]] && cp "$DIR/boot_banner.sh" ~/.draw
chmod +x ~/.draw

# Bersihkan Welcome Banner bawaan
rm -f $PREFIX/etc/motd
touch $PREFIX/etc/motd

# Setup .zshrc
rm -f ~/.zshrc
echo "source $DIR/mytheme.zsh-theme" > ~/.zshrc

termux-reload-settings
chsh -s zsh

echo "------------------------------------------------"
echo "  Style Termux Berhasil Di-update!             "
echo "  Ketik 'zsh' atau restart app untuk melihat.   "
echo "------------------------------------------------"
