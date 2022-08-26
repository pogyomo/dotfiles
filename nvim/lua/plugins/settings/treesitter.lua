local function setup()
    local util = require("utils")
    local mods = util.requires("nvim-treesitter.configs")
    if util.is_empty(mods) then
        return
    end

    mods["nvim-treesitter.configs"].setup {
        -- Language to install
        ensure_installed = {
            "bibtex",
            "c",
            "cpp",
            "go",
            "java",
            "lua",
            "latex",
            "markdown",
            "rust",
            "zig",
        },

        -- Settings for highligh
        highlight = {
            -- Enable highlight
            enable = true,
        },
    }
end

return setup
