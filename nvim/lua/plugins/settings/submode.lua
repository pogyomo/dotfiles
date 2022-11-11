local function setup()
    local util = require("utils")
    local mods = util.requires("submode")
    if util.is_empty(mods) then
        return
    end

    mods["submode"]:setup{
        leave_when_mode_changed = false,
    }
end

return setup
