local M = {}

function M.setup()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')

    -- Always show signcolumn
    vim.opt.signcolumn = 'yes'

    -- All lsp to be installed

    -- Setup mason
    mason.setup()

    -- Install lsp automatically
    mason_lspconfig.setup({
        ensure_installed = {
            'sumneko_lua',
            'clangd',
            'texlab',
            'rust_analyzer',
            'jdtls',
        }
    })

    -- Setup lspcomfig with cmp_nvim_lsp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities       = require('cmp_nvim_lsp').update_capabilities(capabilities)
    mason_lspconfig.setup_handlers({
        -- Default setting
        function(server)
            local opts = {
                capabilities = capabilities
            }
            require('lspconfig')[server].setup(opts)
        end,

        -- Settings for specific servers
        ['sumneko_lua'] = function()
            lspconfig.sumneko_lua.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end,
    })
end

return M
