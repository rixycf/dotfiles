# プロンプトの設定
PROMPT='[%n] %# '
# キーバインドをemacs likeに
bindkey -e

# 環境変数の設定
# zplugのinitディレクトリを読み込む
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PATH=/sbin:/usr/local/bin:$PATH
export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

#source /usr/local/etc/bash_completion.d/git-completion.bash
#source $HOME/.zshrc

# git の補完機能を有効にする
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -u

# alias
alias ls='ls -G'
alias gofmt='gofmt -w'
alias -g L='|less'
alias -g G='|grep'
alias -g P='|peco'

bindkey '^]' peco-src
function peco-src(){
    local src=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi
    zle -R -c
}
zle -N peco-src

#zplug
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'
if [[ -f $ZPLUG_HOME/init.zsh ]]; then
    zplug "zsh-users/zsh-history-substring-search"
    zplug "b4b4r07/enhancd", use:init.sh
    #zplug "b4b4r07/zsh-vimode-visual"
   
    if ! zplug check --verbose; then
        printf "Intall [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi
    zplug load --verbose
fi
