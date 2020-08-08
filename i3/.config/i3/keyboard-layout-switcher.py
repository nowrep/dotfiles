#!/usr/bin/env python3

import i3ipc
import subprocess
from xkbgroup import XKeyboard

CZ_LAYOUT = 0
US_LAYOUT = 1

cz_window_instances = [
    "Alacritty-weechat",
]

us_window_classes = [
    "krdc",
    "Alacritty",
    "assistant", # Qt Assistant
]

in_wow = False

i3 = i3ipc.Connection()
xkb = XKeyboard()

def on_window_focus(i3, e):
    focused = i3.get_tree().find_focused()
    if focused.window_instance in cz_window_instances:
        xkb.group_num = CZ_LAYOUT
    elif focused.window_class in us_window_classes:
        xkb.group_num = US_LAYOUT
    else:
        xkb.group_num = CZ_LAYOUT

    global in_wow
    if focused.window_instance == "wow.exe" or focused.window_instance == "wowclassic.exe" or focused.window_instance == "ffxiv_dx11.exe":
        in_wow = True
        subprocess.run(["setxkbmap", "-option", "altwin:swap_lalt_lwin"])
    elif in_wow:
        in_wow = False
        subprocess.run(["setxkbmap", "-option"])
    # print(focused.window_class)
    # print(focused.window_instance)
    # print('Focused window %s is on workspace %s' % (focused.name, focused.workspace().name))

i3.on("window::focus", on_window_focus)

i3.main()
