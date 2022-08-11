-- ------------------
-- Settings for input
-- ------------------
-- Tab chareacter and indent
-- Normal settings
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.tabstop     = 4
vim.opt.expandtab   = true
vim.opt.autoindent  = true

-- Share clipboard
vim.opt.clipboard   = 'unnamedplus'

-- For backspace
vim.opt.backspace   = 'indent,eol,start'

-- Disable mouse
vim.opt.mouse = ''


-- -------------------
-- Settings for screen
-- -------------------
-- Enable syntax
vim.cmd('syntax on')

-- Don't display command
vim.opt.showcmd        = false

-- Display row number
vim.opt.number         = true
vim.opt.relativenumber = true

-- Disable beep and flashing screen
vim.opt.belloff        = 'all'

-- Show current file name above window
vim.opt.title          = true

-- Jump to corresponding backets when entered it
-- and back to current position
vim.opt.showmatch      = true
vim.opt.matchtime      = 2 -- Time to jump (0.1 * x sec)

-- Change internal encoding of vim as utf-8
vim.opt.encoding       = 'utf-8'

-- Measure for character corruption
vim.opt.fileencodings  = 'utf-8, cp932, enc-jp, sjis'

-- When scrolling, have some space
-- between sursor and edge of screen
vim.opt.scrolloff      = 5

-- Highlight current cursor position
vim.opt.cursorline     = true

-- Adapt vim to true color
vim.opt.termguicolors  = true


-- -------------------
-- Settings for search
-- -------------------
-- Enable increment search
vim.opt.incsearch  = true

-- Don't distinguish upper and lower character 
vim.opt.ignorecase = true

-- If upper character is contained,
-- disenable ignorecase
vim.opt.smartcase  = true


-- ------------------
-- Settings for files
-- ------------------
-- Detect file type and load indent, plugin
vim.cmd('filetype plugin indent on')

-- Change filetype depend on extension
vim.cmd([[
augroup change_ft
    autocmd!
    autocmd BufNewFile,BufRead *.tex set ft=tex
augroup END
]])

-- Enable modeline
vim.opt.modeline = true

-- If a file was updated other place, reload the file
vim.opt.autoread = true

-- Don't make undo file
vim.opt.undofile = false

-- Don't make backup file
vim.opt.backup   = false

-- Don't make swap file
vim.opt.swapfile = false
