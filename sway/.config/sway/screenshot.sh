#!/bin/bash

dir="$HOME/Pictures/screenshots"
name=$(date +"%Y-%m-%d_%H:%M:%S.png")
fullname="$dir/$name"

if [ "$1" = "window" ]; then
    geometry=$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')
    grim -g "$geometry" "$fullname"
else
    grim "$fullname"
fi

notify-send -i "$fullname" "Screenshot saved" "$name"
