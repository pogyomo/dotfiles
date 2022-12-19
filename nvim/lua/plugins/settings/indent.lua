local function setup()
    local util = require("utils.require")
    local mods = util.require("indent_blankline")
    if not mods then
        return
    end

    mods["indent_blankline"].setup()
end

return setup
