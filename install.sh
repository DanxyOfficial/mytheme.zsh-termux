#!/bin/bash

ZSH_CUSTOM_THEMES="$HOME/.oh-my-zsh/themes"

echo "Checking environment..."

if [ ! -d "$ZSH_CUSTOM_THEMES" ]; then
    echo "Creating themes directory..."
    mkdir -p "$ZSH_CUSTOM_THEMES"
fi

if [ ! -f "$HOME/.zshrc" ]; then
    echo "Creating .zshrc file..."
    touch "$HOME/.zshrc"
fi

echo "Installing My Custom Zsh Theme..."
cp mytheme.zsh-theme "$ZSH_CUSTOM_THEMES/mytheme.zsh-theme"

if grep -q "ZSH_THEME=" "$HOME/.zshrc"; then
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="mytheme"/' "$HOME/.zshrc"
else
    echo 'ZSH_THEME="mytheme"' >> "$HOME/.zshrc"
fi

echo "Selesai! Silakan ketik: source ~/.zshrc"
