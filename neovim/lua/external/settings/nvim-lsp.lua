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
    capabilities       = mods['cmp_nvim_lsp'].update_capabilities(capabilities)
    mods['mason-lspconfig'].setup_handlers{
        -- Default setting
        function(server)
            local opts = {
                capabilities = capabilities
            }
            mods['lspconfig'][server].setup(opts)
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
                    Lua = {
                        -- Only show name and type in completion window 
                        -- This option is added since May 16, 2022
                        -- See: https://github.com/rust-lang/rust-analyzer/pull/12010
                        signatureInfo = {
                            detail = "parameters"
                        }
                    }
                }
            }
        end
    }
end

return setup
