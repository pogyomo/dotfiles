local function setup()
    local util = require("utils.require")
    local mods = util.require("notify")
    if not mods then
        return
    end

    mods["notify"].setup{
        timeout = 1000,
        fps = 60,
        stages = "fade",
    }
    vim.notify = mods["notify"]
end

return setup
