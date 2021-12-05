-- ---------------------
-- Functions for setting
-- ---------------------
-- For nvim-cmp
function setup_nvim_cmp()
    -- Global option of nvim-cmp
    vim.opt.completeopt = 'menu,menuone,noselect'
    vim.opt.pumblend    = 30 -- Completion window will translucent

    -- Setup nvim-cmp at window
    local cmp = require'cmp'
    cmp.setup(
    {
        -- Specify snippet engine
        -- It is needed to run this plugin
        snippet = 
        {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end,
        },

        -- Setting of mappings
        mapping =
        {
            ['<C-n>']     = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),{ 'i', 'c' }),
            ['<C-p>']     = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),{ 'i', 'c' }),
            ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4),                                           { 'i', 'c' }),
            ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4),                                            { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),                                                { 'i', 'c' }),
            ['<C-e>']     = cmp.mapping(cmp.mapping.abort(),                                                   { 'i', 'c' }),
            ['<CR>']      = cmp.mapping.confirm({ select = false }),
        },

        -- Number of character that need to start auto completion
        completion = {
            keyword_length = 1
        },

        
        -- Search word from selected place
        sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        },
        {
            { name = 'buffer' },
        }),

    })

    -- Setup nvim-cmp at '/'
    cmp.setup.cmdline('/', {
        -- Search word from selected place
        sources = {
            { name = 'buffer' }
        }
    })

    -- Setup nvim-cmp at ':'
    cmp.setup.cmdline(':', {
        -- Search word from selected place
        sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        })
    })
end

-- For nvim-lspconfig
function setup_nvim_lspconfig()
    -- Global option of lspconfig
    vim.opt.signcolumn = 'yes' -- always display signcolumn

    -- Variable to adapt nvim-cmp to nvim-lspconfig
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities       = require('cmp_nvim_lsp').update_capabilities(capabilities)

    -- Setup c/c++ lsp
    require'lspconfig'.clangd.setup {
        capabilities = capabilities
    }

    -- Setup latex lsp
    require'lspconfig'.texlab.setup {
        capabilities = capabilities,
        filetype     = {
            'tex',
            'bib',
            'plaintex'
        }
    }
end

-- For lightline
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


-- -----------------
-- Standard settings
-- -----------------
-- It should be written
vim.cmd[[packadd packer.nvim]]

-- Plugin that will be managed by packer
return require('packer').startup(function()
    -- Packer should be maneged by itself
    use'wbthomason/packer.nvim'

    -- Syntax highlights
    use'bfrg/vim-cpp-modern'           -- For c/c++
    use'thentenaar/vim-syntax-obscure' -- For nesasm/ca65

    -- Colorscheme
    use{
        'tomasr/molokai',
        config = function()
            vim.cmd('colorscheme molokai')
        end,
    }

    -- Easymotion like plugin
    use{
        'phaazon/hop.nvim',
        config = function()
            require'hop'.setup()
        end,
    }          

    -- Statusline
    use{
        'itchyny/lightline.vim',
        config = function()
            setup_lightline()
        end,
    }

    -- Git
    use'tpope/vim-fugitive'

    -- Lsp and related plugin
    use{
        'neovim/nvim-lspconfig',
        requires = {
            -- Completion plugin
            'hrsh7th/nvim-cmp',

            -- Dependention of nvim-cmp
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = function()
            setup_nvim_cmp()
            setup_nvim_lspconfig()
        end,
    }
end)
