#!/usr/bin/env bash

function handle_error() {
    ret_code=$1
    if [ "$ret_code" -ne 0 ] ; then
        echo "Critical error. Existing."
        cd $ROOT_PATH
        exit $ret_code
    fi
}

echo "togetherjs:build:start"

git pull --rebase
handle_error $?

yarn install
handle_error $?

yarn run build
handle_error $?

echo "togetherjs:build:done"
