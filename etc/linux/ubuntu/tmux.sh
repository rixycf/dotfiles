#!/bin/bash

. ./utils.sh

install_tmux() {
    local DOWNLOAD_DIR=/opt/tmux
    sudo apt install -y build-essential \
        automake \
        libevent-dev \
        ncurses-dev \
        || return 1

    sudo git clone https://github.com/tmux/tmux $DOWNLOAD_DIR || return 1

    cd $DOWNLOAD_DIR
    ## checkout latest tag (2018/09/05  tmux: version 2.8)
    sudo git checkout $(git tag | sort -V | tail -n 1)
    sudo sh autogen.sh
    sudo $DOWNLOAD_DIR/configure || return 1
    sudo make
    sudo make install

    return $?
}
