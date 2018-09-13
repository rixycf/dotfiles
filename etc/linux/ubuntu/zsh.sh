#!/bin/bash

install_zplug(){
    sed -i 's@/usr/local/opt/zplug@\$HOME/.zplug@' "$HOME/.zshrc"

    local INSTALL_SCRIPT=https://raw.githubusercontent.com/zplug/installer/master/installer.zsh
    local current=$(cd $(dirname $0); pwd)

    tmpfile="$(mktemp $current/XXXX.zsh)"
    curl -Lso "$tmpfile" "$INSTALL_SCRIPT" || return 1

    zsh "$tmpfile" || return 1

    rm $tmpfile

    return $?

}

install_zsh(){
    sudo apt install -y zsh
    return $?
}

## if tab completion error. remove ~/.zplug/zcompdump
