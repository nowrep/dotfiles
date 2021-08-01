#!/bin/bash

sock=/tmp/obs-control.sock

if [ ! -S "$sock" ]; then
    echo "OBS not running"
    exit 1
fi

case "$1" in
    replay-buffer)
        icon="/usr/share/icons/hicolor/256x256/apps/com.obsproject.Studio.png"
        id=$(notify-desktop -i "$icon" "Replay Buffer" "Saving...")
        reply=$(echo -n "replay-buffer" | nc -U -W 1 "$sock")
        if [ "$reply" = "replay-saved" ]; then
            file=$(ls ~/Videos/obs/Replay* | tail -1)
            file=$(basename "$file")
            notify-desktop -r "$id" -i "$icon" "Replay Buffer" "$file"
        else
            notify-desktop -r "$id" -i "$icon" "Replay Buffer" "Error: Not active"
        fi
        ;;
    *)
        echo "Invalid command ${1}"
        exit 1
        ;;
esac
