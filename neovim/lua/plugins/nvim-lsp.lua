function setup_nvim_lsp()
    -- Always show signcolumn
    vim.opt.signcolumn = 'yes'

    -- Setup mason
    require('mason').setup()

    -- Install lsp automatically
    require('mason-lspconfig').setup({
        ensure_installed = {
            'clangd',
            'texlab',
            'rust_analyzer',
            'jdtls',
        }
    })
end
