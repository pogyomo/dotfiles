local function setup()
    local mod = require("utils.modules")
    local is_ok, mods = pcall(mod.requires, {
        "cmp",
        { "nvim-autopairs", as = "autopairs" },
        { "nvim-autopairs.rule", as = "rule" },
        { "nvim-autopairs.completion.cmp", as = "autopairs_cmp" }
    })
    if not is_ok then
        return
    end

    -- Setup for nvim-autopairs and config for nvim-cmp
    mods["autopairs"].setup()
    mods["cmp"].event:on(
        "confirm_done",
        mods["autopairs_cmp"].on_confirm_done()
    )
end

return setup
