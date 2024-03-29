#!/bin/zsh

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_FORCE_DPI=115
export QT_SCALE_FACTOR_ROUNDING_POLICY=Round
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1

# ssh-agent
export SSH_ASKPASS=/home/david/.ssh/askpass.sh
eval $(ssh-agent) > /dev/null

exec sway $@
# systemd-cat --identifier=sway sway $@
