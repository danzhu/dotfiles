prompt_hostname() {
    if [[ -n "$SSH_CONNECTION" ]]; then
        echo " $(hostname)"
    fi
}

prompt_init() {
    local PT_BG="\[$(tput setab 0)\]"
    local PT_BOLD="\[$(tput bold)\]"
    local PT_BLUE="\[$(tput setaf 4)\]"
    local PT_GREY="\[$(tput setaf 7)\]"
    local PT_RESET="\[$(tput sgr0)\]"

    PS1="
${PT_BG}${PT_BOLD}${PT_BLUE} \w ${PT_RESET}
${PT_GREY}\$${PT_RESET} "
}

prompt_init
