# ~/.zprofile: executed by the command interpreter for login shells.

# PATH
export PATH=$PATH:~/Programming/bin

# Qt logging
c=`echo -e "\033"`
export QT_MESSAGE_PATTERN="%{appname}(%{pid})/(%{category}) ${c}[31m%{if-debug}${c}[34m%{endif}%{if-info}${c}[36m%{endif}%{function}${c}[0m: %{message}"
unset c

# Gtk3 accessibility
export NO_AT_BRIDGE=1

# WINE!
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# Firefox touchscreen
export MOZ_USE_XINPUT2=1

# i3
if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
    # PAM KWallet environment
    if test -n "$PAM_KWALLET5_LOGIN" ; then
        env | socat STDIN UNIX-CONNECT:$PAM_KWALLET5_LOGIN
    fi

    # Set display to dbus daemon (needed?)
    if test -n "$DISPLAY" ; then
        dbus-update-activation-environment --systemd DISPLAY
    fi

    # Language
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US
    export LC_MEASUREMENT=cs_CZ.UTF-8
    export LC_MONETARY=cs_CZ.UTF-8
    export LC_NUMERIC=cs_CZ.UTF-8
    export LC_TIME=cs_CZ.UTF-8
    export TZ=:/etc/localtime

    # Qt platform theme
    export QT_QPA_PLATFORMTHEME="qt5ct"

    # ssh-agent
    export SSH_ASKPASS=/usr/bin/ksshaskpass
    eval $(ssh-agent)
    ssh-add ~/.ssh/id_ed25519 ~/.ssh/id_rsa < /dev/null
fi
