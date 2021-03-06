#!/bin/bash

#install zsh
if ! < /etc/shells grep zsh; then
    sudo apt-get install zsh -y
    sudo chsh -s /bin/zsh nick
fi

# install oh my zsh
if [ ! -d ~/.oh-my-zsh ]; then
    pushd .
    cd ~
    rm -fr .oh-my-zsh/
    curl -L http://install.ohmyz.sh > install.sh
    sh install.sh
    rm -f install.sh
    popd
fi

# install tools
sudo apt-get install curl -y

# install git credential helper
if [ ! -d /usr/share/doc/git/contrib/credential/gnome-keyring ]; then
    sudo apt-get install libgnome-keyring-dev -y
    sudo apt-get install make -y
    sudo apt-get install gcc -y
    cd /usr/share/doc/git/contrib/credential/gnome-keyring
    sudo make
    git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
fi

# install apps
sudo apt-get install vim -y
sudo apt-get install vim-gtk -y

# setting up symlinks to config files
ln -s -f ~/proj/env/.vimrc ~/.vimrc
ln -s -f ~/proj/env/.gvimrc ~/.gvimrc
ln -s -f ~/proj/env/.gitconfig ~/.gitconfig

# map capslock to esc 
if ! grep --quiet "setxkbmap -option caps:escape" ~/.xsessionrc; then
    echo "setxkbmap -option caps:escape" >> ~/.xsessionrc
fi

# setup vundle from cloning in git
if [ -d ~/.vim/bundle ]; then
    pushd .
    cd ~/.vim/bundle/Vundle.vim
    git pull
    popd
else
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall! +qall
vim +PluginClean! +qall

# setup profile
ln -s -f ~/proj/env/.bash_aliases ~/.bash_aliases
ln -s -f ~/proj/env/.bash_profile ~/.bash_profile
if ! grep --quiet ". ~/.bash_aliases" ~/.zshrc; then
    echo ". ~/.bash_aliases" >> ~/.zshrc
fi

# install chrome
# from http://www.tecmint.com/install-google-chrome-in-debian-ubuntu-linux-mint/
if ! dpkg -s google-chrome-stable &> /dev/null; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable -y
fi

# install consolas font
mkdir -p ~/.fonts
ln -s -f ~/proj/env/CONSOLA.TTF ~/.fonts/CONSOLA.TTF
ln -s -f ~/proj/env/CONSOLAB.TTF ~/.fonts/CONSOLAB.TTF
ln -s -f ~/proj/env/CONSOLAI.TTF ~/.fonts/CONSOLAI.TTF
ln -s -f ~/proj/env/CONSOLAZ.TTF ~/.fonts/CONSOLAAZ.TTF
fc-cache -f -v

# install dropbox
if [ ! -d ~/.dropbox-dist ]; then
    pushd .
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
    popd
fi

# keepassx
sudo apt-get install keepassx -y

# install nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
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

if ! grep --quiet "gvim" ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml; then
    addKeyboardApp "<Primary><Alt>g" "gvim"
fi
if ! grep --quiet "xfce4-terminal" ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml; then
    addKeyboardApp "<Primary><Alt>t" "xfce4-terminal --maximize --fullscreen --hide-menubar"
fi
if ! grep --quiet "google-chrome-stable" ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml; then
    addKeyboardApp "<Primary><Alt>b" "/usr/bin/google-chrome-stable"
fi

# cleanup
sudo apt-get autoremove -y

