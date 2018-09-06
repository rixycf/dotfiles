#!/bin/sh

install_tmux() {
    local DOWNLOAD_DIR=/opt/tmux
    sudo apt install -y build-essential automake libevent-dev ncurses-dev
    sudo git clone https://github.com/tmux/tmux $DOWNLOAD_DIR

    cd $DOWNLOAD_DIR
    ## checkout latest tag (2018/09/05  tmux: version 2.8)
    sudo git checkout $(git tag | sort -V | tail -n 1)
    sudo sh autogen.sh
    sudo $DOWNLOAD_DIR/configure
    sudo make
    sudo make install
}

install_tmux
