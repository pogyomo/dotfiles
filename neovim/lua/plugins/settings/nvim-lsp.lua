local function setup()
    local util = require'core.util'
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
    mods['mason-lspconfig'].setup({
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
    capabilities       = mods['cmp_nvim_lsp'].update_capabilities(capabilities)
    mods['mason-lspconfig'].setup_handlers({
        -- Default setting
        function(server)
            local opts = {
                capabilities = capabilities
            }
            mods['lspconfig'][server].setup(opts)
        end,

        -- Settings for specific servers
        ['sumneko_lua'] = function()
            mods['lspconfig'].sumneko_lua.setup({
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

return setup
