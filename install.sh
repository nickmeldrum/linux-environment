#!/bin/bash

# install apps
sudo apt-get install vim -y
sudo apt-get install vim-gtk -y

# setting up symlinks to config files
ln -s -f ~/proj/env/.vimrc ~/.vimrc
ln -s -f ~/proj/env/.gitconfig ~/.gitconfig

# map capslock to esc 
echo "setxkbmap -option caps:escape" > ~/.xsessionrc

# setup vundle from cloning in git
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall! +qall

# setup bash profile
ln -s -f ~/proj/env/.bash_aliases ~/.bash_aliases
ln -s -f ~/proj/env/.bash_profile ~/.bash_profile

# install chrome
# from http://www.tecmint.com/install-google-chrome-in-debian-ubuntu-linux-mint/
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y

# install consolas font
mkdir -p ~/.fonts
ln -s -f ~/proj/env/CONSOLA.TTF ~/.fonts/CONSOLA.TTF
ln -s -f ~/proj/env/CONSOLAB.TTF ~/.fonts/CONSOLAB.TTF
ln -s -f ~/proj/env/CONSOLAI.TTF ~/.fonts/CONSOLAI.TTF
ln -s -f ~/proj/env/CONSOLAZ.TTF ~/.fonts/CONSOLAAZ.TTF
fc-cache -f -v

# install dropbox
pushd .
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
popd

# password safe
pushd .
cd ~
wget "http://freefr.dl.sourceforge.net/project/passwordsafe/Linux-BETA/0.94/passwordsafe-ubuntu-0.94BETA.amd64.deb"
sudo dpkg -i passwordsafe-ubuntu-0.94BETA.amd64.deb -y
sudo apt-get -f install -y
sudo dpkg -i passwordsafe-ubuntu-0.94BETA.amd64.deb -y
rm passwordsafe-ubuntu-0.94BETA.amd64.deb
popd

# install nodejs
sudo apt-get install nodejs -y
sudo apt-get -f install -y
sudo apt-get install nodejs -y

# xml config updates
sudo apt-get install xmlstarlet -y
cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.bak

function addKeyboardApp()
{
    path=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    xmlstarlet ed -a "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t elem -n property "$path" |
    xmlstarlet ed -i "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n name -v "$1" |
    xmlstarlet ed -i "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n type -v "string" |
    xmlstarlet ed -i "/channel/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n value -v "$2" > $path.new
    cp $path.new $path
}

addKeyboardApp "<Primary><Alt>g" "gvim"
addKeyboardApp "<Primary><Alt>t" "xfce4-terminal --maximize --fullscreen --hide-menubar"
addKeyboardApp "<Primary><Alt>b" "/usr/bin/google-chrome-stable"

# cleanup
sudo apt-get autoremove -y

## TODO:

# setup password safe and dropbox to get my passwords

# setup launcher shortcuts:
# ctrl-alt-t = xfce4-terminal --maximize --fullscreen
# ctrl-alt-g = gvim -f
# ctrl-alt-b = /usr/bin/google-chrome-stable %U

# setup bash prompt to include git info
# setup a git credential manager to remember git password

# set terminal config to hide toolbar and chrome
# set terminal config to load maximized
# set a terminal shortcut key

# link gvimrc
# setup xmllint for prertyxml in vim

