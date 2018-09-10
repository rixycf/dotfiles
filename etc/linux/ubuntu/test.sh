#!/bin/bash
. ./utils.sh

(sleep 2) & spin $! "before" "after"

