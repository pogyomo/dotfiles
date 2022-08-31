local function setup()
    local util = require("utils")
    local mods = util.requires("indent_blankline")
    if util.is_empty(mods) then
        return
    end

    mods["indent_blankline"].setup()
end

return setup