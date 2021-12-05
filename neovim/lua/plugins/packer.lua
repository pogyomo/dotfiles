-- -----------------
-- Standard settings
-- -----------------
-- Functions
require('plugins.molokai')
require('plugins.lightline')
require('plugins.nvim-lspconfig')
require('plugins.nvim-cmp')

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
            setup_molokai()
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
