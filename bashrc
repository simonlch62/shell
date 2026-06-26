# COPY THE SCRIPT TO THE END OF BASHRC

WHITE="\[\e[97m\]"
TEAL="\[\e[38;5;30m\]"
CYAN="\[\e[96m\]"
RESET="\[\e[0m\]"

parse_git() {
    git rev-parse --is-inside-work-tree &>/dev/null || return
    local branch dirty=""
    branch=$(git branch --show-current 2>/dev/null)
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        dirty=" ✗"
    fi
    printf '\001\e[97m\002─\001\e[96m\002[%s\001\e[31m\002%s\001\e[96m\002]' "$branch" "$dirty"
}

# Ordre : [heure][user@pc][folder][branch]
PS1='\n'"${WHITE}"'┌─'"${TEAL}"'[\A]'"${WHITE}"'─'"${TEAL}"'[\u@\h]'"${WHITE}"'─'"${TEAL}"'[\w]'"${WHITE}"'$(parse_git)'"${RESET}"'\n'"${WHITE}"'└─❯ '"${RESET}"
