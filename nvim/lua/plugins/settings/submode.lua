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
    vim.g.mapleader = " "
    vim.keymap.set("n", "<Leader>l", "[Lsp]",    { remap = true })
    vim.keymap.set("n", "<Leader>t", "[Tab]",    { remap = true })
    vim.keymap.set("n", "<Leader>w", "[Window]", { remap = true })
    vim.keymap.set("n", "<Leader>s", "[Split]",  { remap = true })
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
    -- Tab manager
    mods["submode"]:create("TabManager", {
        mode = "n",
        enter = "[Tab]",
        leave = leave
    }, {
        lhs = { "l", "h" },
        rhs = function(lhs)
            mods["submode"]:leave()
            return lhs == "l" and "gt" or "gT"
        end,
        opts = {
            expr = true
        }
    }, {
        lhs = { "L", "H" },
        rhs = function(lhs)
            mods["submode"]:leave()
            return ("<cmd>%stabmove<cr>"):format(lhs == "L" and "+" or "-")
        end,
        opts = {
            expr = true
        }
    })
    -- Window manager
    mods["submode"]:create("WindowManager", {
        mode = "n",
        enter = "[Window]",
        leave = leave
    }, {
        lhs = { "j", "k", "h", "l", "J", "K", "H", "L" },
        rhs = function(lhs)
            mods["submode"]:leave()
            return ("<C-w>%s"):format(lhs)
        end,
        opts = {
            expr = true
        }
    })
    -- Window splitter
    mods["submode"]:create("WindowSplit", {
        mode = "n",
        enter = "[Split]",
        leave = leave
    }, {
        lhs = { "j", "k", "h", "l" },
        rhs = function(lhs)
            mods["submode"]:leave()
            local prefix = (lhs == "h" or lhs == "l") and "v" or ""
            return ("<cmd>%ssp<cr><C-w>%s"):format(prefix, lhs)
        end,
        opts = {
            expr = true
        }
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
    -- Better leave
    local bl_timer
    mods["submode"]:create("BetterLeavePre", {
        mode = "i",
        show_mode = false,
        enter = "j",
        enter_cb = function()
            vim.api.nvim_feedkeys("j", "n", true)
            mods["submode"]:enter("BetterLeave")
            bl_timer = vim.loop.new_timer()
            bl_timer:start(500, 0, vim.schedule_wrap(function()
                mods["submode"]:leave()
                bl_timer:stop()
                bl_timer:close()
            end))
        end
    })
    mods["submode"]:create("BetterLeave", {
        mode = "i",
        show_mode = false
    }, {
        lhs = {
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
            "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
            "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
        },
        rhs = function(lhs)
            mods["submode"]:leave()
            if lhs == "j" then
                bl_timer:stop()
                bl_timer:close()
                local keys = "<BS><ESC>"
                keys = vim.api.nvim_replace_termcodes(keys, true, true, true)
                vim.api.nvim_feedkeys(keys, "n", true)
            else
                return lhs
            end
        end,
        opts = { expr = true }
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
