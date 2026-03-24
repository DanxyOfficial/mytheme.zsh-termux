#!/bin/bash

echo "Installing Danxy Custom Theme..."

DIR=$(pwd)

pkg install zsh -y

cat <<EOF > ~/.zshrc
source $DIR/mytheme.zsh-theme

if [ -t 1 ]; then
  exec zsh
fi
EOF

chsh -s zsh

echo "Berhasil! Tema kamu sudah terpasang secara mandiri."
echo "Silakan buka ulang Termux."
