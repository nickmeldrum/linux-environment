alias g="git"
alias xml="xmlstarlet"

function execline() {
    sed -n $1p $2 | source /dev/stdin
}

function acg() {
    git add .
    git commit -v -m "$1"
}

function log() {
    if [ "$#" -ne 1 ]; then
        length=5
    else
        length=$1
    fi

    git log -$length --pretty=format:'%C(yellow)%h %Cred%ad %C(yellow)%an%Cgreen%d %Creset%s' --date=short
}

cat ~/proj/env/cheatsheet

