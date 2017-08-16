setopt noflow_control

bindkey -v

bindkey -v '^P' history-beginning-search-backward
bindkey -v '^N' history-beginning-search-forward
bindkey -v '^?' backward-delete-char
bindkey -v '^H' backward-delete-char
bindkey -v '^W' backward-kill-word
bindkey -v '^R' history-incremental-search-backward
bindkey -v '^S' history-incremental-search-forward
bindkey -v '^A' beginning-of-line
bindkey -v '^E' end-of-line
bindkey -v '^U' kill-whole-line
bindkey -v '^Q' push-line-or-edit

function rationalise-dot() {
    if [[ $LBUFFER = (*[ /]|).. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

bindkey ' ' magic-space

autoload -U edit-command-line
zle -N edit-command-line
bindkey -a '!' edit-command-line

WORDCHARS="${WORDCHARS:s@/@}"
