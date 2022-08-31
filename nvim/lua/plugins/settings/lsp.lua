local function setup()
    local util = require("utils")
    local mods = util.requires{
        "mason",
        "lspconfig",
        "mason-lspconfig",
        "cmp_nvim_lsp",
    }
    if util.is_empty(mods) then
        return
    end

    -- Always show signcolumn (in left)
    vim.opt.signcolumn = "yes"

    -- Autocmd for mason
    vim.api.nvim_create_augroup("MasonAugroup", {})
    vim.api.nvim_create_autocmd("FileType", {
        group = "MasonAugroup",
        pattern = "mason",
        callback = function()
            vim.opt.winblend = 10
        end
    })

    -- Initialize
    mods["mason"].setup{
        ui = {
            border = "rounded",
        }
    }
    mods["mason-lspconfig"].setup{
        ensure_installed = {
            "clangd",
            "sumneko_lua",
            "rust_analyzer",
            "zls",
        }
    }

    -- Settings of specific lsp with nvim-cmp
    local cap = vim.lsp.protocol.make_client_capabilities()
    cap = mods["cmp_nvim_lsp"].update_capabilities(cap)
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

return setup