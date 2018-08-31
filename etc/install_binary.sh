#/bin/sh
OS=""

if [ "$(uname)" == 'Darwin' ]; then

    OS='Mac'

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'

fi

echo $OS

