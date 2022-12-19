-- TODO: Change the behavior of WinResizer:
--       Move the separator of windows instead of change the size of window.

local util = require("utils.require")
local mods = util.require{
    "submode",
    "core.settings.keymaps.utils"
}
if not mods then
    return
end

local submode = mods["submode"]
local utils   = mods["core.settings.keymaps.utils"]

-- Leader keys
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>t", "[TabPage]", { remap = true })
vim.keymap.set("n", "<Leader>w", "[Window]",  { remap = true })
vim.keymap.set("n", "<Leader>s", "[Split]",   { remap = true })
vim.keymap.set("n", "<Leader>r", "[Resize]",  { remap = true })
vim.keymap.set("n", "<Leader>l", "[Lsp]",     { remap = true })

-- Keymaps for normal mode
-- Movement
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- Tab page 
vim.keymap.set("n", "[TabPage]l", "gt")
vim.keymap.set("n", "[TabPage]h", "gT")
vim.keymap.set("n", "[TabPage]L", "<cmd>+tabmove<CR>")
vim.keymap.set("n", "[TabPage]H", "<cmd>-tabmove<CR>")
-- Window
vim.keymap.set("n", "[Window]j", "<C-w>j")
vim.keymap.set("n", "[Window]k", "<C-w>k")
vim.keymap.set("n", "[Window]h", "<C-w>h")
vim.keymap.set("n", "[Window]l", "<C-w>l")
vim.keymap.set("n", "[Window]J", "<C-w>J")
vim.keymap.set("n", "[Window]K", "<C-w>K")
vim.keymap.set("n", "[Window]H", "<C-w>H")
vim.keymap.set("n", "[Window]L", "<C-w>L")
-- Split
vim.keymap.set("n", "[Split]j", "<cmd>sp<CR><C-w>j")
vim.keymap.set("n", "[Split]k", "<cmd>sp<CR><C-w>k")
vim.keymap.set("n", "[Split]h", "<cmd>vsp<CR><C-w>h")
vim.keymap.set("n", "[Split]l", "<cmd>vsp<CR><C-w>l")

-- Keymaps for insert mode
-- Misc
vim.keymap.set("i", "jj",  "<ESC>")

-- Keymaps for terminal mode
-- Enable to exit from terminal mode by <ESC> like insert mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")

-- Settings for submodes
-- Variables
local leave = { "q", "<ESC>" }
-- Window resizer
submode:create("WinResizer", {
    mode = "n",
    enter = "[Resize]",
    leave = leave
})
submode:register("WinResizer", {
    lhs = "j",
    rhs = function() utils:win_resize_to("down") end
}, {
    lhs = "k",
    rhs = function() utils:win_resize_to("up") end
}, {
    lhs = "h",
    rhs = function() utils:win_resize_to("left") end
}, {
    lhs = "l",
    rhs = function() utils:win_resize_to("right") end
})
-- Lsp operator
submode:create("LspOperator", {
    mode = "n",
    enter = "[Lsp]",
    leave = leave
})
submode:register("LspOperator", {
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
submode:create("DocReader", {
    mode = "n",
})
submode:register("DocReader", {
    lhs = "<Enter>",
    rhs = "<C-]>"
}, {
    lhs = "u",
    rhs = "<cmd>po<cr>"
}, {
    lhs = "r",
    rhs = "<cmd>ta<cr>"
}, {
    lhs = "i",
    rhs = function()
        submode:leave()
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
                submode:enter("DocReader")
            else
                submode:leave()
            end
        end
    end
})
