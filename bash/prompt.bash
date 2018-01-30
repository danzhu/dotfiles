PT_BG="\[$(tput setab 0)\]"
PT_BOLD="\[$(tput bold)\]"
PT_BLUE="\[$(tput setaf 4)\]"
PT_GREY="\[$(tput setaf 7)\]"
PT_RESET="\[$(tput sgr0)\]"

prompt_hostname() {
    if [[ -n "$SSH_CONNECTION" ]]; then
        echo " $(hostname)"
    fi
}

PS1="
${PT_BG}${PT_BOLD}${PT_BLUE} \w ${PT_RESET}
${PT_GREY}\$${PT_RESET} "
