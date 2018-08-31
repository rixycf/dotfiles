#!/bin/sh

install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

}

main() {
    install_homebrew
    brew doctor
    brew update
    brew upgrade --all
}

main
