-- Plugins that will be managed by packer
vim.api.nvim_exec('packadd packer.nvim', false)
return require('packer').startup(function(use)
    -- Packer should be maneged by itself
    use{
        'wbthomason/packer.nvim'
    }

    -- Syntax highlights
    use{
        'thentenaar/vim-syntax-obscure',
        opt = true, ft = { 'nesasm', 'ca65' }
    }
    use{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require('plugins.external.nvim-treesitter'),
    }

    -- Visual
    use{
        'sainnhe/sonokai',
        config = require('plugins.external.sonokai'),
    }
    use{
        'lukas-reineke/indent-blankline.nvim',
        config = require('plugins.external.indent')
    }
    use{
        'rcarriga/nvim-notify'
    }

    -- Statusline
    use{
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        },
        config = require('plugins.external.lualine')
    }

    -- Lsp and related plugin
    use{
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = require('plugins.external.nvim-lsp')
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
        config = require('plugins.external.nvim-cmp')
    }
end)
