#!/bin/bash

install_zplug(){
    local INSTALL_SCRIPT=https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh

    curl -sL --proto-redir -all, "$INSTALL_SCRIPT" | zsh 
    return $?

}

install_zsh(){
    sudo apt install -y zsh
    return $?
}

## if tab completion error. remove ~/.zplug/zcompdump
