#!/bin/bash

error() {
    echo "$@" 1>&2
}

spin() {
    tput civis

    local pid=$1
    local msg=$2

    # local spinner='|/-\'
    local spinner=(⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏)
    local delay=0.08
    local i=0

    while kill -0 $pid > /dev/null 2>&1; do

        printf " [${spinner[i]}] $msg \r"
        let i++
        sleep $delay

        if [ $i -gt ${#spinner[@]} ]; then
            i=0
        fi

    done

    wait $pid
    if [ $? -ne 0 ]; then
        delete_oneline
        printf " [x] $msg fail... \n"
        tput cnorm
        return 1
    fi

    delete_oneline
    printf " [o] $msg complete! \n"
    tput cnorm

}

delete_oneline() {
    local cols="$(tput cols)"
    for i in $(seq 2 $cols); do
        printf " "
    done

    printf "\r"
}

download() {

    local file="$1"
    local url="$2"

    if command -v "curl" >/dev/null 2>&1 ;then
        curl -Lso "$file" "$url" > /dev/null 2>&1 
        return $?

    elif command -v "wget" > /dev/null 2>&1; then
        wget -qO "$file" "$url" > /dev/null 2>&1
        return $?
    fi

    return 1

}
