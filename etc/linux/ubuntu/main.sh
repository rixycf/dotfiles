#!/bin/bash

sudo_keepalive() {

    while true; do
        sudo -n true;
        sleep 60;
        kill -0 "$$" || exit
    done 2>/dev/null &

}

init() {
    local SCRIPT_DIR="$(cd $(dirname $0); pwd)"
    local FILEPATH="$SCRIPT_DIR/$(basename $0)"

    for f in $(find $SCRIPT_DIR -type f -name "*.sh" ); do
        if [ $f = $FILEPATH ]; then
            continue
        fi

        ## read script 
        source $f

    done
}

## install_tools function install binaries ... (example: git tmux ...)
install_tools() {
    local SCRIPT_DIR=$(cd $(dirname $0); pwd)

    install_list=(
        git
        dein
        vim
        zsh
        zplug
        tmux
    )

    ## install tools
    for s in "${install_list[@]}"; do
        ( installer "$s" ) & spin $! "install $s"

        if [ $? -ne 0 ]; then
            return 1
        fi

    done

    return $?
}

installer() {

    local tool=$1
    local logfile_path="$(cd $(dirname $0); pwd)/log"

    install_"$tool" > "$logfile_path/$tool.log" 2>&1

}


main() {

    init
    sudo_keepalive 
    # (sudo apt -y update) & spin $!
    # (sudo apt -y upgrade) & spin $!

    install_tools

    if [ $? -ne 0 ]; then
        echo "install error..."

        echo "sudo timestamp reset"
        sudo -K
        exit 1
    fi

    echo "sudo timestamp reset"
    sudo -K
    echo "complete!"

}

main
