#!/bin/bash

# tested on debian

# must have installed sudo and added user as a sudo user.
# How do this? This is how:
# 1. su
# 2. aptitude install sudo
# 3. adduser nick sudo
# 4. reboot
# 5. ./install.sh

# install apps
sudo apt-get install git -y
sudo apt-get install vim -y

# setting up symlinks to config files
ln -s -f ~/proj/env/.vimrc ~/.vimrc
ln -s -f ~/proj/env/.gitconfig ~/.gitconfig

# map capslock to esc 
echo "setxkbmap -option caps:escape" > ~/.xsessionrc

# TODO:

# setup vundle from cloning in git
# do vundle clean and plugininstall

# install nodejs

# setup bash prompt to include git info

# set terminal config to hide toolbar and chrome
# set terminal config to load maximized
# set a terminal shortcut key

# setup aliases in bashrc

