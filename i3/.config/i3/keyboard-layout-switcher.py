#!/usr/bin/env python3

import i3ipc
from xkbgroup import XKeyboard

CZ_LAYOUT = 0
US_LAYOUT = 1

cz_window_instances = [
    "Termite-weechat"
]

us_window_classes = [
    "krdc",
    "konsole",
    "Termite",
    "assistant", # Qt Assistant
]

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
    # print(focused.window_class)
    # print('Focused window %s is on workspace %s' % (focused.name, focused.workspace().name))

i3.on("window::focus", on_window_focus)

i3.main()
