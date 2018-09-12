#!/bin/bash

install_zplug(){
    local INSTALL_SCRIPT=https://raw.githubusercontent.com/zplug/installer/master/installer.zsh
    local pwd=$(cd $(dirname $0); pwd)

    tmpfile="$(mktemp $pwd/XXXX)"
    curl -Lso --proto-redir -all, "$tmpfile" "$INSTALL_SCRIPT" || return 1

    cat $tmpfile | zsh
    rm $tmpfile

    return $?

}

install_zsh(){
    sudo apt install -y zsh
    return $?
}

## if tab completion error. remove ~/.zplug/zcompdump
