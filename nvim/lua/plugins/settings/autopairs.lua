local function setup()
    local util = require("utils.require")
    local mods = util.require{
        "cmp",
        { "nvim-autopairs", as = "autopairs" },
        { "nvim-autopairs.rule", as = "rule" },
        { "nvim-autopairs.completion.cmp", as = "autopairs_cmp" }
    }
    if not mods then
        return
    end

    -- Setup for nvim-autopairs and config for nvim-cmp
    mods["autopairs"].setup()
    mods["cmp"].event:on(
        "confirm_done",
        mods["autopairs_cmp"].on_confirm_done()
    )

    -- Rules for lua.
    mods["autopairs"].add_rules{
        mods["rule"]("then", "end", "lua"),
        mods["rule"]("do",   "end", "lua")
    }
end

return setup
