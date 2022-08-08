local M = {}

function M._lower(str)
    return string.lower(str)
end

function M._currtime()
    return vim.fn.strftime(' %H:%M:%S')
end

function M.setup()
    local lualine = require('lualine')

    local filename_symbols   = {
        modified = ' +',
        readonly = ' -',
        unnamed  = 'no name',
        newfile  = 'new',
    }
    local fileformat_symbols = {
        unix = ' unix',
        dos  = ' dos',
        mac  = ' mac',
    }

    local status_line = {
        lualine_a = { { 'mode',  fmt = M._lower } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', newfile_status = true, symbols = filename_symbols } },
        lualine_x = { 'encoding', { 'fileformat', symbols = fileformat_symbols }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { '%l/%L:%c' }
    }

    local status_tab = {
        lualine_a = { { 'tabs', max_length = vim.o.columns, mode = 2 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { M._currtime },
        lualine_z = {},
    }

    local status_bar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }

    lualine.setup {
        options = {
            theme = 'sonokai',
            globalstatus = true,
            refresh = {
                statusline = 100,
                tabline    = 100,
                winbar     = 100,
            }
        },
        sections         = status_line,
        inactive_section = status_line,
        tabline          = status_tab,
        winbar           = status_bar,
        inactive_winbar  = status_bar,
    }
end

return M
