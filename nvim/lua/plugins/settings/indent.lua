local function setup()
    local mod = require("utils.modules")
    local is_ok, mods = pcall(mod.require, {
        "indent_blankline"
    })
    if not is_ok then
        return
    end

    mods["indent_blankline"].setup()
end

return setup
