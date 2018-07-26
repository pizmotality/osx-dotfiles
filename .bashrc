export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export ARCHFLAGS="-arch x86_64"

export VIRTUAL_ENV_DISABLE_PROMPT=1

PS1="\[\033[38;5;4m\]┌─[\u@\h] \[\033[38;5;2m\]\W\[\033[38;5;3m\]\$(get_git_branch)\n\
\[\033[38;5;4m\]└─╼ 𝄞\[\033[0m\]\$(get_virtualenv) "

alias ls='ls --color=auto'
alias gdf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

function get_git_branch() {
    if git --version &> /dev/null; then
        # On branches, this will return the branch name
        # On non-branches, (no branch)
        ref="$(git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///')"
        if [[ "$ref" != "" ]]; then
            echo " :$ref:"
        fi
    fi
}

function get_virtualenv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo " (${VIRTUAL_ENV##*/})"
    fi
}
