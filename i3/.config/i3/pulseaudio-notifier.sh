#!/usr/bin/env bash

sink=0
notify_id=100
icon_low="/usr/share/icons/breeze-dark/status/22/audio-volume-low.svg"
icon_medium="/usr/share/icons/breeze-dark/status/22/audio-volume-medium.svg"
icon_high="/usr/share/icons/breeze-dark/status/22/audio-volume-high.svg"
icon_muted="/usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg"

old_volume=-1
old_muted=false

volume_notify() {
    muted=$(pamixer --sink $sink --get-mute)
    if [ "$muted" = true ]; then
        if [ "$old_muted" != "$muted" ]; then
            notify-desktop -r $notify_id -i $icon_muted "Muted"
            old_volume=-1
        fi
    else
        volume=$(pamixer --sink $sink --get-volume)
        if [ "$old_volume" != "$volume" ]; then
            if [ "$volume" -lt 25 ]; then
                icon=$icon_low
            elif [ "$volume" -lt 75 ]; then
                icon=$icon_medium
            else
                icon=$icon_high
            fi
            notify-desktop -r $notify_id -i $icon "Volume $volume%"
        fi
        old_volume=$volume
    fi
    old_muted=$muted
}

pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "on sink #$sink"; then
        volume_notify
    fi
done
