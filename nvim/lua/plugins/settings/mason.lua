local function setup()
    local util = require("utils.require")
    local mods = util.require{
        "mason",
        "lspconfig",
        "mason-lspconfig",
        "cmp_nvim_lsp",
        "fidget",
    }
    if not mods then
        return
    end

    local setup_mason = function()
        -- Always show signcolumn (in left)
        vim.opt.signcolumn = "yes"

        -- Initialize mason.
        mods["mason"].setup{
            ui = {
                border = "rounded",
            }
        }

        -- Autocmd for mason
        vim.api.nvim_create_augroup("MasonAugroup", {})
        vim.api.nvim_create_autocmd("FileType", {
            group = "MasonAugroup",
            pattern = "mason",
            callback = function()
                vim.opt.winblend = 10
            end
        })
    end

    local setup_lsp = function()
        -- Initialize fidget (show lsp's progress)
        mods["fidget"].setup()

        -- Initialize
        mods["mason-lspconfig"].setup{
            ensure_installed = {
                "clangd",
                "sumneko_lua",
                "rust_analyzer",
                "tsserver",
            }
        }

        -- Settings of specific lsp with nvim-cmp
        local cap = mods["cmp_nvim_lsp"].default_capabilities()
        mods["mason-lspconfig"].setup_handlers{
            function(name)
                mods["lspconfig"][name].setup {
                    capabilities = cap,
                }
            end,
            ["sumneko_lua"] = function()
                mods["lspconfig"].sumneko_lua.setup{
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                            },
                            diagnostics = {
                                globals = { "vim" },
                            }
                        }
                    }
                }
            end,
        }
    end

    setup_mason()
    setup_lsp()
end

return setup
