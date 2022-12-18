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

return M
