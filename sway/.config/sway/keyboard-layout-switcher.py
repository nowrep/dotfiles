#!/usr/bin/env python3

import i3ipc

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

def on_window_focus(ipc, focused):
    focused_id = focused.container.app_id
    if focused_id is None: focused_id = focused.container.window_class
    if focused_id is None: return

    layout = CZ_LAYOUT
    if focused_id in us_window_ids:
        layout = US_LAYOUT

    for input in ipc.get_inputs():
        if input.identifier == KEYBOARD_ID and input.xkb_active_layout_index != layout:
            ipc.command("input {0} xkb_switch_layout {1}".format(KEYBOARD_ID, layout))

    global in_game
    if focused_id == "steam_app_FFXIV":
        in_game = True
        ipc.command("input {0} xkb_options 'altwin:swap_lalt_lwin,grp:sclk_toggle,numpad:mac'".format(KEYBOARD_ID))
    elif in_game:
        in_game = False
        ipc.command("input {0} xkb_options 'grp:sclk_toggle,numpad:mac'".format(KEYBOARD_ID))

    # print(focused_id)


ipc.on("window::focus", on_window_focus)
ipc.main()
