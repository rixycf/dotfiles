
# 環境変数の設定
export ZPLUG_HOME=/usr/local/opt/zplug
export PATH=/usr/local/bin:$PATH
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export PATH=$PATH:$(go env GOPATH)/bin

source $ZPLUG_HOME/init.zsh
source /usr/local/etc/bash_completion.d/git-completion.bash
#source $HOME/.zshrc

# git の補完機能を有効にする
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -u

alias ls='ls -G'
alias gofmt='gofmt -w'
