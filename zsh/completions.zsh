setopt extendedglob complete_in_word glob_complete nolisttypes

zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' rehash true
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::*:(rm|rmdir|chmod|chgrp|chown|diff|vi|vim|emacs):*' ignore-line true

autoload -Uz compinit
compinit

autoload -Uz bashcompinit
bashcompinit
