#プロンプトの変更
PS1='\u:\W\$ '
#source /usr/loca/etc/bash_completion.d/git-prompt.sh
# git でコマンドの補完を行う
source /usr/local/etc/bash_completion.d/git-completion.bash
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/go_appengine
export PATH=$PATH:$HOME/google-cloud-sdk/bin

source $HOME/.bashrc

# Initialization for FDK command line tools.Sat Apr  7 10:47:33 2018
FDK_EXE="/Users/riki/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/riki/bin/FDK/Tools/osx"
export PATH
export FDK_EXE
