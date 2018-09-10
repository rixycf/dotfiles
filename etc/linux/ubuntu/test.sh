#!/bin/bash
. ./utils.sh

__output() {
    echo "hello"
    echo "world"
    sleep 10
}
# (sleep 2) & spin $! "before" "after"
__output > log.txt

