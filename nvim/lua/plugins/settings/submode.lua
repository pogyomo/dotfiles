local function setup()
    local mod = require("utils.modules")
    local is_ok, mods = pcall(mod.requires, {
        "submode"
    })
    if not is_ok then
        return
    end

    mods["submode"]:setup()
end

return setup
