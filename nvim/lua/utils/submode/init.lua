local utils = require("utils.submode.utils")

---@class Submode
---@field curr string
---@field info table<string, SubmodeInfo>
---@field maps table<string, SubmodeMapping[]>
---@field escp table<string, MappingRestoreInfo[]>
---@field names_to_leave_with table<string, table<string, boolean | nil>> Names that have a same keys to leave
Submode = {
    curr = "",
    info = {},
    maps = {},
    escp = {},
    names_to_leave_with = {}
}

---Create a new submode
---@param name string
---@param info SubmodeInfo
function Submode:create(name, info)
    self.info[name] = info
    self.names_to_leave_with[info.leave] = self.names_to_leave_with[info.leave] or {}
    self.names_to_leave_with[info.leave][name] = true

    vim.keymap.set(info.mode, info.enter, function() self:enter(name) end)
    vim.keymap.set(info.mode, info.leave, function() self:leave(info.leave) end)

    local auname = "Submode_" .. name
    vim.api.nvim_create_augroup(auname, {})
    vim.api.nvim_create_autocmd("ModeChanged", {
        group = auname,
        pattern = "*",
        callback = function()
            self:leave(info.leave)
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

    self.escp[name] = self.escp[name] or {}
    for _, map in pairs(self.maps[name]) do
        self.escp[name] = utils.save(self.info[name].mode, map.lhs, self.escp[name])
        vim.keymap.set(self.info[name].mode, map.lhs, map.rhs, map.opts)
    end
    self.curr = name
end

---@param leave string keys to leave the submode
function Submode:leave(leave)
    if self.names_to_leave_with[leave][self.curr] then
        for _, map in pairs(self.maps[self.curr]) do
            vim.keymap.del(self.info[self.curr].mode, map.lhs)
        end
        utils.restore(self.escp[self.curr])
        self.curr = ""
    end
end

return setmetatable({}, { __index = Submode })
