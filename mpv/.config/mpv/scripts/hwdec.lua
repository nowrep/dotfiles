-- hwdec.lua -- Enable hwdec for high-res videos in mpv.

if mp.get_property_bool("option-info/hwdec/set-from-commandline") == true then
    return
end

function update_hwdec(event)
    if mp.get_property("options/hwdec") == "vaapi" then
        return
    end

    if mp.get_property_number("video-params/h") and mp.get_property_number("video-params/h") > 700 then
        mp.msg.info("High resolution video, reloading with VAAPI hwdec.")
        mp.set_property("options/hwdec", "vaapi")
        mp.command("loadfile \"" .. mp.get_property("path") .. "\"")
    end
end

mp.register_event("playback-restart", update_hwdec)
