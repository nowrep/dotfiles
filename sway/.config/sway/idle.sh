#!/bin/bash

case "$1" in
    timeout)
        if [ "$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).output')" == "DP-1" ]; then
            chayang -d 30 && swaymsg 'output DP-1 power off'
        else
            swaymsg 'output DP-1 power off'
        fi
        ;;

    resume)
        if pgrep -f '.config/sway/idle.sh resume-wait' > /dev/null; then
            exit
        fi
        if [ "$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).output')" != "DP-1" ]; then
            ~/.config/sway/idle.sh resume-wait &
            exit
        fi
        swaymsg 'output DP-1 power on'
        ;;

    resume-wait)
        while [ "$(swaymsg -t subscribe '["workspace"]' | jq -r '.current.output')" != "DP-1" ]; do true; done
        swaymsg 'output DP-1 power on'
        ;;

    *)
        echo "Invalid command ${1}"
        exit 1
        ;;
esac
