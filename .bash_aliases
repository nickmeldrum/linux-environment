function execline() {
    sed -n $1p $2 | source /dev/stdin
}

alias g="git"
