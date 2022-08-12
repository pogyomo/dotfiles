-- Plugins that will be managed by packer
vim.cmd.packadd('packer.nvim')
return require('packer').startup{
function(use)
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
        run = ':silent! TSUpdate',
        config = require('external.settings.nvim-treesitter'),
    }

    -- Visual
    use{
        'sainnhe/sonokai',
        config = require('external.settings.sonokai'),
    }
    use{
        'lukas-reineke/indent-blankline.nvim',
        config = require('external.settings.indent'),
    }
    use{
        'rcarriga/nvim-notify',
        config = require('external.settings.notify'),
    }

    -- Statusline
    use{
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        },
        config = require('external.settings.lualine'),
    }

    -- Lsp and related plugin
    use{
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = require('external.settings.nvim-lsp'),
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
        config = require('external.settings.nvim-cmp'),
    }
end,
config = {
    display = {
        open_fn = function()
            vim.api.nvim_create_augroup("PackerWinBlend", {})
            vim.api.nvim_create_autocmd("FileType", {
                group   = "PackerWinBlend",
                pattern = "packer",
                callback = function()
                    vim.opt.winblend = 10
                end,
            })
            return require('packer.util').float{ border = 'rounded' }
        end
    }
}}
