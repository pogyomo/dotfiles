function setup_lualine()
    require('lualine').setup {
        options = {
            theme         = 'sonokai',
            globalstatus  = true,
        },
        tabline = {
            lualine_a = {
                {
                    'tabs',
                    max_length = vim.o.columns,
                    mode = 2,
                }
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
    }
end
