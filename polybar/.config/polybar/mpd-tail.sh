#!/usr/bin/env bash

HOST="localhost"

_mpc() {
    mpc --host $HOST "$@"
}

playing_print() {
    s=`_mpc status`
    if echo "$s" | grep playing > /dev/null; then
        echo "$s" | head -1
    else
        echo ""
    fi
}

listen() {
    playing_print

    _mpc idleloop | while read -r event; do
        playing_print
    done
}

case "$1" in
    --play)
        _mpc play
        ;;
    --stop)
        _mpc stop
        ;;
    *)
        listen
        ;;
esac
