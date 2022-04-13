function setup_lualine()
    local filename_symbols   = { modified = ' +',     readonly = ' -',    unnamed  = 'no name' }
    local fileformat_symbols = { unix     = ' unix', dos      = ' dos', mac      = ' mac'   }
    local status_line = {
        lualine_a = { { 'mode', fmt = function(str) return string.lower(str) end } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', symbols = filename_symbols } },
        lualine_x = { 'encoding', { 'fileformat', symbols = fileformat_symbols }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    }
    local status_tab = {
        lualine_a = { { 'tabs', max_length = vim.o.columns, mode = 2 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }

    require('lualine').setup {
        options          = { theme = 'sonokai', globalstatus = true },
        sections         = status_line,
        inactive_section = status_line,
        tabline          = status_tab,
    }
end
