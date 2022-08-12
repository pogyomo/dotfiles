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
