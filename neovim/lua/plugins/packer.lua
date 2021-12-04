-- ---------------------
-- Function for settings
-- ---------------------
-- For nvim-cmp
function setup_nvim_cmp()
    -- Global option of nvim-cmp
    vim.opt.completeopt = 'menu,menuone,noselect'

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
            ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4),  { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),      { 'i', 'c' }),
            ['<C-e>']     = cmp.mapping.abort(),
            ['<CR>']      = cmp.mapping.confirm({ select = false }),
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
end

-- For lightline
function setup_lightline()
    -- Settings for display
    vim.opt.laststatus  = 2
    vim.opt.showtabline = 2

    -- Settings for statusline and tabline
    vim.g.lightline = {
        -- Colorscheme
        colorscheme  = 'wombat',
        
        -- Things to display in statusline when it is active
        active       = {
             left  = {
                { 'mode', 'paste' },
                { 'filename' }
            },
            right = {
                { 'lineinfo' },
                { 'filetype', 'fileformat', 'fileencoding' }
            }
        },

        -- Things to display in statusline when it is inactive
        inactive = {
            left  = {
                { 'mode', 'paste' },
                { 'filename' }
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

        -- Separator to use in statusline
        separator    = {
            left  = '',
            right = ''
        },
        subseparator = {
            left  = '',
            right = ''
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
