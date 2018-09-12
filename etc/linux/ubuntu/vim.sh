#!/bin/bash

install_dein() {
    local DEIN_INSTALL_SCRIPT="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

    curl "$DEIN_INSTALL_SCRIPT" > installer.sh ||  return 1
    sh installer.sh ~/.vim/dein ||  return 1

    echo "remove installer.sh..."
    rm installer.sh

    return $?
}

install_vim() {
    local DOWNLOAD_DIR=/opt/vim
    sudo apt install -y build-essential \
        ncurses-dev \
        lua5.2 \
        liblua5.2-dev \
        luajit \
        libluajit-5.1 ||  return 1

    sudo git clone https://github.com/vim/vim $DOWNLOAD_DIR \
        ||  return 1

    ## exec /opt/vim/Makefile
    cd $DOWNLOAD_DIR

    sudo $DOWNLOAD_DIR/configure --with-features=huge \
        --enable-multibyte \
        --enable-fontset \
        --enable-luainterp \
        --with-luajit \
        --enable-cscope \
        --enable-fail-if-missing ||  return 1

    sudo make
    sudo make install

    return $?

}

install_dein 
install_vim

