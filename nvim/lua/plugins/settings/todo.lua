local function setup()
    local util = require("utils")
    local mods = util.requires("todo-comments")
    mods["todo-comments"].setup{
        keywords = {
            REVIEW  = { icon = " ", color = "info" },
            CHANGED = { icon = " ", color = "hint" },
        }
    }
end

return setup
