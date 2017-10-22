#プロンプトの変更
PS1='\u:\W\$ '
#source /usr/loca/etc/bash_completion.d/git-prompt.sh
# git でコマンドの補完を行う
source /usr/local/etc/bash_completion.d/git-completion.bash

alias ls="ls -G"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/google-cloud-sdk/bin

