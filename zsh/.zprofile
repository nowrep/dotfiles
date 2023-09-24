# ~/.zprofile: executed by the command interpreter for login shells.

# PATH
export PATH=$PATH:~/Programming/bin:~/.local/bin

# Qt
c=`echo -e "\033"`
export QT_MESSAGE_PATTERN="[%{category}] ${c}[31m%{if-debug}${c}[34m%{endif}%{if-info}${c}[36m%{endif}%{function}${c}[0m: %{message}"
unset c
export QML_DISK_CACHE_PATH=~/.cache/qmlcache

# Gtk3 accessibility
export NO_AT_BRIDGE=1

# WINE!
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# AMD
export AMD_VULKAN_ICD=RADV
export MESA_DISK_CACHE_SINGLE_FILE=1
export RADV_PERFTEST=video_decode
export VKD3D_CONFIG=dxr,dxr11
# export AMD_DEBUG=useaco

# Language
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_MEASUREMENT=cs_CZ.UTF-8
export LC_MONETARY=cs_CZ.UTF-8
export LC_NUMERIC=C
export LC_TIME=cs_CZ.UTF-8
export TZ=:/etc/localtime

# GDB
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"
export DEBUGINFOD_CACHE_PATH=/tmp/debuginfod

# CC
export LDFLAGS="-fuse-ld=mold"
