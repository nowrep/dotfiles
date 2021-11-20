#!/bin/zsh

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

export OBS_USE_EGL=1
export MOZ_X11_EGL=1
export MOZ_ENABLE_WAYLAND=1

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland
export QSG_RENDER_LOOP=windows
export QT_WAYLAND_FORCE_DPI=115

# ssh-agent
export SSH_ASKPASS=/home/david/.ssh/askpass.sh
eval $(ssh-agent) > /dev/null

exec sway $@
# systemd-cat --identifier=sway sway $@
