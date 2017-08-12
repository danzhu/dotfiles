autoload -Uz add-zsh-hook

function title() {
    emulate -L zsh
    setopt prompt_subst

    case "$TERM" in
        xterm*|rxvt*)
            print -nP "\e]2;$2:q\a" # window
            print -nP "\e]1;$1:q\a" # tab
            ;;
        screen*|tmux*)
            print -nP "\e]2;$2:q\a" # window
            print -nP "\ek$1:q\e\\" # tab
            ;;
        *)
            if [[ -n "$terminfo[fs1]" && -n "$terminfo[ts1]" ]]; then
                echoti ts1
                print -nP "$1"
                echoti fs1
            fi
            ;;
    esac
}

function title-precmd() {
    title 'zsh' '%m: %~'
}

function title-preexec() {
    local cmd="${1[(wr)^(*=*|sudo|ssh|-*)]:gs/%/%%}"
    local line="${2:gs/%/%%}"
    title '$cmd' '%m: $line'
}

add-zsh-hook precmd title-precmd
add-zsh-hook preexec title-preexec
