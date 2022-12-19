local function setup()
    local util = require("utils.require")
    local mods = util.require{
        "cmp",
        { "nvim-autopairs", as = "autopairs" },
        { "nvim-autopairs.completion.cmp", as = "autopairs_cmp" }
    }
    if not mods then
        return
    end

    -- Setup for nvim-autopairs and config for nvim-cmp
    mods["autopairs"].setup()
    mods["cmp"].event:on("confirm_done", mods["autopairs_cmp"].on_confirm_done())
end

return setup
