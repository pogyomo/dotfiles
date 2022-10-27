vim.cmd.packadd("packer.nvim")
return require("packer").startup{
function(use)
    use("wbthomason/packer.nvim")

    -- Syntax highlight
    use{
        "thentenaar/vim-syntax-obscure",
        opt = true, ft = { "nesasm", "ca65" }
    }
    use{
        "nvim-treesitter/nvim-treesitter",
        config = require("plugins.settings.treesitter")
    }

    -- Statusline
    use{
        "nvim-lualine/lualine.nvim",
        -- After the commit "6fbc35b3e0134ccce3848fef8855a3bb390aa509", tabline doesn't works well.
        -- Below commit reverted above commit, but this commit is also reverted by newer commit. 
        -- So, I will fix the commit until lualine fix this problem.
        commit = "b1042d318446601d57e8b44033e597e003511636",
        requires = {
            "kyazdani42/nvim-web-devicons", opt = true
        },
        config = require("plugins.settings.lualine")
    }

    -- Visual
    use{
        "sainnhe/sonokai",
        config = require("plugins.settings.sonokai")
    }
    use{
        "lukas-reineke/indent-blankline.nvim",
        config = require("plugins.settings.indent")
    }
    use{
        "rcarriga/nvim-notify",
        config = require("plugins.settings.notify")
    }
    use{
        "folke/todo-comments.nvim",
        config = require("plugins.settings.todo")
    }

    -- Language Server Protocol
    use{
        "williamboman/mason.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
        },
        config = require("plugins.settings.lsp")
    }

    -- Completion
    use{
        "hrsh7th/nvim-cmp",
        requires = {
            -- Snippet engine
            "L3MON4D3/LuaSnip",

            -- Sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",

            -- Visual
            "onsails/lspkind.nvim",
        },
        config = require("plugins.settings.cmp")
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
            return require("packer.util").float{ border = "rounded" }
        end
    }
}}
