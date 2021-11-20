#!/usr/bin/env python3

import i3ipc
import subprocess
import os
import signal

CZ_LAYOUT = 1
US_LAYOUT = 0
KEYBOARD_ID = "65261:38924:TMK._FC980C_Alt_Controller"

us_window_ids = [
    "org.kde.krdc",
    "Alacritty",
    "foot",
    "assistant", # Qt Assistant
]

in_game = False

ipc = i3ipc.Connection()

def altmeta_switch(enable):
    try:
        pid = subprocess.check_output(["pidof", "altmeta_switch"])
        os.kill(int(pid), enable and signal.SIGUSR2 or signal.SIGUSR1)
    except:
        return

def on_window_focus(ipc, focused):
    focused_id = focused.container.app_id
    if focused_id is None: focused_id = focused.container.window_class
    if focused_id is None: return

    global in_game

    layout = CZ_LAYOUT
    if focused_id in us_window_ids:
        layout = US_LAYOUT

    if focused_id == "steam_app_FFXIV":
        in_game = True
        altmeta_switch(True)
    elif in_game:
        in_game = False
        altmeta_switch(False)

    for input in ipc.get_inputs():
        if input.identifier == KEYBOARD_ID and input.xkb_active_layout_index != layout:
            ipc.command("input {0} xkb_switch_layout {1}".format(KEYBOARD_ID, layout))

    # print(focused_id)


ipc.on(i3ipc.Event.WINDOW_FOCUS, on_window_focus)
ipc.main()
