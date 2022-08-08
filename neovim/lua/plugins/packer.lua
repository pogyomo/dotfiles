-- External plugins
local treesitter = require('plugins.external.nvim-treesitter')
local sonokai    = require('plugins.external.sonokai')
local nvim_lsp   = require('plugins.external.nvim-lsp')
local nvim_cmp   = require('plugins.external.nvim-cmp')
local lualine    = require('plugins.external.lualine')
local indent = require('indent_blankline')

-- Plugins that will be managed by packer
vim.cmd[[packadd packer.nvim]]
return require('packer').startup(function()
    -- Packer should be maneged by itself
    use{ 'wbthomason/packer.nvim' }

    -- Syntax highlights
    use{ 'thentenaar/vim-syntax-obscure', opt = true, ft = { 'nesasm', 'ca65' } }
    use{
        'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = treesitter.setup()
    }

    -- Visual
    use{
        'sainnhe/sonokai',
        config = sonokai.setup()
    }
    use{
        'lukas-reineke/indent-blankline.nvim',
        config = indent.setup()
    }
    use{ 'rcarriga/nvim-notify' }

    -- Statusline
    use{
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = lualine.setup()
    }

    -- Lsp and related plugin
    use{
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = nvim_lsp.setup()
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
        config = nvim_cmp.setup()
    }
end)
