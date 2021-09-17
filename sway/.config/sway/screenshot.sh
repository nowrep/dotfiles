#!/bin/bash

dir="$HOME/Pictures/screenshots"
name=$(date +"%Y-%m-%d_%H:%M:%S.png")
fullname="$dir/$name"

if [ "$1" = "window" ]; then
    /usr/share/sway/scripts/grimshot save active "$fullname"
else
    /usr/share/sway/scripts/grimshot save output "$fullname"
fi

notify-send -i "$fullname" "Screenshot saved" "$name"
