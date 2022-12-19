vim.cmd.packadd("packer.nvim")
return require("packer").startup{
    function(use)
        use("wbthomason/packer.nvim")

        -- Syntax highlight
        use{
            "thentenaar/vim-syntax-obscure",
            ft = { "nesasm", "ca65" }
        }
        use{
            "nvim-treesitter/nvim-treesitter",
            run = function()
                require("nvim-treesitter.install").update{
                    with_sync = true
                }()
            end,
            requires = {
                -- NOTE: Loading this plugin if nvim-treesitter is installed.
                {
                    "p00f/nvim-ts-rainbow",
                    cond = function()
                        return pcall(require, "nvim-treesitter")
                    end
                }
            },
            config = require("plugins.settings.treesitter")
        }

        -- Statusline
        use{
            -- NOTE: Lualine doesn't work well if I install neovim via brew.
            "nvim-lualine/lualine.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons"
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

        -- Package manager
        use{
            "williamboman/mason.nvim",
            requires = {
                -- LSP manager and utility
                "neovim/nvim-lspconfig",
                "williamboman/mason-lspconfig.nvim",
                "j-hui/fidget.nvim"
            },
            config = require("plugins.settings.mason")
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
                "hrsh7th/cmp-nvim-lsp-signature-help",
                "saadparwaiz1/cmp_luasnip",

                -- Visual
                "onsails/lspkind.nvim"
            },
            config = require("plugins.settings.cmp")
        }

        -- Key mapping
        use{
            "pogyomo/submode.nvim",
            config = require("plugins.settings.submode")
        }
        use{
            "windwp/nvim-autopairs",
            config = require("plugins.settings.autopairs")
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
                return require("packer.util").float{
                    border = "rounded"
                }
            end
        }
    }
}
