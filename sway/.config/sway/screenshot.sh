#!/bin/bash

dir="$HOME/Pictures/screenshots"
name=$(date +"%Y-%m-%d_%H:%M:%S.png")
fullname="$dir/$name"
cursor=

if [ "$1" = "window" ]; then
    focused=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]?, .floating_nodes[]?) | select(.focused)')
    geom=$(echo "$focused" | jq -r '.rect | "\(.x),\(.y) \(.width)x\(.height)"')
elif [ "$1" = "area" ]; then
    geom=$(slurp -d)
    [ -z "$geom" ] && exit
else
    geom=""
    output=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' | jq -r '.name')
fi

if [ -n "$output" ]; then
    grim ${cursor:+-c} -o "$output" "$fullname"
elif [ -z "$geom" ]; then
    grim ${cursor:+-c} "$fullname"
else
    grim ${cursor:+-c} -g "$geom" "$fullname"
fi

notify-send -i "$fullname" "Screenshot saved" "$name"
