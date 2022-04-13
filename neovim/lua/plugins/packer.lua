-- -----------------
-- Standard settings
-- -----------------
-- Functions
require('plugins.nvim-treesitter')
require('plugins.sonokai')
require('plugins.nvim-lsp')
require('plugins.nvim-cmp')
require('plugins.lualine')

-- Plugin that will be managed by packer
vim.cmd[[packadd packer.nvim]]
return require('packer').startup(function()
    -- Packer should be maneged by itself
    use'wbthomason/packer.nvim'

    -- Syntax highlights
    use{
        'thentenaar/vim-syntax-obscure',
        opt = true,
        ft  = {
            'nesasm',
            'ca65'
        },
    }
    use{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            setup_nvim_treesitter()
        end,
    }

    -- Visual
    use{
        'sainnhe/sonokai',
        config = function()
            setup_sonokai()
        end,
    }
    use'Yggdroot/indentLine'
    use{
        'petertriho/nvim-scrollbar',
        config = function()
            require'scrollbar'.setup()
        end
    }

    -- Statusline
    use{
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            setup_lualine()
        end
    }

    -- Lsp and related plugin
    use{
        'neovim/nvim-lspconfig',
        requires = { 'williamboman/nvim-lsp-installer' },
        config = function()
            setup_nvim_lsp()
        end,
    }

    -- Completion plugin
    use{
        'hrsh7th/nvim-cmp',
        requires = {
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
        end,
    }
end)
