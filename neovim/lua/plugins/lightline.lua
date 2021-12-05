function setup_lightline()
    -- Always display statusline and tabline
    vim.opt.laststatus  = 2
    vim.opt.showtabline = 2

    -- Function to return current file name and modify flag
    vim.cmd([[
    function! LightlineGetFileName()
        let filename = expand('%:t')
        if &modifiable == 0
            return filename.' -'
        elseif &modified == 1
            return filename.' +'
        else
            return filename
        endif
    endfunction
    ]])

    -- Function to return 'Help' if the buffer is help buffer
    vim.cmd([[
    function! LightlineIsHelpBuffer()
        if &buftype == 'help'
            return 'Help'
        else
            return ''
        endif
    endfunction
    ]])

    -- Function to return 'Prev' if the window is preview window 
    vim.cmd([[
    function! LightlineIsPreviewWindow()
        if &previewwindow == 1
            return 'Prev'
        else
            return ''
        endif
    endfunction
    ]])

    -- Function to return current branch
    vim.cmd([[
    function! LightlineGetBranch()
        if FugitiveHead() == ''
            return 'No branch'
        else
            return ' '.FugitiveHead()
        endif
    endfunction
    ]])

    -- Function to return current branch
    vim.cmd([[
    function! LightlineGetBranch()
        if FugitiveHead() == ''
            return 'No branch'
        else
            return ' '.FugitiveHead()
        endif
    endfunction
    ]])

    -- Function to return file path
    vim.cmd([[
    function! LightlineGetFilePath()
        return expand('%:p:h')
    endfunction
    ]])

    -- Settings for statusline and tabline
    vim.g.lightline = {
        -- Colorscheme
        colorscheme  = 'wombat',
        
        -- Things to display in statusline when it is active
        active       = {
             left  = {
                { 'mode', 'paste' },
                { 'branch' },
                { 'filename', 'readonly', 'help', 'preview' }
            },
            right = {
                { 'lineinfo' },
                { 'filetype', 'fileformat', 'fileencoding' }
            }
        },

        -- Things to display in statusline when it is inactive
        inactive = {
            left  = {
                { 'branch' },
                { 'filename', 'readonly', 'help', 'preview' }
            },
            right = {
                { 'lineinfo' },
                { 'filetype', 'fileformat', 'fileencoding' }
            }
        },

        -- Component to use in statusline
        component = {
            lineinfo = '%v:%l/%L'
        },

        -- Function to use in statusline
        component_function = {
            filename = 'LightlineGetFileName',
            help     = 'LightlineIsHelpBuffer',
            preview  = 'LightlineIsPreviewWindow',
            branch   = 'LightlineGetBranch'
        },

        -- Expand component to use in statusline and tabline
        component_expand = {
            filepath = 'LightlineGetFilePath'
        },

        -- Type of expand component
        component_type = {
            tabs     = 'tabsel',
            filepath = 'tabsel'
        },

        -- Separator to use in statusline
        separator    = {
            left  = '',
            right = ''
        },
        subseparator = {
            left  = '',
            right = ''
        },

        -- Things to display in tabline 
        tabline = {
            left  = {
                { 'tabs' }
            },
            right = {
                { 'filepath' }
            }
        },

        -- Separator to use in statusline
        tabline_separator    = {
            left  = '',
            right = ''
        },
        tabline_subseparator = {
            left  = '',
            right = ''
        },

        -- Mode name
        mode_map = {
            ['n']       = 'Normal',
            ['i']       = 'Insert',
            ['R']       = 'Replace',
            ['v']       = 'Visual',
            ['V']       = 'V-Line',
            ['\\<C-v>'] = 'V-Block',
            ['c']       = 'Command',
            ['s']       = 'Select',
            ['S']       = 'S-Line',
            ['\\<C-s>'] = 'S-Block',
            ['t']       = 'Terminal'
        },

        -- Use statusline and tabline
        enable = {
            statusline = 1,
            tabline    = 1
        }
    }
end
