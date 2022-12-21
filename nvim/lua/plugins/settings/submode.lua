local function setup()
    local mod = require("utils.modules")
    local is_ok, mods = pcall(mod.requires, {
        "submode"
    })
    if not is_ok then
        return
    end

    -- Setup submode.
    mods["submode"]:setup()

    -- Settings for submodes
    -- Keymaps to enter submodes
    vim.keymap.set("n", "<Leader>l", "[Lsp]", { remap = true })
    -- Variables
    local leave = { "q", "<ESC>" }
    -- Lsp operator
    mods["submode"]:create("LspOperator", {
        mode = "n",
        enter = "[Lsp]",
        leave = leave
    }, {
        lhs = "d",
        rhs = vim.lsp.buf.definition
    }, {
        lhs = "D",
        rhs = vim.lsp.buf.declaration
    }, {
        lhs = "H",
        rhs = vim.lsp.buf.hover
    }, {
        lhs = "i",
        rhs = vim.lsp.buf.implementation
    }, {
        lhs = "r",
        rhs = vim.lsp.buf.references
    })
    -- Document reader
    mods["submode"]:create("DocReader", {
        mode = "n",
    }, {
        lhs = "<Enter>",
        rhs = "<C-]>"
    }, {
        lhs = "u",
        rhs = "<cmd>po<cr>"
    }, {
        lhs = { "r", "U" },
        rhs = "<cmd>ta<cr>"
    }, {
        lhs = "i",
        rhs = function()
            mods["submode"]:leave()
            vim.api.nvim_input("<insert>")
        end
    })

    -- Autocommand for submodes
    -- DocReader
    vim.api.nvim_create_augroup("DocReaderAutocmds", {})
    vim.api.nvim_create_autocmd({
        "BufEnter", "BufLeave"
    }, {
        group = "DocReaderAutocmds",
        pattern = "*",
        callback = function(opt)
            if vim.opt.ft:get() == "help" then
                if opt.event == "BufEnter" then
                    mods["submode"]:enter("DocReader")
                else
                    mods["submode"]:leave()
                end
            end
        end
    })
end

return setup
