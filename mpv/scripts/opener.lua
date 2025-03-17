local intro = 0

local function set_intro()
  intro = mp.get_property_native("playback-time")
  mp.osd_message("intro time set to " .. intro)
end

local function skip_intro()
  if intro > 1 then
    mp.command_native { "seek", intro, "absolute" }
  end
end

mp.add_key_binding("p", "set-intro", set_intro)
mp.register_event("file-loaded", skip_intro)

local function skip_op_ed()
  -- OP/ED are normally 1:30
  local len = 90
  if mp.get_property_native("duration") < 15 * 60 then
    -- half-length are 1:00 instead
    len = 60
  end
  mp.command_native { "seek", len - 5, "exact" }
end

mp.add_key_binding("e", "skip-op-ed", skip_op_ed)
