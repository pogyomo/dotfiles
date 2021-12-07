function setup_nvim_lsp()
    -- Always show signcolumn
    vim.opt.signcolumn = 'yes'

    -- Variable for setting
    local lsp_installer = require('nvim-lsp-installer')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities       = require('cmp_nvim_lsp').update_capabilities(capabilities)


    -- Install lsp
    local servers = {
        'clangd',
        'texlab',
    }
    for _, name in pairs(servers) do
        local server_is_found, server = lsp_installer.get_server(name)
        if server_is_found then
            if not server:is_installed() then
                print("Installing " .. name)
                server:install()
            end
        end
    end


    -- Configur lsp
    lsp_installer.on_server_ready(function(server)
        local opts = {
            capabilities = capabilities
        }
        server:setup(opts)
    end)
end
