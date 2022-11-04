local util = require("utils")
local mods = util.requires{
    "submode",
    "core.settings.keymaps.utils",
}
if util.is_empty(mods) then
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
vim.keymap.set("n", "<Leader>d", "[Doc]",     { remap = true })

-- Default keymaps for normal mode
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
-- Misc
vim.keymap.set("i", "jj",  "<ESC>")
vim.keymap.set("i", "{",   "{}<Left>")
vim.keymap.set("i", "[",   "[]<Left>")
vim.keymap.set("i", "(",   "()<Left>")
vim.keymap.set("i", [[']], [[''<Left>]])
vim.keymap.set("i", [["]], [[""<Left>]])
vim.keymap.set("i", "{<Enter>", "{}<Left><CR><ESC><S-o>")
vim.keymap.set("i", "[<Enter>", "[]<Left><CR><ESC><S-o>")
vim.keymap.set("i", "(<Enter>", "()<Left><CR><ESC><S-o>")

-- Keymaps for submodes
-- Variables
local leave = { "q", "<ESC>" }
-- Window resizer
-- HACK: Need to change movement of WinResize.
submode:create("WinResize", {
    mode = "n",
    enter = "[Resize]",
    leave = leave
})
submode:register("WinResize", {
    lhs = "j",
    rhs = function() utils:win_resize_to("down") end
})
submode:register("WinResize", {
    lhs = "k",
    rhs = function() utils:win_resize_to("up") end
})
submode:register("WinResize", {
    lhs = "h",
    rhs = function() utils:win_resize_to("left") end
})
submode:register("WinResize", {
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
})
submode:register("LspOperator", {
    lhs = "D",
    rhs = vim.lsp.buf.declaration
})
submode:register("LspOperator", {
    lhs = "H",
    rhs = vim.lsp.buf.hover
})
submode:register("LspOperator", {
    lhs = "i",
    rhs = vim.lsp.buf.implementation
})
submode:register("LspOperator", {
    lhs = "r",
    rhs = vim.lsp.buf.references
})
-- Document reader
submode:create("DocReader", {
    mode = "n",
    enter = "[Doc]",
    leave = leave
})
submode:register("DocReader", {
    lhs = "<Enter>",
    rhs = "<C-]>"
})
submode:register("DocReader", {
    lhs = "u",
    rhs = "<cmd>po<cr>"
})
submode:register("DocReader", {
    lhs = "r",
    rhs = "<cmd>ta<cr>"
})
