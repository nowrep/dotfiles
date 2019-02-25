#!/bin/bash
#
# https://gist.github.com/mildmojo/48e9025070a2ba40795c

XDEV1='Wacom ISDv4 E6 Finger'
XDEV2='Wacom ISDv4 E6 Pen Pen (0)'
XOUTPUT='LVDS-1'
LOCKFILE='/tmp/rotate-desktop.lock'

if [ -z "$1" ]; then
  echo "Usage: $0 [normal|inverted|left|right|cycle]"
  exit 1
fi

if [ -f "$LOCKFILE" ]; then
  exit 0
fi
touch "$LOCKFILE"

function do_rotate
{
  xrandr --output $1 --rotate $2

  TRANSFORM='Coordinate Transformation Matrix'

  case "$2" in
    normal)
      xinput set-prop "$XDEV1" "$TRANSFORM" 1 0 0 0 1 0 0 0 1
      xinput set-prop "$XDEV2" "$TRANSFORM" 1 0 0 0 1 0 0 0 1
      ;;
    inverted)
      xinput set-prop "$XDEV1" "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
      xinput set-prop "$XDEV2" "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
      ;;
    left)
      xinput set-prop "$XDEV1" "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
      xinput set-prop "$XDEV2" "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
      ;;
    right)
      xinput set-prop "$XDEV1" "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
      xinput set-prop "$XDEV2" "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
      ;;
  esac
}

if [ "$1" = "cycle" ]; then
  XROT=`xrandr --current | grep $XOUTPUT | cut -d\( -f1 | egrep -o '(normal|left|inverted|right)'`
  case "$XROT" in
    inverted)
      do_rotate $XOUTPUT left
      ;;
    left)
      do_rotate $XOUTPUT right
      ;;
    right)
      do_rotate $XOUTPUT normal
      ;;
    *)
      do_rotate $XOUTPUT inverted
      ;;
  esac
else
  do_rotate $XOUTPUT $1
fi

rm "$LOCKFILE"
