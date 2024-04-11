local mp = require 'mp'

local start = 0

local function set_start()
  start = mp.get_property_native("playback-time")
  mp.osd_message("opener time set to " .. start)
end

local function skip_opener()
  if start > 1 then
    mp.command_native { "seek", start, "absolute" }
  end
end

mp.add_key_binding("p", "set-start", set_start)
mp.register_event("file-loaded", skip_opener)
