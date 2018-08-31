#!/bin/sh
dein_install() {
    local DEIN_INSTALL_SCRIPT="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

    curl "$DEIN_INSTALL_SCRIPT" > installer.sh
    sh installer.sh ~/.vim/dein
}

dein_install

