# プロンプトの設定
PROMPT='[%F{blue}%n%f] %# '

# キーバインドをemacs likeに
bindkey -e

# 環境変数の設定
# zplugのinitファイルを読み込む
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PATH=/sbin:/usr/sbin:/usr/local/bin:/Library/TeX/texbin:$PATH
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
alias cp='cp -i' # 上書きされる場合は警告
alias mv='mv -i'
alias gofmt='gofmt -w'
alias -g L='|less'
alias -g G='|grep'
alias -g P='|peco'

bindkey '^]' fzf-src
function fzf-src(){
    local src=$(ghq list --full-path | fzf-tmux --query="$LBUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi
    zle -R -c
}
zle -N fzf-src

#zplug
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'
if [[ -f $ZPLUG_HOME/init.zsh ]]; then
    zplug "zsh-users/zsh-history-substring-search"
    zplug "b4b4r07/enhancd", use:init.sh, at:v2.2.1
    zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
    zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
   
    if ! zplug check --verbose; then
        printf "Intall [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi
    zplug load --verbose
fi

# @mikiyaf
# pyenv setting
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
