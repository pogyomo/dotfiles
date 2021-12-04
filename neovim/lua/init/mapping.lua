-- --------------------
-- Variable for config
-- --------------------
-- Option
local opt_normal = { noremap = true, silent = true }
local opt_expr   = { noremap = true, silent = true, expr = true }


-- -------------------
-- Function for config
-- -------------------
-- Escape keycode
local function escape_keycode(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Return keycode depend on completion window is displayed or not
function _G.is_completion(n)
    if n == 0 then
        return vim.fn.pumvisible() == 1 and escape_keycode('<C-y>')  or escape_keycode('<CR>')
    elseif n == 1 then
        return vim.fn.pumvisible() == 1 and escape_keycode('<Up>')   or escape_keycode('<C-p>')
    else
        return vim.fn.pumvisible() == 1 and escape_keycode('<Down>') or escape_keycode('<C-n>')
    end
end


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
vim.api.nvim_set_keymap('n', '[Tab]o',  ':tabnew<Space>',  opt_normal)
vim.api.nvim_set_keymap('n', '[Tab]co', ':tabclose<CR>',   opt_normal)
vim.api.nvim_set_keymap('n', '[Tab]ca', ':tabonly<CR>',    opt_normal)
-- Move between tabes
vim.api.nvim_set_keymap('n', '[Tab]l',  'gt',              opt_normal)
vim.api.nvim_set_keymap('n', '[Tab]h',  'gT',              opt_normal)
-- Move tabe page
vim.api.nvim_set_keymap('n', '[Tab]L',  ':+tabmove<CR>',   opt_normal)
vim.api.nvim_set_keymap('n', '[Tab]H',  ':-tabmove<CR>',   opt_normal)

-- Window
-- Move between windows
vim.api.nvim_set_keymap('n', '[Window]j', '<C-w>j',        opt_normal)
vim.api.nvim_set_keymap('n', '[Window]k', '<C-w>k',        opt_normal)
vim.api.nvim_set_keymap('n', '[Window]h', '<C-w>h',        opt_normal)
vim.api.nvim_set_keymap('n', '[Window]l', '<C-w>l',        opt_normal)
vim.api.nvim_set_keymap('n', '[Window]J', '<C-w>J',        opt_normal)
vim.api.nvim_set_keymap('n', '[Window]K', '<C-w>K',        opt_normal)
vim.api.nvim_set_keymap('n', '[Window]H', '<C-w>H',        opt_normal)
vim.api.nvim_set_keymap('n', '[Window]L', '<C-w>L',        opt_normal)
-- Change window width and height
vim.api.nvim_set_keymap('n', '[Window]<', '10<C-w><',      opt_normal)
vim.api.nvim_set_keymap('n', '[Window]>', '10<C-w>>',      opt_normal)
vim.api.nvim_set_keymap('n', '[Window]+', '10<C-w>+',      opt_normal)
vim.api.nvim_set_keymap('n', '[Window]-', '10<C-w>-',      opt_normal)

-- Split window
vim.api.nvim_set_keymap('n', '[Split]j', ':sp<CR><C-w>j',  opt_normal)
vim.api.nvim_set_keymap('n', '[Split]k', ':sp<CR><C-w>k',  opt_normal)
vim.api.nvim_set_keymap('n', '[Split]h', ':vsp<CR><C-w>h', opt_normal)
vim.api.nvim_set_keymap('n', '[Split]l', ':vsp<CR><C-w>l', opt_normal)

-- Move as displayed row
vim.api.nvim_set_keymap('n', 'j',        'gj',             opt_normal)
vim.api.nvim_set_keymap('n', 'k',        'gk',             opt_normal)
vim.api.nvim_set_keymap('n', 'gj',       'j',              opt_normal)
vim.api.nvim_set_keymap('n', 'gk',       'k',              opt_normal)


-- ----------------------------------
-- Plugin key mapping for normal mode
-- ----------------------------------
-- hop.nvim
vim.api.nvim_set_keymap('n', '[Hop]w',        ':HopWord<CR>',      opt_normal)
vim.api.nvim_set_keymap('n', '[Hop]p',        ':HopPattern<CR>',   opt_normal)
vim.api.nvim_set_keymap('n', '[Hop]c<Enter>', ':HopChar1<CR>',     opt_normal)
vim.api.nvim_set_keymap('n', '[Hop]cc',       ':HopChar2<CR>',     opt_normal)
vim.api.nvim_set_keymap('n', '[Hop]l',        ':HopLine<CR>',      opt_normal)
vim.api.nvim_set_keymap('n', '[Hop]s',        ':HopLineStart<CR>', opt_normal)


-- ---------------------------------
-- Basic key mapping for insert mode
-- ---------------------------------
-- Use jj to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>',                        opt_normal)

-- Automatically complete brackets and quotation
vim.api.nvim_set_keymap('i', '{',   '{}<Left>',                    opt_normal)
vim.api.nvim_set_keymap('i', '[',   '[]<Left>',                    opt_normal)
vim.api.nvim_set_keymap('i', '(',   '()<Left>',                    opt_normal)
vim.api.nvim_set_keymap('i', [[']], [[''<Left>]],                  opt_normal)
vim.api.nvim_set_keymap('i', [["]], [[""<Left>]],                  opt_normal)

-- Make brackets feel good
vim.api.nvim_set_keymap('i', '{<Enter>', '{}<Left><CR><ESC><S-o>', opt_normal)
vim.api.nvim_set_keymap('i', '[<Enter>', '[]<Left><CR><ESC><S-o>', opt_normal)
vim.api.nvim_set_keymap('i', '(<Enter>', '()<Left><CR><ESC><S-o>', opt_normal)

-- Completion
-- When completion window is displayed, use return key as C-y
vim.api.nvim_set_keymap('i', '<CR>',  'v:lua.is_completion(0)',    opt_expr)
-- When completion window is displayed, use C-p/C-n as Up/Down key
vim.api.nvim_set_keymap('i', '<C-p>', 'v:lua.is_completion(1)',    opt_expr)
vim.api.nvim_set_keymap('i', '<C-n>', 'v:lua.is_completion(2)',    opt_expr)


-- -----------------------------------
-- Basic key mapping for terminal mode
-- -----------------------------------
-- Use jj to go to normal mode
vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], opt_normal)
vim.api.nvim_set_keymap('t', 'jj',    [[<C-\><C-n>]], opt_normal)
