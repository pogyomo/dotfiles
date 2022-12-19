local function setup()
    local util = require("utils.require")
    local mods = util.require("submode")
    if not mods then
        return
    end

    mods["submode"]:setup()
end

return setup
