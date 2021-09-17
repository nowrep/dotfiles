#!/usr/bin/env python3

import i3ipc
import dbus

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
in_tv = False

ipc = i3ipc.Connection()
session_bus = dbus.SessionBus()

def on_window_focus(ipc, focused):
    focused_id = focused.container.app_id
    if focused_id is None: focused_id = focused.container.window_class
    if focused_id is None: return

    layout = CZ_LAYOUT
    if focused_id in us_window_ids:
        layout = US_LAYOUT

    global in_game
    if focused_id == "steam_app_FFXIV":
        in_game = True
        ipc.command("input {0} xkb_options 'altwin:swap_lalt_lwin,grp:sclk_toggle,numpad:mac'".format(KEYBOARD_ID))
    elif in_game:
        in_game = False
        ipc.command("input {0} xkb_options 'grp:sclk_toggle,numpad:mac'".format(KEYBOARD_ID))

    for input in ipc.get_inputs():
        if input.identifier == KEYBOARD_ID and input.xkb_active_layout_index != layout:
            ipc.command("input {0} xkb_switch_layout {1}".format(KEYBOARD_ID, layout))

    # print(focused_id)

def on_workspace_focus(ipc, workspace):
    global in_tv, dunst_properties
    if workspace.current.name == "11":
        in_tv = True
        proxy = session_bus.get_object("org.freedesktop.Notifications", "/org/freedesktop/Notifications")
        properties_manager = dbus.Interface(proxy, "org.freedesktop.DBus.Properties")
        properties_manager.Set("org.dunstproject.cmd0", "paused", True)
    elif in_tv:
        in_tv = False
        proxy = session_bus.get_object("org.freedesktop.Notifications", "/org/freedesktop/Notifications")
        properties_manager = dbus.Interface(proxy, "org.freedesktop.DBus.Properties")
        properties_manager.Set("org.dunstproject.cmd0", "paused", False)


ipc.on(i3ipc.Event.WINDOW_FOCUS, on_window_focus)
ipc.on(i3ipc.Event.WORKSPACE_FOCUS, on_workspace_focus)
ipc.main()
