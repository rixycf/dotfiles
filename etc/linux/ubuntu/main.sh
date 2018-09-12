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

init () {
    local FILEPATH="$(cd $(dirname $0); pwd)/$(basename $0)"
    for f in $(find $FILEPATH -type f -name "*.sh" ); do
        if [ $f = $FILEPATH ]; then
            continue
        fi

        ## read script 
        . $f

    done
}

## install_tools function install binaries ... (example: git tmux ...)
install_tools() {
    local SCRIPT_DIR=$(cd $(dirname $0); pwd)
    local bp=""

    install_list=(
        git
        dein
        vim
        zsh
        zplug
        tmux
    )

    for s in "${install_list[@]}"; do
        (install_"$s") & spin $! "install $s"
        bp=$!
        wait $!

        if [ $? -ne 0 ]; then
            return 1
        fi

    done

    return $?
}


main() {
    sudo_keepalive 

    init

    (sudo apt -y update) & spin $!
    (sudo apt -y upgrade) & spin $!

    install_tools

    if [ $? -ne 0 ]; then
        echo "\e[31 install error... \e[m"
        echo "sudo timestamp reset"
        sudo -K
        exit 1
    fi

    echo "sudo timestamp reset"
    sudo -K
    ## reload shell
    # exec $SHELL
}

main
