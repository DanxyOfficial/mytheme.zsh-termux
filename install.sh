#!/bin/bash

echo "Installing My Custom Zsh Theme..."

# Salin file tema ke folder Oh My Zsh (jika user pakai OMZ)
cp mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme

# Ubah settingan di .zshrc secara otomatis
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="mytheme"/' ~/.zshrc

echo "Selesai! Silakan ketik 'source ~/.zshrc' atau buka ulang Termux."
