local function setup()
    local util = require("utils.require")
    local mods = util.require("todo-comments")
    if not mods then
        return
    end

    mods["todo-comments"].setup{
        keywords = {
            REVIEW  = { icon = " ", color = "info" },
            CHANGED = { icon = " ", color = "hint" },
        }
    }
end

return setup
