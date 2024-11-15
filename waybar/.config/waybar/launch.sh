#!/usr/bin/env sh

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

mkdir -p /tmp/waybar
ln -sf /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon?/temp1_input /tmp/waybar/cpu_temp
ln -sf /sys/devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/hwmon/hwmon?/temp2_input /tmp/waybar/gpu_temp

# Launch main bar
waybar &
