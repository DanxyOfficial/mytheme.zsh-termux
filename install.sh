#!/bin/bash
DIR=$(pwd)

# Daftar paket yang dibutuhkan
PACKAGES=(zsh proot-distro git figlet lolcat exa)
TO_INSTALL=()

echo "Checking dependencies..."

# Cek satu-satu paketnya, kalau belum ada baru masukin list install
for pkg in "${PACKAGES[@]}"; do
    if ! command -v "$pkg" &> /dev/null; then
        TO_INSTALL+=("$pkg")
    fi
done

# Eksekusi install hanya jika ada paket yang kurang
if [ ${#TO_INSTALL[@]} -ne 0 ]; then
    echo "Installing missing packages: ${TO_INSTALL[*]}..."
    pkg update && pkg upgrade -y
    pkg install "${TO_INSTALL[@]}" -y
else
    echo "All core packages are already installed. Skipping..."
fi

# --- Setup Plugins Zsh ---
# Gunakan -d untuk cek folder, biar gak download ulang
mkdir -p ~/.zsh
echo "Checking Zsh plugins..."
if [[ ! -d ~/.zsh/zsh-autosuggestions ]]; then
    echo "Cloning zsh-autosuggestions..."
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

if [[ ! -d ~/.zsh/zsh-syntax-highlighting ]]; then
    echo "Cloning zsh-syntax-highlighting..."
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
fi

# --- Setup Config Termux ---
mkdir -p ~/.termux
if [[ -f "$DIR/termux.properties" ]]; then
    echo "Applying termux.properties..."
    cp "$DIR/termux.properties" ~/.termux/termux.properties
fi

# --- Setup Boot Banner (File .draw) ---
if [[ -f "$DIR/boot_banner.sh" ]]; then
    echo "Setting up boot banner..."
    cp "$DIR/boot_banner.sh" ~/.draw
    chmod +x ~/.draw
fi

# --- Bersihkan Welcome Banner bawaan ---
if [[ -f $PREFIX/etc/motd ]]; then
    rm -f $PREFIX/etc/motd
    touch $PREFIX/etc/motd
fi

# --- Setup .zshrc ---
# Gunakan grep biar gak numpuk barisnya kalau install berkali-kali
ZSHRC_LINE="source $DIR/mytheme.zsh-theme"
if ! grep -q "$ZSHRC_LINE" ~/.zshrc 2>/dev/null; then
    echo "Updating .zshrc..."
    echo "$ZSHRC_LINE" >> ~/.zshrc
fi

# --- Ganti Shell ke Zsh ---
if [[ "$SHELL" != */zsh ]]; then
    echo "Changing shell to Zsh..."
    chsh -s zsh
fi

termux-reload-settings

echo "------------------------------------------------"
echo "  Style Termux Berhasil Di-update!             "
echo "  Semua sudah optimal. Sikat, Suhu!            "
echo "  Ketik 'zsh' atau restart app untuk melihat.   "
echo "------------------------------------------------"
