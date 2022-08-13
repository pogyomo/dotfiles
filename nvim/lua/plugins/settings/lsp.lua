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

    -- Initialize
    mods["mason"].setup()
    mods["mason-lspconfig"].setup{
        ensure_installed = {
            "rust_analyzer",
            "sumneko_lua",
        }
    }

    -- Settings of specific lsp with nvim-cmp
    local cap = vim.lsp.protocol.make_client_capabilities()
    cap = mods["cmp_nvim_lsp"].update_capabilities(cap)
    mods["lspconfig"].sumneko_lua.setup{
        capabilities = cap,
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
    mods["lspconfig"].rust_analyzer.setup{
        capabilities = cap,
    }
end

return setup
