-- notify.lua -- Desktop notifications for mpv.
-- Just put this file into your ~/.mpv/lua folder and mpv will find it.
--
-- Copyright (c) 2014 Roland Hieber
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-------------------------------------------------------------------------------
-- helper functions
-------------------------------------------------------------------------------

function print_debug(s)
	-- print("DEBUG: " .. s) -- comment out for no debug info
	return true
end

-- url-escape a string, per RFC 2396, Section 2
function string.urlescape(str)
	s, c = string.gsub(str, "([^A-Za-z0-9_.!~*'()/-])",
		function(c)
			return ("%%%02x"):format(c:byte())
		end)
	return s;
end

-- escape string for html
function string.htmlescape(str)
	str = string.gsub(str, "<", "&lt;")
	str = string.gsub(str, ">", "&gt;")
	str = string.gsub(str, "&", "&amp;")
	str = string.gsub(str, "\"", "&quot;")
	str = string.gsub(str, "'", "&apos;")
	return str
end

-- escape string for shell inclusion
function string.shellescape(str)
	return "'"..string.gsub(str, "'", "'\"'\"'").."'"
end

-- converts string to a valid filename on most (modern) filesystems
function string.safe_filename(str)
	s, c = string.gsub(str, "([^A-Za-z0-9_.-])",
		function(c)
			return ("%02x"):format(c:byte())
		end)
	return s;
end

-------------------------------------------------------------------------------
-- here we go.
-------------------------------------------------------------------------------

local CACHE_DIR = os.getenv("XDG_CACHE_HOME")
CACHE_DIR = CACHE_DIR or os.getenv("HOME").."/.cache"
CACHE_DIR = CACHE_DIR.."/mpv/coverart"
print_debug("making " .. CACHE_DIR)
os.execute("mkdir -p -- " .. string.shellescape(CACHE_DIR))

function tmpname()
	return "/tmp/mpv-coverart." .. math.random(0,0xffffff)
end

-- scale an image file
-- @return boolean of success
function scale_image(src, dst)
	convert_cmd = ("convert -scale x64 -- %s %s"):format(
		string.shellescape(src), string.shellescape(dst))
	print_debug("executing " .. convert_cmd)
	if os.execute(convert_cmd) then
		return true
	end
	return false
end

-- look for a list of possible cover art images in the same folder as the file
-- @param absolute filename name of currently played file, or nil if no match
function get_folder_cover_art(filename)
	if not filename or string.len(filename) < 1 then
		return nil
	end

	print_debug("get_folder_cover_art: filename is " .. filename)

	cover_extensions = { "png", "jpg", "jpeg", "gif" }
	cover_names = { "cover", "folder", "front", "back", "insert" }

	path = string.match(filename, "^(.*/)[^/]+$")

	for k,name in pairs(cover_names) do
		for k,ext in pairs(cover_extensions) do
			morenames = { name, string.upper(name),
				string.upper(string.sub(name, 1, 1)) .. string.sub(name, 2, -1) }
			moreexts = { ext, string.upper(ext) }
			for k,name in pairs(morenames) do
				for k,ext in pairs(moreexts) do
					fn = path .. name .. "." .. ext
					--print_debug("get_folder_cover_art: trying " .. fn)
					f = io.open(fn, "r")
					if f then
						f:close()
						print_debug("get_folder_cover_art: match at " .. fn)
						return fn
					end
				end
			end
		end
	end
	return nil
end

function notify_current_track()
	data = mp.get_property_native("metadata")

	function get_metadata(data, keys)
		for k,v in pairs(keys) do
			if data[v] and string.len(data[v]) > 0 then
				return data[v]
			end
		end
		return ""
	end
	-- srsly MPV, why do we have to do this? :-(
	artist = get_metadata(data, {"artist", "ARTIST"})
	album = get_metadata(data, {"album", "ALBUM"})
	title = get_metadata(data, {"title", "TITLE"})

	print_debug("notify_current_track: relevant metadata:")
	print_debug("artist: " .. artist)
	print_debug("album: " .. album)

	summary = ""
	body = ""
	params = ""
	scaled_image = ""
	delete_scaled_image = false

	-- first try finding local cover art
	abs_filename = os.getenv("PWD") .. "/" .. mp.get_property_native("path")
	cover_image = get_folder_cover_art(abs_filename)
	if cover_image and cover_image ~= "" then
		scaled_image = tmpname()
		scale_image(cover_image, scaled_image)
		delete_scaled_image = true
	end

	if scaled_image and string.len(scaled_image) > 1  then
		print("found cover art in " .. cover_image)
		params = " -i " .. string.shellescape(scaled_image)
    else
        params = " -i mpv"
    end

	if(artist == "") then
		summary = string.shellescape("Now playing:")
	else
		summary = string.shellescape(string.htmlescape(artist))
	end
	if title == "" then
		body = string.shellescape(mp.get_property_native("filename"))
	else
		if album == "" then
			body = string.shellescape(string.htmlescape(title))
		else
			body = string.shellescape(("%s<br/><i>%s</i>"):format(
				string.htmlescape(title), string.htmlescape(album)))
		end
	end

	command = ("notify-desktop -a mpv %s -- %s %s > /dev/null"):format(params, summary, body)
	print_debug("command: " .. command)
	os.execute(command)

	if delete_scaled_image and not os.remove(scaled_image) then
		print("could not remove" .. scaled_image .. ", please remove it manually")
	end
end


-- insert main() here

mp.register_event("file-loaded", notify_current_track)
