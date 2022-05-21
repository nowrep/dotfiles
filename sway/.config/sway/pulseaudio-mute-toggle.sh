#!/bin/bash

muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | cut -d' ' -f2)
if [ "$muted" = "yes" ]; then
    to_mute=0
else
    to_mute=1
fi

for i in $(pactl list short sources | grep -v '.monitor' | cut -f1); do
    pactl set-source-mute $i $to_mute
done
