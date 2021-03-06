#!/usr/bin/env bash

# https://github.com/rob-a-bolton/emoji-rofi-menu

cd $(dirname $(readlink -f $0))

line=$(cat emoji-data | rofi -dmenu -i -p emoji)
if [ ! -z "$line" ]; then
    char=$(cut -f 1 -d' ' <<< "$line")
    xdotool key $(cut -f 2 <<< "$line")
    if command -v xsel >/dev/null; then
        echo -n "$char" | xsel -i -p
        echo -n "$char" | xsel -i -b
    elif command -v xclip >/dev/null; then
        echo -n "$char" | xsel -i -sel prim
        echo -n "$char" | xsel -i -sel clip
    fi
fi
