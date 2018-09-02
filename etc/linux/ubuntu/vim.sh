#!/bin/sh


dein_install() {
    local DEIN_INSTALL_SCRIPT="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

    curl "$DEIN_INSTALL_SCRIPT" > installer.sh
    sh installer.sh ~/.vim/dein
}

install_vim() {
    local -r DOWNLOAD_DIR=/opt
    sudo apt install -y build-essential ncurses-dev lua5.2 lua5.2-dev
    git clone https://github.com/vim/vim $DOWNLOAD_DIR

    cd $DOWNLOAD_DIR/vim

    sudo $DOWNLOAD_DIR/vim/configure \
        --with-features=huge \
        --enable-multibyte \
        --enable-fontset
        --enable-luainterp=dynamic \
        --enable-cscope \
        --enable-gui-auto \
        --enable-gtk2-check \
        --with-x \
        --prefix=/usr/local

    sudo make
    sudo make install
}

dein_install
install_vim

