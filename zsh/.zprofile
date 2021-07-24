# ~/.zprofile: executed by the command interpreter for login shells.

# PATH
export PATH=$PATH:~/Programming/bin:~/.gem/ruby/2.6.0/bin

# Qt logging
c=`echo -e "\033"`
export QT_MESSAGE_PATTERN="%{appname}(%{pid})/(%{category}) ${c}[31m%{if-debug}${c}[34m%{endif}%{if-info}${c}[36m%{endif}%{function}${c}[0m: %{message}"
unset c

# Gtk3 accessibility
export NO_AT_BRIDGE=1

# WINE!
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# i3/sway
if [ "$XDG_CURRENT_DESKTOP" = "i3" -o "$XDG_SESSION_TYPE" = "wayland" ]; then
    # Language
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US
    export LC_MEASUREMENT=cs_CZ.UTF-8
    export LC_MONETARY=cs_CZ.UTF-8
    export LC_NUMERIC=cs_CZ.UTF-8
    export LC_TIME=cs_CZ.UTF-8
    export TZ=/etc/localtime

    # Qt platform theme
    export QT_QPA_PLATFORMTHEME="qt5ct"

    export OBS_USE_EGL=1
    export MOZ_X11_EGL=1

    # ssh-agent
    export SSH_ASKPASS=/home/david/.ssh/askpass.sh
    eval $(ssh-agent)
    # ssh-add ~/.ssh/id_ed25519 ~/.ssh/id_rsa < /dev/null
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export QT_QPA_PLATFORM=wayland
    export QSG_RENDER_LOOP=windows
    export QT_WAYLAND_FORCE_DPI=115

    export MOZ_ENABLE_WAYLAND=1
fi
