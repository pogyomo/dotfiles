local function setup()
    local util = require('internal.plugins.utils')
    local mods = util.requires{
        'mason',
        'mason-lspconfig',
        'lspconfig',
        'cmp_nvim_lsp'
    }
    if util.is_empty(mods) then
        return
    end

    -- Always show signcolumn
    vim.opt.signcolumn = 'yes'

    -- Setup mason
    mods['mason'].setup()

    -- Install lsp automatically
    mods['mason-lspconfig'].setup{
        ensure_installed = {
            'sumneko_lua',
            'clangd',
            'texlab',
            'rust_analyzer',
            'jdtls',
        }
    }

    -- Setup lspcomfig with cmp_nvim_lsp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = mods['cmp_nvim_lsp'].update_capabilities(capabilities)
    mods['mason-lspconfig'].setup_handlers{
        -- Default setting
        function(server)
            mods['lspconfig'][server].setup({
                capabilities = capabilities
            })
        end,

        -- Settings for specific servers
        ['sumneko_lua'] = function()
            mods['lspconfig'].sumneko_lua.setup{
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
        end,
        ['rust_analyzer'] = function()
            mods['lspconfig'].rust_analyzer.setup{
                settings = {
                    ["rust-analyzer"] = {
                    }
                }
            }
        end
    }
end

return setup
