PROMPT='%F{cyan}[%n]%f %F{yellow}%~%f $ '

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

zstyle ':completion:*' menu select
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
