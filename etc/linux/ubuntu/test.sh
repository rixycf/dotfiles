#!/bin/bash

. ./utils.sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

__output() {
    echo "world"|| return 1
    false || return 1
    true || return 1
}

__tester() {
    sleep 5
}

# __output || { error "out put error"; false ;}
# echo $?
FULLPATH=$SCRIPT_DIR/$(basename $0)
# ls $SCRIPT_DIR
echo $0

for f in $(find $SCRIPT_DIR -type f -name "*.sh"); do
    if [ $f = $FULLPATH ]; then
        continue
    fi
    echo $f
done

# __tester & 
# pid=$!
# echo "hello"
#
#
# wait "$pid"
# echo $?

