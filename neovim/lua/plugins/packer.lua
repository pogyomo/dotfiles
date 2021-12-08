-- -----------------
-- Standard settings
-- -----------------
-- Functions
require('plugins.molokai')
require('plugins.lightline')
require('plugins.nvim-lsp')
require('plugins.nvim-cmp')

-- It should be written
vim.cmd[[packadd packer.nvim]]

-- Plugin that will be managed by packer
return require('packer').startup(function()
    -- Packer should be maneged by itself
    use'wbthomason/packer.nvim'

    -- Syntax highlights for c/c++
    use{
        'bfrg/vim-cpp-modern',
        opt = true,
        ft  = {
            'c',
            'cpp'
        }
    }

    -- Syntax highlights for nesasm/ca65
    use{
        'thentenaar/vim-syntax-obscure',
        opt = true,
        ft  = {
            'nesasm',
            'ca65'
        }
    }

    -- Colorscheme
    use{
        'tomasr/molokai',
        config = function()
            setup_molokai()
        end,
    }

    -- Easymotion like plugin
    use{
        'phaazon/hop.nvim',
        branch = 'v1',
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

    -- Floaterm
    use{
        'voldikss/vim-floaterm',
        config = function()
            -- Set options
            vim.g.floaterm_width     = 0.8
            vim.g.floaterm_height    = 0.8
            vim.g.floaterm_autoclose = 2
        end,
    }

    -- Lsp and related plugin
    use{
        'neovim/nvim-lspconfig',
        requires = {
            -- Installer
            'williamboman/nvim-lsp-installer',

            -- Completion plugin
            'hrsh7th/nvim-cmp',

            -- Snippet plugin
            'hrsh7th/vim-vsnip',

            -- Dependention of nvim-cmp and vim-vsnip
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
        },
        config = function()
            setup_nvim_cmp()
            setup_nvim_lsp()
        end,
    }
end)
