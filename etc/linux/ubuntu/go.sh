#!/bin/bash

## install Go

## reference: https://golang.org/doc/install
## 2021/01/11 go version 1.15.6
install_go(){
    wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
    ## run as root user
    tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
    return $?
}

# install_zsh(){
#     sudo apt install -y zsh
#     return $?
# }
## add path
## export PATH=$PATH:/usr/local/go/bin

## check
## go version


