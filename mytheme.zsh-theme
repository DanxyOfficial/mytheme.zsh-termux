clear
printf '\e[4 q'

# History Config
HISTSIZE=4096
SAVEHIST=16384
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Load Data User
[[ -f ~/.draw ]] && . ~/.draw
[[ -f ~/.username ]] && . ~/.username
NAME=${NAME:-"u0_a66"}

# --- LOAD PLUGINS ---
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom Warna
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6' 
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'

# Prompt Style
setopt PROMPT_SUBST
PROMPT='
%F{red}┌─[%f%F{blue}${NAME}%f%F{yellow}@%f%F{cyan}termux%f%F{red}]─[%f%F{green}%~%f%F{red}]%f
%F{red}└──╼ %f%F{red}❯%f%F{blue}❯%f%F{white}❯%f '

# --- ALIAS LENGKAP (FULL PACK) ---
# LS & Navigasi
if whence exa >/dev/null; then
    alias l='exa --icons'
    alias ls='exa --color=auto'
    alias la='exa -a'
    alias ll='exa -hl --git'
    alias lla='exa -hla'
    alias lt='exa --tree --level=2'
else
    alias l='ls --color=auto'
    alias ls='ls --color=auto'
    alias la='ls -A'               # Semua file kecuali . dan ..
    alias ll='ls -Fhl'             # Detail list
    alias lla='ls -AFhl'           # Detail list semua
fi

# Navigasi Folder Cepet
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../..'
alias ~='cd ~'

# System Tools
alias c='clear'
alias h='history'
alias df='df -h'                   # Cek storage (human readable)
alias free='free -m'               # Cek RAM dalam MB
alias grep='grep --color=auto'
alias pkgin='pkg install'
alias pkgup='pkg update && pkg upgrade'

# Safety Aliases
alias cp='cp -iv'                  # v = verbose (ngasih tau apa yang dicopy)
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'            # p = create parent folders otomatis

# Tool Lainnya
alias nethunter="proot-distro login nethunter"
alias myip="curl ifconfig.me"      # Cek IP Public lo

# --- KEYBINDINGS ---
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Settingan Auto-Suggestion: 
# Pencet Panah Kanan (Key: ^[[C) buat ambil Full saran
bindkey '^[[C' autosuggest-accept
