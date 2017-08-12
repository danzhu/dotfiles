
function prompt-grab() {
    echo "$1" | sed -nE "s/^$2\$/\\1/p"
}

function prompt-diverge() {
    local count="$(prompt-grab "$1" "$2")"
    if [[ $count -ne 0 ]]; then
        print -nP " $3$count%f"
    fi
}

function prompt-count() {
    local count
    if count="$(echo "$1" | grep -cE "$2")"; then
        print -nP " $3$count%f"
    fi
}

function prompt-precmd() {
    local code=$?

    emulate -L zsh
    setopt glob_subst

    print ''

    # exit code
    if [[ $code -ne 0 ]]; then
        print -P "%1F%K %k %B$code%b%f"
    fi

    # host
    print -nP '%B%K'
    if [[ $UID -eq 0 ]]; then
        # root
        print -nP ' %1F%m%f'
    elif [[ -n "$SSH_CONNECTION" ]]; then
        # ssh
        print -nP ' %m'
    fi
    print -nP ' %k '

    # path
    local dir olddir
    local i=1
    while dir="$(print -P "%-$i~")" && [[ "$dir" != "$olddir" ]]; do
        if [[ ! -r $dir ]]; then
            # non-readable
            print -nP '%1F'
        elif [[ ! -w $dir ]]; then
            # non-writable
            print -nP '%3F'
        elif [[ -L $dir ]]; then
            # symlink
            print -nP '%6F'
        else
            # regular
            print -nP '%4F'
        fi

        # print segment
        print -nP "${dir[${#olddir} + 1,${#dir}]}%f"

        i=$((i + 1))
        olddir="$dir"
    done

    # git prompt
    local gs
    if gs="$(git status --porcelain=v2 --branch --untracked-files=all \
            2> /dev/null)"; then
        local branch="$(prompt-grab "$gs" '# branch\.head (.*)')"

        print -nP ' %K '

        if [[ "$branch" = '(detached)' ]]; then
            # detached head
            branch="$(git rev-parse --short HEAD)"
            print -nP '%3F'
        elif [[ -f "$(git rev-parse --git-dir)/MERGE_HEAD" ]]; then
            # merging
            print -nP '%1F'
        elif echo "$gs" | grep -qE '^# branch\.upstream .*$'; then
            # has upstream
            print -nP '%5F'
        else
            # local branch
            print -nP '%2F'
        fi

        print -nP "$branch%f"

        local tag
        if tag="$(git describe --tags --exact-match 2> /dev/null)"; then
            print -nP " #$tag"
        fi

        # ahead
        prompt-diverge "$gs" '# branch\.ab \+(.*) -.*' '%2FA'
        # behind
        prompt-diverge "$gs" '# branch\.ab \+.* -(.*)' '%3FB'

        print -nP ' %k'

        # added
        prompt-count "$gs" '^[12] [MADRCU].' '%2F+'
        # changed
        prompt-count "$gs" '^[12] .[MADRCU]' '%3F~'
        # unmerged
        prompt-count "$gs" '^u' '%1F!'
        # untracked
        prompt-count "$gs" '^\?' '%4F?'

        # stashes
        local stash="$(git stash list | wc -l)"
        if [[ $stash -ne 0 ]]; then
            print -nP " %5F&$stash%f"
        fi
    fi

    print -P '%b'
}

add-zsh-hook precmd prompt-precmd

setopt noprompt_sp

PS1='%K %k '
PS2='%K%7F+%f%k '
