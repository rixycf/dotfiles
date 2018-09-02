#!/bin/sh


dein_install() {
    local DEIN_INSTALL_SCRIPT="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

    curl "$DEIN_INSTALL_SCRIPT" > installer.sh
    sh installer.sh ~/.vim/dein

    rm installer.sh
}

install_vim() {
    local DOWNLOAD_DIR=/opt/vim
    sudo apt install -y build-essential ncurses-dev lua5.2 lua5.2-dev
    git clone https://github.com/vim/vim $DOWNLOAD_DIR

    cd $DOWNLOAD_DIR

    if [ -f $DOWNLOAD_DIR/configure ]; then
        sudo $DOWNLOAD_DIR/configure \
            --with-features=huge \
            --enable-multibyte \
            --enable-fontset \
            --enable-luainterp=dynamic \
            --enable-cscope \
            --enable-gui-auto \
            --enable-gtk2-check \
            --with-x \
            --prefix=/usr/local
    fi 

    sudo make
    sudo make install
}

dein_install
install_vim

