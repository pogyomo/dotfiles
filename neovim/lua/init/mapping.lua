-- --------------------
-- Config of leader key
-- --------------------
-- Use space key as leader
vim.g.mapleader = ' '
-- Leader for basic
vim.api.nvim_set_keymap('n', '<Leader>w', '[Window]',          {})
vim.api.nvim_set_keymap('n', '<Leader>t', '[Tab]',             {})
vim.api.nvim_set_keymap('n', '<Leader>s', '[Split]',           {})
-- Leader for plugin
vim.api.nvim_set_keymap('n', '<Leader>p', '[PreviewMarkdown]', {})
vim.api.nvim_set_keymap('n', '<Leader>h', '[hop]',             {})
vim.api.nvim_set_keymap('n', '<Leader>o', '[coc]',             {})

-- Use s key as leader
vim.g.mapleader = 's'
-- Leader for basic
vim.api.nvim_set_keymap('n', '<Leader>w', '[Window]',          {})
vim.api.nvim_set_keymap('n', '<Leader>t', '[Tab]',             {})
vim.api.nvim_set_keymap('n', '<Leader>s', '[Split]',           {})
-- Leader for plugin
vim.api.nvim_set_keymap('n', '<Leader>p', '[PreviewMarkdown]', {})
vim.api.nvim_set_keymap('n', '<Leader>h', '[hop]',             {})
vim.api.nvim_set_keymap('n', '<Leader>o', '[coc]',             {})


-- -----------------------------------
-- Key mapping for normal mode (basic)
-- -----------------------------------
-- Tab page
-- Open or close file in tab page
vim.api.nvim_set_keymap('n', '[Tab]o',  ':tabnew<Space>',  { noremap = true })
vim.api.nvim_set_keymap('n', '[Tab]co', ':tabclose<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Tab]ca', ':tabonly<CR>',    { noremap = true, silent = true })
-- Move between tabes
vim.api.nvim_set_keymap('n', '[Tab]l',  'gt',              { noremap = true })
vim.api.nvim_set_keymap('n', '[Tab]h',  'gT',              { noremap = true })
-- Move tabe page
vim.api.nvim_set_keymap('n', '[Tab]L',  ':+tabmove<CR>',   { noremap = true })
vim.api.nvim_set_keymap('n', '[Tab]H',  ':-tabmove<CR>',   { noremap = true })

-- Window
-- Move between windows
vim.api.nvim_set_keymap('n', '[Window]j', '<C-w>j',        { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]k', '<C-w>k',        { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]h', '<C-w>h',        { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]l', '<C-w>l',        { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]J', '<C-w>J',        { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]K', '<C-w>K',        { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]H', '<C-w>H',        { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]L', '<C-w>L',        { noremap = true })
-- Change window width and height
vim.api.nvim_set_keymap('n', '[Window]<', '10<C-w><',      { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]>', '10<C-w>>',      { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]+', '10<C-w>+',      { noremap = true })
vim.api.nvim_set_keymap('n', '[Window]-', '10<C-w>-',      { noremap = true })

-- Split window
vim.api.nvim_set_keymap('n', '[Split]j', ':sp<CR><C-w>j',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Split]k', ':sp<CR><C-w>k',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Split]h', ':vsp<CR><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Split]l', ':vsp<CR><C-w>l', { noremap = true, silent = true })

-- Move as displayed row
vim.api.nvim_set_keymap('n', 'j',        'gj',             { noremap = true })
vim.api.nvim_set_keymap('n', 'k',        'gk',             { noremap = true })
vim.api.nvim_set_keymap('n', 'gj',       'j',              { noremap = true })
vim.api.nvim_set_keymap('n', 'gk',       'k',              { noremap = true })


-- -----------------------------------
-- Key mapping for insert mode (basic)
-- -----------------------------------
-- Use jj to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>',                        { noremap = true, silent = true })

-- Automatically complete brackets and quotation
vim.api.nvim_set_keymap('i', '{',  '{}<Left>',                     { noremap = true })
vim.api.nvim_set_keymap('i', '[',  '[]<Left>',                     { noremap = true })
vim.api.nvim_set_keymap('i', '(',  '()<Left>',                     { noremap = true })
vim.api.nvim_set_keymap('i', '\'', '\'\'<Left>',                   { noremap = true })
vim.api.nvim_set_keymap('i', '\"', '\"\"<Left>',                   { noremap = true })

-- Make brackets feel good
vim.api.nvim_set_keymap('i', '{<Enter>', '{}<Left><CR><ESC><S-o>', { noremap = true })
vim.api.nvim_set_keymap('i', '[<Enter>', '[]<Left><CR><ESC><S-o>', { noremap = true })
vim.api.nvim_set_keymap('i', '(<Enter>', '()<Left><CR><ESC><S-o>', { noremap = true })
