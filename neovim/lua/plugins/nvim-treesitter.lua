function setup_nvim_treesitter()
    -- Set config
    require'nvim-treesitter.configs'.setup {
        -- Language to install
        ensure_installed = {
            'c',
            'cpp',
            'lua',
            'latex',
            'bibtex',
            'markdown',
        },

        -- Settings for highligh
        highlight        = {
            -- Enable highlight
            enable = true,
        },
    }
end
