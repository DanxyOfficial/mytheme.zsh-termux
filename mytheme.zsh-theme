setopt PROMPT_SUBST
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{yellow}(%f%F{red}%b%f%F{yellow})%f'
precmd() { vcs_info }

function get_date() { echo "$(date +'%d %b')" }
function get_time() { echo "$(date +'%H:%M:%S')" }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

PROMPT='
%F{blue}┌─%f%F{cyan}[%f%F{white}%n%f%F{cyan}]%f%F{blue}─%f%F{cyan}[%f%F{green}$(get_date)%f%F{cyan}]%f%F{blue}─%f%F{cyan}[%f%F{yellow}$(get_time)%f%F{cyan}]%f
%F{blue}├─%f%F{cyan}[%f%F{magenta}%(4~|/%2~|%~)%f%F{cyan}]%f ${vcs_info_msg_0_}
%F{blue}└─%f%F{cyan}[%f%F{white}$%f%F{cyan}]%f '

RPROMPT=''

alias l='ls --color=auto'
alias ll='ls -lha --color=auto'
alias c='clear'
alias ..='cd ..'
alias gs='git status'
alias gp='git pull'

export LS_COLORS='di=01;34:ln=01;36:so=01;35:pi=33:ex=01;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;42'

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^I' menu-complete

unsetopt CORRECT
unsetopt CORRECT_ALL

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

_check_cmd_color() {
    local cmd="${BUFFER%% *}"
    if [[ -z "$BUFFER" ]]; then
        REGION_HIGHLIGHT=()
    elif whence "$cmd" >/dev/null; then
        REGION_HIGHLIGHT=("0 ${#cmd} fg=green,bold")
    else
        REGION_HIGHLIGHT=("0 ${#cmd} fg=red,bold")
    fi
}
zle -N zle-line-pre-redraw _check_cmd_color
