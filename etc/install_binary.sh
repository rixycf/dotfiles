#!/bin/bash
OS=""
SCRIPT_DIR="$(cd $(dirname $0); pwd)"

if [ "$(uname)" = 'Darwin' ]; then

    OS="Mac"
    SCRIPT_DIR="$SCRIPT_DIR/mac"
    $SCRIPT_DIR/main.sh

elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ] && [ -e "/etc/lsb-release" ]; then

    OS="Linux"
    SCRIPT_DIR="$SCRIPT_DIR/linux/ubuntu"
    $SCRIPT_DIR/main.sh
fi


