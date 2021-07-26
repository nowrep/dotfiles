#!/bin/bash

sink_id=""
notify_id=100
icon_low="/usr/share/icons/breeze-dark/status/22/audio-volume-low.svg"
icon_medium="/usr/share/icons/breeze-dark/status/22/audio-volume-medium.svg"
icon_high="/usr/share/icons/breeze-dark/status/22/audio-volume-high.svg"
icon_muted="/usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg"

old_volume=-1
old_muted=false

find_sink() {
    sink_id=""
    while [ -z "$sink_id" ]; do
        sink_id=$(pactl list short sinks  | grep alsa_output.pci-0000_00_1f.3.analog-stereo | cut -f1)
        sleep 1
    done
}

volume_notify() {
    muted=$(pamixer --sink $sink_id --get-mute)
    if [ "$muted" = true ]; then
        if [ "$old_muted" != "$muted" ]; then
            notify-desktop -r $notify_id -i $icon_muted "Muted" > /dev/null
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
            notify-desktop -r $notify_id -i $icon "Volume $volume%" > /dev/null
        fi
        old_volume=$volume
    fi
    old_muted=$muted
}

recording_indicator() {
    muted=$(pamixer --default-source --get-mute)
    led=$(echo /sys/devices/pci0000:00/*/*/*/*/0003:FEED:980C.0005/input/input26/input26::scrolllock/brightness)
    if [ "$muted" = true ]; then
        $HOME/.config/sway/setled 0 $led
    else
        $HOME/.config/sway/setled 1 $led
    fi
}

recording_indicator

while true; do
    find_sink
    pactl subscribe | while read -r event; do
        evwhat=$(echo "$event" | cut -d' ' -f2 | tr -d "'")
        evtype=$(echo "$event" | cut -d' ' -f4)
        evnum=$(echo "$event" | cut -d'#' -f2)
        if [ "$evtype" = "sink" -a "$evnum" = "$sink_id" ]; then
            if [ "$evwhat" = "remove" ]; then
                find_sink
            elif [ "$evwhat" = "change" ]; then
                volume_notify
            fi
        elif [ "$evtype" = "source" -a "$evwhat" = "change" ]; then
            recording_indicator
        fi
    done
    sleep 5
done
