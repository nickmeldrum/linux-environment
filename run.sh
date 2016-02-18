#!/bin/bash

sudo apt-get install git -y

mkdir -p ~/proj
cd ~/proj

git clone https://github.com/nickmeldrum/linux-environment env

cd env

source install.sh

