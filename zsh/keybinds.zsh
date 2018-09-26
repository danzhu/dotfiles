setopt noflow_control
bindkey -v
WORDCHARS="${WORDCHARS:s@/@}"

bindkey -v '^?' backward-delete-char
bindkey -v '^H' backward-delete-char
bindkey -v '^W' backward-kill-word
bindkey -v '^R' history-incremental-search-backward
bindkey -v '^S' history-incremental-search-forward
bindkey -v '^A' beginning-of-line
bindkey -v '^E' end-of-line
bindkey -v '^U' kill-whole-line
bindkey -v '^Q' push-line-or-edit
bindkey -v ' ' magic-space


autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -v '^P' history-beginning-search-backward-end
bindkey -v '^N' history-beginning-search-forward-end


autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -a '!' edit-command-line


autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround


autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done


autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done


function rationalize-dot() {
    if [[ $LBUFFER = (*[ /]|).. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalize-dot
bindkey -v '.' rationalize-dot
bindkey -M isearch '.' self-insert


function foreground() {
    zle push-input
    BUFFER='fg'
    zle accept-line
}
zle -N foreground
bindkey -v '^F' foreground
