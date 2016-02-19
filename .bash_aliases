function execline() {
    sed -n $1p $2 | source /dev/stdin
}

alias g="git"
alias xml="xmlstarlet"

cat ~/proj/env/cheatsheet

function addKeyboardApp() {
    path=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    xmlstarlet ed -a "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t elem -n property $path > $path
    xmlstarlet ed -i "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n name -v $1 $path > $path
    xmlstarlet ed -i "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n type -v "string" $path > $path
    xmlstarlet ed -i "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n value -v $2  $path > $path
}

