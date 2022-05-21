#!/bin/bash

sink_id=""
notify_id=-1
icon_low="/usr/share/icons/breeze-dark/status/22/audio-volume-low.svg"
icon_medium="/usr/share/icons/breeze-dark/status/22/audio-volume-medium.svg"
icon_high="/usr/share/icons/breeze-dark/status/22/audio-volume-high.svg"
icon_muted="/usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg"

old_volume=-1
old_muted=false

find_sink() {
    sink_id=""
    while [ -z "$sink_id" ]; do
        sink_id=$(pactl list short sinks  | grep alsa_output.pci-0000_0c_00.4.analog-stereo | cut -f1)
        sleep 1
    done
}

volume_notify() {
    muted=$(pactl get-sink-mute $sink_id)
    [ $? -ne 0 ] && return
    volume=$(pactl get-sink-volume $sink_id)
    [ $? -ne 0 ] && return
    muted=$(echo $muted | cut -d' ' -f2)
    volume=$(echo $volume | cut -d/ -f 2 | head -1 | sed 's/[^0-9]*//g')
    if [ "$muted" = "yes" ]; then
        if [ "$old_muted" != "$muted" ]; then
            notify_id=$(notify-desktop -r $notify_id -i $icon_muted "Muted")
            old_volume=-1
        fi
    else
        if [ "$old_volume" != "$volume" ]; then
            if [ "$volume" -lt 25 ]; then
                icon=$icon_low
            elif [ "$volume" -lt 75 ]; then
                icon=$icon_medium
            else
                icon=$icon_high
            fi
            notify_id=$(notify-desktop -r $notify_id -i $icon "Volume $volume%")
        fi
        old_volume=$volume
    fi
    old_muted=$muted
}

recording_indicator() {
    has_mic=$(pactl list sources short | grep -v .monitor)
    muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | cut -d' ' -f2)
    led=$(echo /sys/devices/pci0000:00/*/*/usb?/*/*/000?:FEED:980C.000?/input/input*/input*::scrolllock/brightness | cut -d' ' -f1)
    if [ -z "$has_mic" -o "$muted" = "yes" ]; then
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
