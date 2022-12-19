---Require a module safely.
---@param name string
---@return unknown | nil
local function safely_require(name)
    local is_ok, mod = pcall(require, name)
    return is_ok and mod or nil
end

---Validate module and return module name and its alternative name.
---@param mod any Module to validate.
---@return string # Extracted module name.
---@return string # Extracted alternative name.
local function validate_module(mod)
    if type(mod) == "string" then
        return mod, mod
    elseif type(mod) == "table" then
        assert(type(mod[1]) == "string", "First element must be string.")
        return mod[1], mod.as or mod[1]
    else
        error("Module must be string or table.")
    end
end

local M = {}

---Load modules using these two type of elements.
---1. string - Write only the name of module.
---2. { string, as: string? } - Pair of module name and alternative name.
---This only fail if structure of elements is invalid.
---Example:
---  require("utils.require").require{
---    { "name-of-module", as = "alt-name" },
---    "another-module-name"
---  }
---@param mods string | table
---@return table? # Name-module pairs, or nil if failed to load some modules.
function M.require(mods)
    vim.validate{
        mods = { mods, { "string", "table" } }
    }
    mods = type(mods) == "table" and mods or { mods }

    local ret_mods = {}
    local mod_name, alt_name
    for _, mod in ipairs(mods) do
        mod_name, alt_name = validate_module(mod)
        ret_mods[alt_name] = safely_require(mod_name)
        if not ret_mods[alt_name] then
            return nil
        end
    end
    return ret_mods
end

return M
