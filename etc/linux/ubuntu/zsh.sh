#!/bin/bash

install_zplug(){

    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

}

echo "install zsh"
sudo apt install zsh

echo "install zplug"
install_zplug

## if tab completion error. remove ~/.zplug/zcompdump
