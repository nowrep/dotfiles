#!/usr/bin/env bash

sink_id=""
notify_id=100
icon_low="/usr/share/icons/breeze-dark/status/22/audio-volume-low.svg"
icon_medium="/usr/share/icons/breeze-dark/status/22/audio-volume-medium.svg"
icon_high="/usr/share/icons/breeze-dark/status/22/audio-volume-high.svg"
icon_muted="/usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg"

old_volume=-1
old_muted=false

volume_notify() {
    muted=$(pamixer --sink $sink_id --get-mute)
    if [ "$muted" = true ]; then
        if [ "$old_muted" != "$muted" ]; then
            notify-desktop -r $notify_id -i $icon_muted "Muted"
            old_volume=-1
        fi
    else
        volume=$(pamixer --sink $sink_id --get-volume)
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

recording_indicator() {
    muted=$(pamixer --default-source --get-mute)
    if [ "$muted" = true ]; then
        xset -led named "Scroll Lock"
    else
        xset led named "Scroll Lock"
    fi
}

recording_indicator

while true; do
    while [ -z "$sink_id" ]; do
        sink_id=$(pactl list short sinks  | grep alsa_output.pci-0000_00_1f.3.analog-stereo | cut -f1)
        sleep 1
    done
    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "on sink #${sink_id}"; then
            volume_notify
        elif echo "$event" | grep -q "on source #"; then
            recording_indicator
        fi
    done
    sink_id=""
    sleep 5
done
