setopt extendedglob complete_in_word glob_complete

fpath=($DOT/zsh/completion $fpath)

zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' rehash true
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion::*:(rm|vim):*' ignore-line true

autoload -Uz compinit
compinit
