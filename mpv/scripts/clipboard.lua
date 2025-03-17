local path = mp.command_native { "expand-path", "~/pictures/mpv.png" }
local mime = "image/png"

---@param args string[]
local function screenshot(args)
  return function()
    mp.command_native { "screenshot-to-file", path, unpack(args) }
    local cmd = { "run", "xclip", "-selection", "clipboard", "-target", mime, path }
    mp.command_native_async(cmd, function(success, _, err)
      local msg
      if success then
        msg = "copied to clipboard"
      else
        msg = err
      end
      mp.osd_message(msg)
    end)
  end
end

mp.add_key_binding("c", "screenshot-to-clipboard", screenshot {})
mp.add_key_binding("C", "screenshot-to-clipboard-video", screenshot { "video" })
mp.add_key_binding("Ctrl+c", "screenshot-to-clipboard-window", screenshot { "window" })
