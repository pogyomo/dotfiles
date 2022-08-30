local M = {}

---Add current mapping to given array and return it
---@param mode string
---@param name string
---@param dicts MappingRestoreInfo[]
---@return MappingRestoreInfo[]
function M.save(mode, name, dicts)
    local dict = vim.fn.maparg(name, mode, false, true)
    if next(dict) ~= nil then
        table.insert(dicts, { mode = mode, dict = dict })
    end
    return dicts
end

---Restore previous mapping using given array
---@param dicts MappingRestoreInfo[]
function M.restore(dicts)
    for _, info in pairs(dicts) do
        vim.fn.mapset(info.mode, false, info.dict)
    end
end

return M
