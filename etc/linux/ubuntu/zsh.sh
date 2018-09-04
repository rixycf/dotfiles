#!/bin/sh

install_zplug(){

    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

}

echo "install zsh"
sudo apt install zsh

echo "change loing shell"
chsh -s $(which zsh)

echo "install zplug"
install_zplug

