#!/bin/bash

DEV=/sys/class/backlight/intel_backlight/brightness

if [ -z "$1" ]; then
    echo "Usage: $0 [increment]"
    exit 1
fi

VALUE=`cat $DEV`
VALUE=$(($VALUE + $1))

[ $VALUE -gt 4000 ] && VALUE=4000
[ $VALUE -lt 100 ] && VALUE=100

echo $VALUE > $DEV
