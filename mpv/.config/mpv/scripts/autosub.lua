-- requires subliminal, version 1.0 or newer
-- default keybinding: b
-- add the following to your input.conf to change the default keybinding:
-- keyname script_binding auto_load_subs
local utils = require 'mp.utils'
function load_sub_fn()
    subl = os.getenv("HOME") .. "/.config/mpv/OpenSubtitlesDownload.py"
    mp.msg.info("Searching subtitle")
    mp.osd_message("Searching subtitle")
    t = {}
    t.args = {subl, "-l", "eng", mp.get_property("path")}
    res = utils.subprocess(t)
    if res.status == 0 and not string.find(res.stdout, "No synchronized subtitles found for this video") then
        mp.commandv("rescan_external_files", "reselect")
        mp.msg.info("Subtitle download succeeded")
        mp.osd_message("Subtitle download succeeded")
    else
        mp.msg.warn("Subtitle download failed")
        mp.osd_message("Subtitle download failed")
    end
end

mp.add_key_binding("s", "auto_load_subs", load_sub_fn)
