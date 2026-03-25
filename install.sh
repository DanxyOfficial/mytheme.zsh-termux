#!/bin/bash
DIR=$(pwd)

echo "Cleaning up and installing core packages..."
# Update repo dulu biar gak 'unable to locate'
pkg update -y

# Install paket satu per satu biar kalau ada 1 error, yang lain tetep jalan
pkg install zsh -y
pkg install git -y
pkg install figlet -y
pkg install curl -y

# Eza adalah pengganti Exa (Exa udah gak di-update)
pkg install eza -y || pkg install exa -y

# Fix lolcat (kalau pkg install gagal, kita pake cara lain)
pkg install lolcat -y || (pkg install ruby -y && gem install lolcat)

# Download Font Custom lo
echo "Downloading custom font ASCII-Shadow..."
mkdir -p $PREFIX/share/figlet
curl -L "https://raw.githubusercontent.com/DanxyOfficial/DanxyZsh/refs/heads/DanxyZsh/.object/ASCII-Shadow.flf" -o $PREFIX/share/figlet/ASCII-Shadow.flf

# Setup Plugins Zsh
mkdir -p ~/.zsh
[[ ! -d ~/.zsh/zsh-autosuggestions ]] && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[[ ! -d ~/.zsh/zsh-syntax-highlighting ]] && git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# Setup Config
mkdir -p ~/.termux
[[ -f "$DIR/termux.properties" ]] && cp "$DIR/termux.properties" ~/.termux/termux.properties

# Copy Boot Banner (Pastikan file ini ada di folder repo lo!)
if [[ -f "$DIR/boot_banner.sh" ]]; then
    cp "$DIR/boot_banner.sh" ~/.draw
    chmod +x ~/.draw
fi

# Setup .zshrc
rm -f ~/.zshrc
echo "source $DIR/mytheme.zsh-theme" > ~/.zshrc

# Hapus banner bawaan termux biar bersih
rm -f $PREFIX/etc/motd
touch $PREFIX/etc/motd

# Reload & Change Shell
termux-reload-settings
chsh -s zsh

echo "------------------------------------------------"
echo "  BERHASIL! Gak pake ribet, gak pake error.      "
echo "  Ketik 'zsh' buat liat hasilnya.                "
echo "------------------------------------------------"
