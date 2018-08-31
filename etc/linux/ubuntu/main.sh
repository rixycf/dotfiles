#!/bin/sh

sudo -v &> /dev/null

while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done &> /dev/null &

sudo apt update
sudo apt upgrade


