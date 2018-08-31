#!/bin/sh
dein_install() {
    local -r DEIN_INSTALL_SCRIPT="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

    tmpfile=$(mktemp $HOME/XXXX)

    curl -LsSo "$tmpfile" "$DEIN_INSTALL_SCRIPT" &> /dev/null

    if [ . $tmpfile $HOME/.vim/dein ]; then
        rm $tmpfile
        return 0
    fi

    rm $tmpfile
    return 1
}

dein_install

