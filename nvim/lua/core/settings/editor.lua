-- Settings for input
-- When press tab key, insert 4 white spaces
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Settings for visual
-- Do not show command
vim.opt.showcmd = false
-- Show line nubmer
vim.opt.number = true
-- When scrolling, take distance between cursor and screen edge 
vim.opt.scrolloff = 5
-- Highlight current cursor position
vim.opt.cursorline = true
-- Get true color 
vim.opt.termguicolors = true

-- Settings for search
-- Don't distinguish upper and lower character 
vim.opt.ignorecase = true
-- If upper character is contained, disenable ignorecase
vim.opt.smartcase = true
