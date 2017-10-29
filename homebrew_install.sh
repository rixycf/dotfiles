#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

brew update

brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    lua
    "vim --with-lua"
    peco
    ghq
    tmux
    cask
    reattach-to-user-namespace
    openssl
)

for formula in "$(formulas[@])"; do
    brew install $formula || brew upgrade $formula
done
