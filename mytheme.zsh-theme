# 1. Jalankan Boot Banner
if [[ -f ~/.draw ]]; then
    bash ~/.draw
else
    clear
fi

# 2. Config Cursor & History
printf '\e[4 q'
HISTSIZE=4096
SAVEHIST=16384
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# 3. Load Data User
[[ -f ~/.username ]] && . ~/.username
NAME=${NAME:-"u0_a66"}

# 4. Aktifkan Plugins (Wajib ada file-nya)
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 5. Styling Plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # Abu-abu terang biar jelas
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'

# 6. Prompt Style
setopt PROMPT_SUBST
PROMPT='
%F{red}┌─[%f%F{blue}${NAME}%f%F{yellow}@%f%F{cyan}termux%f%F{red}]─[%f%F{green}%~%f%F{red}]%f
%F{red}└──╼ %f%F{red}❯%f%F{blue}❯%f%F{white}❯%f '

# 7. Alias Full Pack
if whence exa >/dev/null; then
    alias l='exa --icons'
    alias ls='exa --color=auto'
    alias la='exa -a'
    alias ll='exa -hl'
    alias lla='exa -hla'
    alias lt='exa --tree --level=2'
else
    alias l='ls --color=auto'
    alias ls='ls --color=auto'
    alias la='ls -A'               
    alias ll='ls -Fhl'             
    alias lla='ls -AFhl'           
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../..'
alias ~='cd ~'
alias c='clear'
alias h='history'
alias df='df -h'
alias free='free -m'
alias grep='grep --color=auto'
alias pkgin='pkg install'
alias pkgup='pkg update && pkg upgrade'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'      
alias nethunter="proot-distro login nethunter"
alias myip="curl ifconfig.me"

# 8. Keybindings
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey '^[[C' autosuggest-accept # Panah kanan buat ambil saran
