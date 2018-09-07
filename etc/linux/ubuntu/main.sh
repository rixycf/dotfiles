#!/bin/bash

## sudo keep alive 
## 60秒ごとにsudo -n trueを実行することで，パスワードの再要求の時間を伸ばす．
## この処理は親プロセス(main.sh)が最後まで実行されるまで，バックグラウンドでループする
sudo_keepalive() {

    while true; do
        sudo -n true;
        sleep 60;
        kill -0 "$$" || exit
    done 2>/dev/null &

}

## install_tools function install binaries ... (example: git tmux ...)
install_tools() {
    local SCRIPT_DIR=$(cd $(dirname $0); pwd)
    echo "$SCRIPT_DIR"

    install_list=(
        git
        vim
        zsh
        tmux
    )

    for s in "${install_list[@]}"; do
        echo "$s.sh"
        $SCRIPT_DIR/$s.sh
    done
}

#
sudo_keepalive

#TODO: add comment
sudo apt update
sudo apt upgrade

install_tools
## reload shell
exec $SHELL

echo "sudo timestamp reset..."
sudo -K
