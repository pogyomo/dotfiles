local function setup()
    local util = require("utils")
    local mods = util.requires("todo-comments")
    mods["todo-comments"].setup()
end

return setup
