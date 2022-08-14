-- Memo: vim.keymap.set dosen't accept noremap (only accept remap). See neovim/runtime/lua/vim/keymap.lua

-- Leader keys
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>t", "[TabPage]", { remap = true })
vim.keymap.set("n", "<Leader>w", "[Window]",  { remap = true })
vim.keymap.set("n", "<Leader>s", "[Split]",   { remap = true })

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

-- Default keymaps for normal mode
vim.keymap.set("i", "jj",  "<ESC>")
vim.keymap.set("i", "{",   "{}<Left>")
vim.keymap.set("i", "[",   "[]<Left>")
vim.keymap.set("i", "(",   "()<Left>")
vim.keymap.set("i", [[']], [[''<Left>]])
vim.keymap.set("i", [["]], [[""<Left>]])
vim.keymap.set("i", "{<Enter>", "{}<Left><CR><ESC><S-o>")
vim.keymap.set("i", "[<Enter>", "[]<Left><CR><ESC><S-o>")
vim.keymap.set("i", "(<Enter>", "()<Left><CR><ESC><S-o>")
