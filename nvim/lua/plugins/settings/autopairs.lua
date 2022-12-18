local function setup()
    local util = require("utils")
    local mods = util.requires{
        "nvim-autopairs",
        "nvim-autopairs.completion.cmp",
        "cmp"
    }
    if util.is_empty(mods) then
        return
    end

    -- Setup for nvim-autopairs and config for nvim-cmp
    mods["nvim-autopairs"].setup()
    mods["cmp"].event:on(
        "confirm_done",
        mods["nvim-autopairs.completion.cmp"].on_confirm_done()
    )
end

return setup
