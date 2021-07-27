#!/bin/bash

# set +m
# shopt -s lastpipe

mkdir -p /tmp/clip
last_sum=/tmp/clip/sum

case "$1" in
    listen)
        exec wl-paste --type 'text/plain;charset=utf-8' --no-newline --watch "$0" write
        ;;
    write)
        IFS= read -rd '' text
        if [[ "$text" = *[![:space:]]* ]]; then
            sum="$(echo -n "$text" | md5sum)"
            if [[ "$sum" != "$(cat "$last_sum" 2>/dev/null)" ]]; then
                echo "$sum" > "$last_sum"
                echo -n "$text" | sed -e 's/\r//' | wl-copy --type 'text/plain;charset=utf-8'
            fi
        fi
        ;;
    *)
        echo "Invalid command ${1}"
        exit 1
        ;;
esac
