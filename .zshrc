#
#  ______     ______     __  __     ______     ______    
# /\___  \   /\  ___\   /\ \_\ \   /\  == \   /\  ___\   
# \/_/  /__  \ \___  \  \ \  __ \  \ \  __<   \ \ \____  
#   /\_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
#   \/_____/   \/_____/   \/_/\/_/   \/_/ /_/   \/_____/ 
#                                                        
#
# プロンプトの設定
PROMPT='[%F{blue}%n%f] %# '

# キーバインドをemacs likeに
bindkey -e

# alias ls='ls -G' # for macOS
alias ls='ls --color=auto' # for Linux
alias cp='cp -i' # 上書きされる場合は警告
alias mv='mv -i'

#
# export PATH=/sbin:/usr/sbin:/usr/local/bin:/Library/TeX/texbin:$PATH
# export GOROOT=$(go env GOROOT)
# export GOPATH=$(go env GOPATH)
# export PATH=$PATH:$(go env GOPATH)/bin

# git の補完機能を有効にする
# fpath=(~/.zsh/completion $fpath)
# autoload -U compinit
# compinit -u

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

## fzf binary: install from github-release
zinit ice lucid wait'0c' from"gh-r" as"command" 
zinit light junegunn/fzf

zinit ice lucid wait'0c' as"command" pick"bin/fzf-tmux"
zinit light junegunn/fzf

zinit light b4b4r07/enhancd

# @mikiyaf
# pyenv setting
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

