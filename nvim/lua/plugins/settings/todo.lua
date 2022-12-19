local function setup()
    local mod = require("utils.modules")
    local is_ok, mods = pcall(mod.requires, {
        "todo-comments"
    })
    if not is_ok then
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
