function get_date() { echo "$(date +'%d %a %b')" }
function get_time() { echo "$(date +'%l:%M %p')" }

PROMPT=$'
%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;33m%}@%{\e[0m%}%{\e[0;36m%}termux%{\e[0;34m%}%B]%b%{\e[0m%}-%{\e[0;34m%}%B[%b%{\e[0;33m%}$(get_date)%{\e[0;34m%}%B]%b%{\e[0m%}-%{\e[0;34m%}%B[%b%{\e[1;33m%}$(get_time)%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B├─%{\e[0;34m%}%B[%b%{\e[1;33m%}%(4~|/%2~|%~)%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '

export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.tar=00;31:*.zip=00;31:*.jpg=01;35:*.png=01;35:*.mp3=00;32:'
alias ls='ls --color=auto'

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

setopt CORRECT
SPROMPT='Maksud lo %R? [y/n/e/a]: '

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

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
