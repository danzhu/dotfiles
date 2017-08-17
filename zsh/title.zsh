function title() {
    emulate -L zsh

    local prefix=$(print -P $TITLE_PREFIX)

    case "$TERM" in
        xterm*|rxvt*|tmux*)
            print -n "\e]2;$prefix$1\a"
            ;;
        *)
            if [[ -n "$terminfo[fs1]" && -n "$terminfo[ts1]" ]]; then
                echoti ts1
                print -n "$prefix$1"
                echoti fs1
            fi
            ;;
    esac
}

function title-precmd() {
    title "$(print -P '%~')"
}

function title-preexec() {
    title "$2"
}

TITLE_PREFIX='%m: '

autoload -Uz add-zsh-hook

add-zsh-hook precmd title-precmd
add-zsh-hook preexec title-preexec
