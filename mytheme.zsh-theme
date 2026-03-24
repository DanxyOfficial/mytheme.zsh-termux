control_syntax() {
    local content=$1
    local cmd="${content%% *}"
    if whence "$cmd" >/dev/null; then
        echo -n "%F{green}$content%f" 
    else
        echo -n "%F{red}$content%f"  
    fi
}

bindkey '^[[A' up-line-or-beginning-search 
bindkey '^[[B' down-line-or-beginning-search 
bindkey '^I' expand-or-complete 


PROMPT='%F{yellow}[%~]%f %F{cyan}❯%f '

setopt CORRECT
