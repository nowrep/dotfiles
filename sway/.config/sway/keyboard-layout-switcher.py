#!/usr/bin/env python3

import i3ipc
import time

CZ_LAYOUT = 1
US_LAYOUT = 0
KEYBOARD_ID = "65261:38924:TMK._FC980C_Alt_Controller"

cz_window_instances = [
    "foot-weechat",
]

us_window_classes = [
    "org.kde.krdc",
    "Alacritty",
    "foot",
    "assistant", # Qt Assistant
]

in_game = False

ipc = i3ipc.Connection()

def on_window_focus(ipc, focused):
    focused_id = focused.container.app_id
    if focused_id is None: focused_id = focused.container.window_class
    if focused_id is None: return

    layout = CZ_LAYOUT
    if focused_id in cz_window_instances:
        layout = CZ_LAYOUT
    elif focused_id in us_window_classes:
        layout = US_LAYOUT

    for input in ipc.get_inputs():
        if input.identifier == KEYBOARD_ID and input.xkb_active_layout_index != layout:
            ipc.command("input {0} xkb_switch_layout {1}".format(KEYBOARD_ID, layout))

    global in_game
    if focused_id == "steam_app_FFXIV" or focused_id == "ffxiv_dx11.exe":
        in_game = True
        ipc.command("input {0} xkb_options 'altwin:swap_lalt_lwin,grp:sclk_toggle,numpad:mac'".format(KEYBOARD_ID))
        ipc.command("input {0} xkb_switch_layout {1}".format(KEYBOARD_ID, layout))
    elif in_game:
        in_game = False
        ipc.command("input {0} xkb_options 'grp:sclk_toggle,numpad:mac'".format(KEYBOARD_ID))
        ipc.command("input {0} xkb_switch_layout {1}".format(KEYBOARD_ID, layout))

    # print(focused.window_class)
    # print('Focused window %s is on workspace %s' % (focused.name, focused.workspace().name))

ipc.on("window::focus", on_window_focus)
ipc.main()
