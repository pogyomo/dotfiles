local M = {}

---Get an array contains module names and
---return name-module paired table.
---If failed, return empty table.
---@param  names table
---@return table
function M.requires(names)
    if not type(names) == "table" then
        return {}
    end

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
    if not type(table) == "table" then
        return false
    else
        return next(table) == nil
    end
end

return M
