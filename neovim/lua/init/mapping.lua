-- --------------------
-- Variable for config
-- --------------------
-- Option
local default    = { noremap = true, silent = true }
local silent_off = { noremap = true, silent = false }


-- --------------------
-- Config of leader key
-- --------------------
-- Use space key as basic leader
vim.g.mapleader = ' '
-- Leader for basic key mapping
vim.api.nvim_set_keymap('n', '<Leader>w', '[Window]',    {})
vim.api.nvim_set_keymap('n', '<Leader>t', '[Tab]',       {})
vim.api.nvim_set_keymap('n', '<Leader>s', '[Split]',     {})

-- Use s key as plugin leader
vim.g.mapleader = 's'
-- Leader for plugin key mapping
vim.api.nvim_set_keymap('n', '<Leader>h', '[Hop]',       {})
vim.api.nvim_set_keymap('n', '<Leader>f', '[Floaterm]',  {})
vim.api.nvim_set_keymap('n', '<Leader>t', '[Telescope]', {})


-- ---------------------------------
-- Basic key mapping for normal mode
-- ---------------------------------
-- Tab page
-- Open or close file in tab page
vim.api.nvim_set_keymap('n', '[Tab]n', ':tabnew<Space>',   silent_off)
vim.api.nvim_set_keymap('n', '[Tab]c', ':tabclose<CR>',    default)
vim.api.nvim_set_keymap('n', '[Tab]C', ':tabonly<CR>',     default)
-- Move between tabes
vim.api.nvim_set_keymap('n', '[Tab]l',  'gt',              default)
vim.api.nvim_set_keymap('n', '[Tab]h',  'gT',              default)
-- Move tabe page
vim.api.nvim_set_keymap('n', '[Tab]L',  ':+tabmove<CR>',   default)
vim.api.nvim_set_keymap('n', '[Tab]H',  ':-tabmove<CR>',   default)

-- Window
-- Move between windows
vim.api.nvim_set_keymap('n', '[Window]j', '<C-w>j',        default)
vim.api.nvim_set_keymap('n', '[Window]k', '<C-w>k',        default)
vim.api.nvim_set_keymap('n', '[Window]h', '<C-w>h',        default)
vim.api.nvim_set_keymap('n', '[Window]l', '<C-w>l',        default)
vim.api.nvim_set_keymap('n', '[Window]J', '<C-w>J',        default)
vim.api.nvim_set_keymap('n', '[Window]K', '<C-w>K',        default)
vim.api.nvim_set_keymap('n', '[Window]H', '<C-w>H',        default)
vim.api.nvim_set_keymap('n', '[Window]L', '<C-w>L',        default)
-- Change window width and height
vim.api.nvim_set_keymap('n', '[Window]<', '10<C-w><',      default)
vim.api.nvim_set_keymap('n', '[Window]>', '10<C-w>>',      default)
vim.api.nvim_set_keymap('n', '[Window]+', '10<C-w>+',      default)
vim.api.nvim_set_keymap('n', '[Window]-', '10<C-w>-',      default)

-- Split window
vim.api.nvim_set_keymap('n', '[Split]j', ':sp<CR><C-w>j',  default)
vim.api.nvim_set_keymap('n', '[Split]k', ':sp<CR><C-w>k',  default)
vim.api.nvim_set_keymap('n', '[Split]h', ':vsp<CR><C-w>h', default)
vim.api.nvim_set_keymap('n', '[Split]l', ':vsp<CR><C-w>l', default)

-- Move as displayed row
vim.api.nvim_set_keymap('n', 'j',        'gj',             default)
vim.api.nvim_set_keymap('n', 'k',        'gk',             default)
vim.api.nvim_set_keymap('n', 'gj',       'j',              default)
vim.api.nvim_set_keymap('n', 'gk',       'k',              default)


-- ---------------------------------
-- Basic key mapping for insert mode
-- ---------------------------------
-- Use jj to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>',                        default)

-- Automatically complete brackets and quotation
vim.api.nvim_set_keymap('i', '{',   '{}<Left>',                    default)
vim.api.nvim_set_keymap('i', '[',   '[]<Left>',                    default)
vim.api.nvim_set_keymap('i', '(',   '()<Left>',                    default)
vim.api.nvim_set_keymap('i', [[']], [[''<Left>]],                  default)
vim.api.nvim_set_keymap('i', [["]], [[""<Left>]],                  default)

-- Make brackets feel good
vim.api.nvim_set_keymap('i', '{<Enter>', '{}<Left><CR><ESC><S-o>', default)
vim.api.nvim_set_keymap('i', '[<Enter>', '[]<Left><CR><ESC><S-o>', default)
vim.api.nvim_set_keymap('i', '(<Enter>', '()<Left><CR><ESC><S-o>', default)


-- -----------------------------------
-- Basic key mapping for terminal mode
-- -----------------------------------
-- Use Alt-(jj) and Alt-ESC to go to normal mode
vim.api.nvim_set_keymap('t', '<A-j><A-j>', [[<C-\><C-n>]], default)
vim.api.nvim_set_keymap('t', '<A-ESC>',    [[<C-\><C-n>]], default)
