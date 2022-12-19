---@alias SimpleModule string
---@alias AdvancedModule { [1]: string, as: string }

---Validate module, then extract module name and its alternative name.
---@param mod SimpleModule | AdvancedModule
---@return string # Name of module
---@return string # Alternative name of the module.
local function validate(mod)
    vim.validate{
        mod = { mod, { "string", "table" } }
    }

    if type(mod) == "string" then
        return mod, mod
    else
        assert(type(mod[1]) == "string", "First element must be string.")
        assert(mod.as, "'as' must be assigned.")
        return mod[1], mod.as or mod[1]
    end
end

local M = {}

---Improved require.
---Take a list of string or table.
---Table must contain module name and its alternative name.
---@param mods (SimpleModule | AdvancedModule)[]
---@return table<string, unknown> # Name-module pairs.
function M.requires(mods)
    vim.validate{
        mods = { mods, "table" }
    }

    local ret_mods = {}
    for _, mod in ipairs(mods) do
        local mod_name, alt_name = validate(mod)
        ret_mods[alt_name] = require(mod_name)
    end
    return ret_mods
end

return M
