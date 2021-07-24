#!/usr/bin/env bash

# https://github.com/rob-a-bolton/emoji-rofi-menu

cd $(dirname $(readlink -f $0))

line=$(cat emoji-data | rofi -dmenu -i -p emoji)
if [ ! -z "$line" ]; then
    char=$(cut -f 1 -d' ' <<< "$line")
    if [ "$XDG_SESSION_TYPE" = "x11" ]; then
        xdotool key $(cut -f 2 <<< "$line")
    elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        sleep 0.1
        wtype $char
        wl-copy $char
    fi
fi
