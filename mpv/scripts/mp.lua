---@meta

---@class mp
mp = {}

---@generic T
---@param table table
---@param def? T
---@return table | T
---@return string?
function mp.command_native(table, def) end

---@param table table
---@param fn fun(success: boolean, result: table?, error: string?)
---@return table
function mp.command_native_async(table, fn) end

---@generic T
---@param name string
---@param def? T
---@return any | T
---@return string?
function mp.get_property_native(name, def) end

---@param key string
---@param name string
---@param fn fun(event: mp.KeyEvent)
---@param flags? { repeatable?: boolean, complex?: boolean }
function mp.add_key_binding(key, name, fn, flags) end

---@param name string
---@param fn fun(event: mp.Event)
function mp.register_event(name, fn) end

---@param text string
---@param duration? number
function mp.osd_message(text, duration) end

---@class mp.KeyEvent
---@field event "down" | "repeat" | "up" | "press"
---@field is_mouse boolean
---@field canceled boolean
---@field key_name? string
---@field key_text? string

---@class mp.Event
---@field name string
---@field error? string

return mp
