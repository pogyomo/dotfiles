-- --------------------
-- Variable for config
-- --------------------
-- Option
local opts = { noremap = true, silent = true }


-- --------------------
-- Config of leader key
-- --------------------
-- Use space key as leader
vim.g.mapleader = ' '
-- Leader for basic key mapping
vim.api.nvim_set_keymap('n', '<Leader>w', '[Window]',   {})
vim.api.nvim_set_keymap('n', '<Leader>t', '[Tab]',      {})
vim.api.nvim_set_keymap('n', '<Leader>s', '[Split]',    {})
-- Leader for plugin key mapping
vim.api.nvim_set_keymap('n', '<Leader>h', '[Hop]',      {})
vim.api.nvim_set_keymap('n', '<Leader>g', '[Fugitive]', {})

-- Use s key as leader
vim.g.mapleader = 's'
-- Leader for basic key mapping
vim.api.nvim_set_keymap('n', '<Leader>w', '[Window]',   {})
vim.api.nvim_set_keymap('n', '<Leader>t', '[Tab]',      {})
vim.api.nvim_set_keymap('n', '<Leader>s', '[Split]',    {})
-- Leader for plugin key mapping
vim.api.nvim_set_keymap('n', '<Leader>h', '[Hop]',      {})
vim.api.nvim_set_keymap('n', '<Leader>g', '[Fugitive]', {})


-- ---------------------------------
-- Basic key mapping for normal mode
-- ---------------------------------
-- Tab page
-- Open or close file in tab page
vim.api.nvim_set_keymap('n', '[Tab]o',  ':tabnew<Space>',  opts)
vim.api.nvim_set_keymap('n', '[Tab]co', ':tabclose<CR>',   opts)
vim.api.nvim_set_keymap('n', '[Tab]ca', ':tabonly<CR>',    opts)
-- Move between tabes
vim.api.nvim_set_keymap('n', '[Tab]l',  'gt',              opts)
vim.api.nvim_set_keymap('n', '[Tab]h',  'gT',              opts)
-- Move tabe page
vim.api.nvim_set_keymap('n', '[Tab]L',  ':+tabmove<CR>',   opts)
vim.api.nvim_set_keymap('n', '[Tab]H',  ':-tabmove<CR>',   opts)

-- Window
-- Move between windows
vim.api.nvim_set_keymap('n', '[Window]j', '<C-w>j',        opts)
vim.api.nvim_set_keymap('n', '[Window]k', '<C-w>k',        opts)
vim.api.nvim_set_keymap('n', '[Window]h', '<C-w>h',        opts)
vim.api.nvim_set_keymap('n', '[Window]l', '<C-w>l',        opts)
vim.api.nvim_set_keymap('n', '[Window]J', '<C-w>J',        opts)
vim.api.nvim_set_keymap('n', '[Window]K', '<C-w>K',        opts)
vim.api.nvim_set_keymap('n', '[Window]H', '<C-w>H',        opts)
vim.api.nvim_set_keymap('n', '[Window]L', '<C-w>L',        opts)
-- Change window width and height
vim.api.nvim_set_keymap('n', '[Window]<', '10<C-w><',      opts)
vim.api.nvim_set_keymap('n', '[Window]>', '10<C-w>>',      opts)
vim.api.nvim_set_keymap('n', '[Window]+', '10<C-w>+',      opts)
vim.api.nvim_set_keymap('n', '[Window]-', '10<C-w>-',      opts)

-- Split window
vim.api.nvim_set_keymap('n', '[Split]j', ':sp<CR><C-w>j',  opts)
vim.api.nvim_set_keymap('n', '[Split]k', ':sp<CR><C-w>k',  opts)
vim.api.nvim_set_keymap('n', '[Split]h', ':vsp<CR><C-w>h', opts)
vim.api.nvim_set_keymap('n', '[Split]l', ':vsp<CR><C-w>l', opts)

-- Move as displayed row
vim.api.nvim_set_keymap('n', 'j',        'gj',             opts)
vim.api.nvim_set_keymap('n', 'k',        'gk',             opts)
vim.api.nvim_set_keymap('n', 'gj',       'j',              opts)
vim.api.nvim_set_keymap('n', 'gk',       'k',              opts)


-- ----------------------------------
-- Plugin key mapping for normal mode
-- ----------------------------------
-- hop.nvim
vim.api.nvim_set_keymap('n', '[Hop]w',        ':HopWord<CR>',      opts)
vim.api.nvim_set_keymap('n', '[Hop]p',        ':HopPattern<CR>',   opts)
vim.api.nvim_set_keymap('n', '[Hop]c<Enter>', ':HopChar1<CR>',     opts)
vim.api.nvim_set_keymap('n', '[Hop]cc',       ':HopChar2<CR>',     opts)
vim.api.nvim_set_keymap('n', '[Hop]l',        ':HopLine<CR>',      opts)
vim.api.nvim_set_keymap('n', '[Hop]s',        ':HopLineStart<CR>', opts)


-- ---------------------------------
-- Basic key mapping for insert mode
-- ---------------------------------
-- Use jj to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>',                        opts)

-- Automatically complete brackets and quotation
vim.api.nvim_set_keymap('i', '{',   '{}<Left>',                    opts)
vim.api.nvim_set_keymap('i', '[',   '[]<Left>',                    opts)
vim.api.nvim_set_keymap('i', '(',   '()<Left>',                    opts)
vim.api.nvim_set_keymap('i', [[']], [[''<Left>]],                  opts)
vim.api.nvim_set_keymap('i', [["]], [[""<Left>]],                  opts)

-- Make brackets feel good
vim.api.nvim_set_keymap('i', '{<Enter>', '{}<Left><CR><ESC><S-o>', opts)
vim.api.nvim_set_keymap('i', '[<Enter>', '[]<Left><CR><ESC><S-o>', opts)
vim.api.nvim_set_keymap('i', '(<Enter>', '()<Left><CR><ESC><S-o>', opts)


-- -----------------------------------
-- Basic key mapping for terminal mode
-- -----------------------------------
-- Use jj to go to normal mode
vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], opts)
vim.api.nvim_set_keymap('t', 'jj',    [[<C-\><C-n>]], opts)
