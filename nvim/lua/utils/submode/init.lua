local utils = require("utils.submode.utils")

---@class Submode
---@field curr string
---@field info table<string, SubmodeInfo>
---@field maps table<string, SubmodeMapping[]>
---@field escp table<string, MappingRestoreInfo[]>
Submode = {
    curr = "",
    info = {},
    maps = {},
    escp = {},
}

---Create a new submode
---@param name string
---@param info SubmodeInfo
function Submode:create(name, info)
    self.info[name] = info

    vim.keymap.set(info.mode, info.enter, function() self:enter(name) end)
    vim.keymap.set(info.mode, info.leave, function() self:leave() end)

    local auname = "Submode_" .. name
    vim.api.nvim_create_augroup(auname, {})
    vim.api.nvim_create_autocmd("ModeChanged", {
        group = auname,
        pattern = "*",
        callback = function()
            self:leave()
        end,
    })
end

---Register keymap to the submode
---@param name string
---@param map SubmodeMapping
function Submode:register(name, map)
    self.maps[name] = self.maps[name] or {}
    map.opts = map.opts or {}
    table.insert(self.maps[name], map)
end

---Return current submode or nil
---@return string | nil
function Submode:mode()
    if self.curr == "" then
        return nil
    else
        return self.curr
    end
end

---@param name string submode name to enter
function Submode:enter(name)
    if self.curr ~= "" then
        return
    end

    self.escp[name] = {}
    for _, map in pairs(self.maps[name] or {}) do
        self.escp[name] = utils.save(self.info[name].mode, map.lhs, self.escp[name])
        vim.keymap.set(self.info[name].mode, map.lhs, map.rhs, map.opts)
    end
    self.curr = name
end

function Submode:leave()
    if self.curr == "" then
        return
    end

    for _, map in pairs(self.maps[self.curr] or {}) do
        vim.keymap.del(self.info[self.curr].mode, map.lhs)
    end
    utils.restore(self.escp[self.curr])
    self.curr = ""
end

return setmetatable({}, { __index = Submode })
