# Aktifkan fitur eksekusi fungsi di prompt
setopt PROMPT_SUBST

function get_date() { echo "$(date +'%d %a %b')" }
function get_time() { echo "$(date +'%l:%M %p')" }

# Panggil widget history
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Prompt Multiline dengan warna standar Zsh (%F{warna})
PROMPT='
%F{blue}┌─[%f%F{green}%n%f%F{yellow}@%f%F{cyan}termux%f%F{blue}]%f-%F{blue}[%f%F{yellow}$(get_date)%f%F{blue}]%f-%F{blue}[%f%F{yellow}$(get_time)%f%F{blue}]%f
%F{blue}├─[%f%F{yellow}%(4~|/%2~|%~)%f%F{blue}]%f
%F{blue}└─[%f%F{magenta}$%f%F{blue}]%f '

RPROMPT=''

# Alias
alias l="ls --color=auto"
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias la="ls -a --color=auto"
alias c="clear"
alias ..="cd .."

# Bindkey History
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Matikan koreksi
unsetopt CORRECT
unsetopt CORRECT_ALL

# Tab completion
autoload -Uz compinit && compinit
zstyle ":completion:*" menu select
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"

# Warna pas ngetik (Mengeja)
_check_cmd_color() {
    local cmd="${BUFFER%% *}"
    if [[ -z "$BUFFER" ]]; then
        REGION_HIGHLIGHT=()
    elif whence "$cmd" >/dev/null; then
        REGION_HIGHLIGHT=("0 ${#cmd} fg=green")
    else
        REGION_HIGHLIGHT=("0 ${#cmd} fg=red")
    fi
}
zle -N zle-line-pre-redraw _check_cmd_color
