#!/bin/bash

spin() {
    tput civis

    local pid=$1
    local before_message=$2
    local after_message=$3
    local spinner='|/-\'
    local delay=0.08
    local temp=""

    while [ "$(ps a | awk '{print $1}' | grep -w $pid)" ]; do
        local prosess="$(ps a | grep $pid | awk '{print $5}')"

        temp=${spinner#?}
        printf "$prosess" 
        printf " [%c] " "$spinner" 
        printf "$before_message \r"

        sleep $delay

        spinner=$temp${spinner%"$temp"}

    done

    printf "xxxxxxxxxxxxxxx!\n"

    tput cnorm
}

