-- ------------------
-- Settings for input
-- ------------------
-- Tab chareacter and indent
-- Normal settings
vim.o.softtabstop = 4
vim.o.shiftwidth  = 4
vim.o.tabstop     = 4
vim.o.expandtab   = true
vim.o.autoindent  = true    

-- Share clipboard
vim.o.clipboard   = 'unnamedplus'


-- -------------------
-- Settings for screen
-- -------------------
-- Don't display command
vim.o.showcmd        = false

-- Display row number
vim.o.number         = true
vim.o.relativenumber = true

-- Disable beep and flashing screen
vim.o.belloff        = 'all'

-- Enable syntax
vim.o.syntax         = 'on'

-- Show current file name above window
vim.o.title          = true


-- ------------------
-- Settings for files
-- ------------------
-- Enable modeline
vim.o.modeline = true

-- Detect file type and load indent, plugin
vim.cmd('filetype plugin indent on')

-- If a file was updated other place, reload the file
vim.o.autoread = true

-- Don't make undo file
vim.o.undofile = false

-- Don't make backup file
vim.o.backup   = false

-- Don't make swap file
vim.o.swapfile = false
