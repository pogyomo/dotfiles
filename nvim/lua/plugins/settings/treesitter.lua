local function setup()
    local mod = require("utils.modules")
    local is_ok, mods = pcall(mod.requires, {
        "nvim-treesitter.configs"
    })
    if not is_ok then
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
