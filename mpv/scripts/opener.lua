local start = 0

function set_start()
  start = mp.get_property_native("playback-time")
  mp.osd_message("opener time set to " .. start)
end

function skip_opener()
  if start > 1 then
    mp.command_native { "seek", start, "absolute" }
  end
end

mp.add_key_binding("p", "set-start", set_start)
mp.register_event("file-loaded", skip_opener)
