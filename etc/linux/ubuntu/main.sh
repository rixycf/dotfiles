#!/bin/sh

declare -r SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo "$SCRIPT_DIR"
## sudo -v は次のパスワードを尋ねるまでの残り時間をデフォルトの時間に戻す．
## デフォルトは5分． 詳しくはsudoersファイルに設定がある
# sudo -v 

## 60秒ごとにsudo -n trueを実行することで，パスワードの再要求の時間を伸ばしている．
## この処理は親プロセス(main.sh)が最後まで実行されるまで，バックグラウンドでループする

# while true; do echo "test"; sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>dev/null &
#
# sudo apt update
# sudo apt upgrade
#
#
# sudo -K
