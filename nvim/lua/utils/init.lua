local M = {}

---Take value-function paired table and return its return value.
---If there is no associated function, return default.
---@generic T
---@generic U
---@param value T
---@param default U
---@param table table<T, fun(): U>
---@return U
function M.match(value, default, table)
    local func = table[value]
    return func and func() or default -- func ? func() : default
end

---Take an array or a string that contains module names and
---return name-module paired table.
---If failed, return empty table.
---@param  names string[] | string
---@return table<string, unknown>
function M.requires(names)
    names = M.match(type(names), {}, {
        ["string"] = function()
            return { names }
        end,
        ["table"] = function()
            return names
        end
    })

    local ret = {}
    for _, name in ipairs(names) do
        local is_ok, mod = pcall(require, name)
        if not is_ok then
            return {}
        else
            ret[name] = mod
        end
    end

    return ret
end

---If given table is empty, return true
---Otherwise, return false
---@param  table table
---@return boolean
function M.is_empty(table)
    if type(table) == "table" then
        return next(table) == nil
    else
        return false
    end
end

---Resize arbitarily thisngs that is represented by number or integer using easing function.
---@param fps  integer Fps of this resize.
---@param span integer How long dose it take to resize, or 0 for immediate change. Unit is milliseconds.
---@param diff number  How much to resize.
---@param getter fun(): number  Function to get target's value.
---@param setter fun(v: number) Function to set value to target.
---@param easing fun(t: number): number Easing function that will be used while resizing.
---@param after? fun()  Function that will be called after resize done.
function M.resize(diff, fps, span, getter, setter, easing, after)
    if span == 0 then
        setter(getter() + diff)
        return
    end

    local interval = 1000 / fps
    local original = getter()
    local counter  = 0
    local counter_diff = 1000 / (span * fps)
    local timer    = vim.loop.new_timer()
    timer:start(0, interval, vim.schedule_wrap(function()
        if timer:is_closing() then
            return
        end

        if counter <= 1 then
            setter(original + diff * easing(counter))
            counter = counter + counter_diff
        else
            timer:stop()
            timer:close(vim.schedule_wrap(after and after or function() end))
        end
    end))
end

return M
