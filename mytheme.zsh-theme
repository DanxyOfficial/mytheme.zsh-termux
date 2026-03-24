# ----------------------------------------------------------------              
#  MY CUSTOM TERMINAL THEME (Simple & Smart)
#  Author: [Nama Kamu]
#  Features: Auto-suggestion, Syntax Colors, Git Status
# ----------------------------------------------------------------

# 1. Warna Dasar (Variabel agar mudah diedit)
GREEN='%F{082}'
CYAN='%F{045}'
PINK='%F{213}'
WHITE='%F{255}'
YELLOW='%F{226}'
RESET='%f'

# 2. Fungsi Git Status (Biar kelihatan lagi di branch mana)
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# 3. Design Prompt (Tampilan Baris Perintah)
# Bentuknya: [user@termux] ~/folder (main) $
PROMPT='${CYAN}[%n@termux] ${PINK}%~${YELLOW}$(parse_git_branch) ${WHITE}$ ${RESET}'

# 4. Fitur "Mengeja" (Syntax Highlighting Sederhana)
# Mewarnai perintah saat diketik: Hijau jika ada, Merah jika tidak ada
command_colorizer() {
    local buffer=$1
    local cmd="${buffer%% *}"
    if whence "$cmd" >/dev/null; then
        echo -n "$GREEN$buffer$RESET"
    else
        echo -n "%F{196}$buffer$RESET"
    fi
}

# 5. Fitur "Mengetik Otomatis" (History Search)
# Gunakan panah atas/bawah untuk mencari perintah yang pernah diketik sebelumnya
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
# Tekan Tab untuk auto-complete folder/file yang lebih pro
setopt AUTO_LIST
setopt AUTO_MENU
