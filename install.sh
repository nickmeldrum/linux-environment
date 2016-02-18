#!/bin/bash

# tested on debian 8 and xfce 4

# must have installed sudo and added user as a sudo user.
# How do this? This is how:
# 1. su
# 2. aptitude install sudo
# 3. adduser nick sudo
# 4. reboot
# 5. wget 

# install apps
sudo apt-get install vim -y
sudo apt-get install vim-gtk -y

# setting up symlinks to config files
ln -s -f ~/proj/env/.vimrc ~/.vimrc
ln -s -f ~/proj/env/.gitconfig ~/.gitconfig

# map capslock to esc 
echo "setxkbmap -option caps:escape" > ~/.xsessionrc

# setup better resolution for debian (from virtualbox?)
# from:
# http://unix.stackexchange.com/questions/222659/how-do-i-adjust-the-screen-resolution-for-my-debian-8-1-64-bit-virtualbox-machin
# su
# then I ran Host+D (to insert the guest additions ISO),
# mkdir /media/VirtualBoxGuestAdditions
# mount -r /dev/cdrom /media/VirtualBoxGuestAdditions
# export KERN_DIR=/usr/src/kernels/`uname -r`
# cd /media/VirtualBoxGuestAdditions
# ./VBoxLinuxAdditions.run

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

# TODO:

# install consolas font
mkdir -p ~/.fonts
ln -s -f ~/proj/env/CONSOLA.TTF ~/.fonts/CONSOLA.TTF
ln -s -f ~/proj/env/CONSOLAB.TTF ~/.fonts/CONSOLAB.TTF
ln -s -f ~/proj/env/CONSOLAI.TTF ~/.fonts/CONSOLAI.TTF
ln -s -f ~/proj/env/CONSOLAZ.TTF ~/.fonts/CONSOLAAZ.TTF
fc-cache -f -v

# and get it used in terminal and vim

# setup launcher shortcuts:
# ctrl-alt-t = xfce4-terminal --maximize --fullscreen
# ctrl-alt-g = gvim -f
# ctrl-alt-b = /usr/bin/google-chrome-stable %U

# install nodejs

# setup bash prompt to include git info
# setup a git credential manager to remember git password

# setup password safe and dropbox to get my passwords

# set terminal config to hide toolbar and chrome
# set terminal config to load maximized
# set a terminal shortcut key

# setup script so no dependency on git:
# 1. execute output of curl to a raw of a setup script that clones the git repo to do the rest


# start building cheatsheet:

# ## xfce shortcuts:
# * ctrl-alt-< and> = move between workspaces
# * alt-f1 = apps menu
# * alt-f2 = launcher
# * alt-f4 = close app
# * alt-f11 = fullscreen toggle
#
# ## My xfce shortcuts:
# * ctrl-alt-t = xfce4-terminal --maximize --fullscreen
# * ctrl-alt-g = gvim -f
# * ctrl-alt-b = /usr/bin/google-chrome-stable %U

