#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

export HWMON_CPU_PATH=$(echo /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp1_input)
export HWMON_GPU_PATH=$(echo /sys/class/drm/card1/device/hwmon/hwmon*/temp2_input)

# Launch main bar
polybar main &
