#!/bin/bash

spin() {
    tput civis

    local pid=$1
    local before_message=$2
    local after_message=$3
    local spinner='|/-\'
    local delay=0.08
    local temp=""
    local prosess="$(ps a | grep $pid | grep -v "grep" | awk '{for(i=5; i<= NF;i++) printf "%s ", $i;}')"

    while [ "$(ps a | awk '{print $1}' | grep -w $pid)" ]; do

        temp=${spinner#?}
        printf "$prosess" 
        printf " [%c] " "$spinner" 
        printf "$before_message \r"

        sleep $delay

        spinner=$temp${spinner%"$temp"}

    done

    delete_oneline
    printf " [o] done! \n"

    tput cnorm
}

delete_oneline() {
    local cols="$(tput cols)"
    for i in $(seq 2 $cols); do
        printf " "
    done

    printf "\r"

}
