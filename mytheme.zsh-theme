clear

printf '\e[4 q'
HISTSIZE=4096
SAVEHIST=16384
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

[[ -f ~/.draw ]] && . ~/.draw
[[ -f ~/.username ]] && . ~/.username
NAME=${NAME:-"u0_a66"}

setopt PROMPT_SUBST
PROMPT='
%F{red}┌─[%f%F{blue}${NAME}%f%F{yellow}@%f%F{cyan}termux%f%F{red}]─[%f%F{green}%~%f%F{red}]%f
%F{red}└──╼ %f%F{red}❯%f%F{blue}❯%f%F{black}❯%f '

alias grep='grep --color=auto'
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'

if whence exa >/dev/null; then
    alias l="exa"
    alias ls="exa"
    alias la="exa -a"
    alias ll="exa -Fhl"
else
    alias l="ls --color=auto"
    alias ls="ls --color=auto"
    alias la="ls --color=auto -a"
    alias ll="ls --color=auto -Fhl"
fi

alias nethunter="proot-distro login nethunter"

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

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
