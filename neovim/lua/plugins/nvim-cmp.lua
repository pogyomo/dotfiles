function setup_nvim_cmp()
    -- Global option of nvim-cmp
    vim.opt.completeopt = 'menu,menuone,noselect'
    vim.opt.pumblend    = 30 -- Completion window will translucent

    -- Setup nvim-cmp at window
    local cmp = require'cmp'
    cmp.setup(
    {
        -- Specify snippet engine
        -- It is needed to run this plugin
        snippet = 
        {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end,
        },

        -- Setting of mappings
        mapping =
        {
            ['<C-n>']     = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),{ 'i', 'c' }),
            ['<C-p>']     = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),{ 'i', 'c' }),
            ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4),                                           { 'i', 'c' }),
            ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4),                                            { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),                                                { 'i', 'c' }),
            ['<C-e>']     = cmp.mapping(cmp.mapping.abort(),                                                   { 'i', 'c' }),
            ['<CR>']      = cmp.mapping.confirm({ select = false }),
        },

        -- Number of character that need to start auto completion
        completion = {
            keyword_length = 1
        },

        
        -- Search word from selected place
        sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        },
        {
            { name = 'buffer' },
            { name = 'path' }
        }),

    })

    -- Setup nvim-cmp at '/'
    cmp.setup.cmdline('/', {
        -- Search word from selected place
        sources = {
            { name = 'buffer' }
        }
    })

    -- Setup nvim-cmp at ':'
    cmp.setup.cmdline(':', {
        -- Search word from selected place
        sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        })
    })
end
