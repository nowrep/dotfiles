#!/usr/bin/env bash

xset r rate 200 20
setxkbmap -layout cz,us -option caps:ctrl_modifier,grp:sclk_toggle,altwin:swap_alt_win
feh --no-fehbg --bg-fill ~/Pictures/wallpaper.png

touchpad=`xinput list --name-only | grep TouchPad`
xinput disable "$touchpad"
