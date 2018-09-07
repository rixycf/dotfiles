#!/bin/bash


dein_install() {
    local DEIN_INSTALL_SCRIPT="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

    curl "$DEIN_INSTALL_SCRIPT" > installer.sh
    sh installer.sh ~/.vim/dein

    echo "remove installer.sh..."
    rm installer.sh
}

install_vim() {
    local DOWNLOAD_DIR=/opt/vim
    sudo apt install -y build-essential ncurses-dev lua5.2 liblua5.2-dev luajit libluajit-5.1
    sudo git clone https://github.com/vim/vim $DOWNLOAD_DIR

    ## exec /opt/vim/Makefile
    cd $DOWNLOAD_DIR

    sudo $DOWNLOAD_DIR/configure --with-features=huge \
        --enable-multibyte \
        --enable-fontset \
        --enable-luainterp \
        --with-luajit \
        --enable-cscope \
        --enable-fail-if-missing \

    sudo make
    sudo make install
}

dein_install
install_vim
## reload shell
exec $SHELL

