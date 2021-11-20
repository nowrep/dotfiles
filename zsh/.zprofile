# ~/.zprofile: executed by the command interpreter for login shells.

# PATH
export PATH=$PATH:~/Programming/bin:~/.gem/ruby/2.6.0/bin

# Qt
c=`echo -e "\033"`
export QT_MESSAGE_PATTERN="%{appname}(%{pid})/(%{category}) ${c}[31m%{if-debug}${c}[34m%{endif}%{if-info}${c}[36m%{endif}%{function}${c}[0m: %{message}"
unset c
export QML_DISK_CACHE_PATH=~/.cache/qmlcache

# Gtk3 accessibility
export NO_AT_BRIDGE=1

# WINE!
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# AMD
export AMD_VULKAN_ICD=RADV
export radeonsi_enable_sam=true
export RADV_PERFTEST=sam
export MESA_VK_IGNORE_CONFORMANCE_WARNING=1
export MESA_DISK_CACHE_SINGLE_FILE=1

# Language
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_MEASUREMENT=cs_CZ.UTF-8
export LC_MONETARY=cs_CZ.UTF-8
export LC_NUMERIC=cs_CZ.UTF-8
export LC_TIME=cs_CZ.UTF-8
export TZ=/etc/localtime
