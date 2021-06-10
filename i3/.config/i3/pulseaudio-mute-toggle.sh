#!/bin/bash

muted=$(pamixer --default-source --get-mute)
if [ "$muted" = true ]; then
    to_mute=0
else
    to_mute=1
fi

for i in $(pactl list short sources | grep -v '.monitor' | cut -f1); do
    pactl set-source-mute $i $to_mute
done
