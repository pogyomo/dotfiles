function setup_nvim_lspconfig()
    -- Global option of lspconfig
    vim.opt.signcolumn = 'yes' -- always display signcolumn

    -- Variable to adapt nvim-cmp to nvim-lspconfig
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities       = require('cmp_nvim_lsp').update_capabilities(capabilities)

    -- Setup c/c++ lsp
    require'lspconfig'.clangd.setup {
        capabilities = capabilities
    }

    -- Setup latex lsp
    require'lspconfig'.texlab.setup {
        capabilities = capabilities
    }
end
