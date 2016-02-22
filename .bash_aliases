alias g="git"
alias xml="xmlstarlet"

function execline() {
    sed -n $1p $2 | source /dev/stdin
}

function acg() {
    git add .
    git commit -v -m "$1"
}

cat ~/proj/env/cheatsheet

