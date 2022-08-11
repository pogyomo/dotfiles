local function setup()
    local util = require('core.util')
    local mods = util.requires{ 'nvim-treesitter.configs' }
    if util.is_empty(mods) then
        return
    end

    mods['nvim-treesitter.configs'].setup {
        -- Language to install
        ensure_installed = {
            'c',
            'cpp',
            'lua',
            'java',
            'latex',
            'bibtex',
            'markdown',
            'rust',
            'go'
        },

        -- Settings for highligh
        highlight = {
            -- Enable highlight
            enable = true,
        },
    }
end

return setup
