-- Keymaps for normal mode
-- Move display line.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Keymaps for insert mode
-- Misc
vim.keymap.set("i", "jj",  "<ESC>")

-- Keymaps for terminal mode
-- Enable to exit from terminal mode by <ESC> like insert mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
