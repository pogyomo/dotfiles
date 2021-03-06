function setup_nvim_treesitter()
    -- Set config
    require'nvim-treesitter.configs'.setup {
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
        highlight        = {
            -- Enable highlight
            enable = true,
        },
    }
end
