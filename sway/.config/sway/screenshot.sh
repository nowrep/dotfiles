#!/bin/bash

dir="$HOME/Pictures/screenshots"
name=$(date +"%Y-%m-%d_%H:%M:%S.png")
fullname="$dir/$name"

if [ "$1" = "window" ]; then
    /usr/share/sway/scripts/grimshot save active "$fullname"
elif [ "$1" = "area" ]; then
    out=$(/usr/share/sway/scripts/grimshot save area "$fullname")
    [ -z "$out" ] && exit
else
    /usr/share/sway/scripts/grimshot save output "$fullname"
fi

notify-send -i "$fullname" "Screenshot saved" "$name"
