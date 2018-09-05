#/bin/sh
OS=""
SCRIPT_DIR="$(cd $(dirname $0); pwd)"

if [ "$(uname)" == 'Darwin' ]; then

    OS="Mac"
    SCRIPT_DIR="$SCRIPT_DIR/mac"
    echo $SCRIPT_DIR
    ls $SCRIPT_DIR

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then

    OS="Linux"
    INSTALL_SCRIPT="$SCRIPT_DIR/linux/ubuntu"
    echo $SCRIPT_DIR
    ls $SCRIPT_DIR

fi

echo $OS

