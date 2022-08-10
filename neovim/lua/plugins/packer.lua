-- Plugins that will be managed by packer
vim.cmd[[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer should be maneged by itself
    use{
        'wbthomason/packer.nvim'
    }

    -- Utilities
    use{
        'nvim-lua/plenary.nvim',
    }

    -- Syntax highlights
    use{
        'thentenaar/vim-syntax-obscure',
        opt = true, ft = { 'nesasm', 'ca65' }
    }
    use{
        'nvim-treesitter/nvim-treesitter',
        run = ':silent! TSUpdate',
        config = function() require('plugins.external.nvim-treesitter') end,
    }

    -- Visual
    use{
        'sainnhe/sonokai',
        config = function() require('plugins.external.sonokai') end,
    }
    use{
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.external.indent') end,
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
        config = function() require('plugins.external.lualine') end,
    }

    -- Lsp and related plugin
    use{
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function() require('plugins.external.nvim-lsp') end,
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
        config = function() require('plugins.external.nvim-cmp') end,
    }
end)
