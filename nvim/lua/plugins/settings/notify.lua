local function setup()
    local mod = require("utils.modules")
    local is_ok, mods = pcall(mod.requires, {
        "notify"
    })
    if not is_ok then
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
