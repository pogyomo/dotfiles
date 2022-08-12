local function setup()
    local util = require('internal.plugins.utils')
    local mods = util.requires('cmp')
    if util.is_empty(mods) then
        return
    end

    -- Global option of nvim-cmp
    vim.opt.completeopt = 'menu,menuone,noselect'
    vim.opt.pumblend    = 10 -- Completion window will translucent

    -- Setup nvim-cmp at window
    local behavior = { behavior = mods['cmp'].SelectBehavior.Insert }
    local opts     = { 'i', 'c' }
    mods['cmp'].setup(
    {
        -- Specify snippet engine
        -- It is required to run this plugin
        snippet = {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end,
        },

        -- Setting of mappings
        mapping = {
            ['<C-n>']     = mods['cmp'].mapping(mods['cmp'].mapping.select_next_item(behavior),  opts),
            ['<C-p>']     = mods['cmp'].mapping(mods['cmp'].mapping.select_prev_item(behavior),  opts),
            ['<Tab>']     = mods['cmp'].mapping(mods['cmp'].mapping.select_next_item(behavior),  opts),
            ['<C-b>']     = mods['cmp'].mapping(mods['cmp'].mapping.scroll_docs(-4),             opts),
            ['<C-f>']     = mods['cmp'].mapping(mods['cmp'].mapping.scroll_docs(4),              opts),
            ['<C-Space>'] = mods['cmp'].mapping(mods['cmp'].mapping.complete(),                  opts),
            ['<C-e>']     = mods['cmp'].mapping(mods['cmp'].mapping.abort(),                     opts),
            ['<CR>']      = mods['cmp'].mapping.confirm({ select = false }),
        },

        completion = {
            -- Number of character that need to start auto completion
            keyword_length = 1,
        },

        window = {
            documentation = {
                border = "rounded",
            },
        },

        -- Search word from selected place
        sources = mods['cmp'].config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        },
        {
            {
                name   = 'buffer',
                option = {
                    -- Get word from all buffer
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end
                },
            },
            { name = 'path' },
        }),
    })

    -- Setup nvim-cmp at '/'
    mods['cmp'].setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

    -- Setup nvim-cmp at ':'
    mods['cmp'].setup.cmdline(':', {
        sources = mods['cmp'].config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        })
    })
end

return setup