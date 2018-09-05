#!/bin/sh

# declare -r SCRIPT_DIR=$(cd $(dirname $0); pwd)
# echo "$SCRIPT_DIR"
## sudo -v は次のパスワードを尋ねるまでの残り時間をデフォルトの時間に戻す．
## デフォルトは5分． 詳しくはsudoersファイルに設定がある
# sudo -v 

## 60秒ごとにsudo -n trueを実行することで，パスワードの再要求の時間を伸ばしている．
## この処理は親プロセス(main.sh)が最後まで実行されるまで，バックグラウンドでループする

# while true; do echo "test"; sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>dev/null &
# #
# sudo apt update
# sudo apt upgrade
#

## sudo keep alive 
sudo_keepalive() {

    while true; do
        sudo -n true;
        sleep 60;
        kill -0 "$$" || exit
    done 2>dev/null &

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
        echo "$s"
        
    done
}


sudo_keepalive

sudo apt update
sudo apt upgrade

install_tools

echo "sudo timestamp reset..."
sudo -K
