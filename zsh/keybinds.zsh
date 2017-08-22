setopt noflow_control

function rationalize-dot() {
    if [[ $LBUFFER = (*[ /]|).. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalize-dot

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -v

bindkey -v '^P' history-beginning-search-backward-end
bindkey -v '^N' history-beginning-search-forward-end
bindkey -v '^?' backward-delete-char
bindkey -v '^H' backward-delete-char
bindkey -v '^W' backward-kill-word
bindkey -v '^R' history-incremental-search-backward
bindkey -v '^S' history-incremental-search-forward
bindkey -v '^A' beginning-of-line
bindkey -v '^E' end-of-line
bindkey -v '^U' kill-whole-line
bindkey -v '^Q' push-line-or-edit
bindkey -v '.' rationalize-dot
bindkey -v ' ' magic-space
bindkey -a '!' edit-command-line
bindkey -M isearch '.' self-insert

WORDCHARS="${WORDCHARS:s@/@}"
