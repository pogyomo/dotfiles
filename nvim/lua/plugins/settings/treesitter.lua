local function setup()
    local util = require("utils.require")
    local mods = util.require("nvim-treesitter.configs")
    if not mods then
        return
    end

    mods["nvim-treesitter.configs"].setup {
        -- Language to install
        ensure_installed = {
            "bibtex",
            "c",
            "cpp",
            "go",
            "help",
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

        rainbow = {
            enable = true,
            extended_mode = true,
        }
    }
end

return setup
