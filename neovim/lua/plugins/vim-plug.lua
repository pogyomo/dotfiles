-- ---------------
-- Register plugin
-- ---------------
-- Need to be called
vim.fn['plug#begin']([[~/.config/nvim/plugged]])

-- Write like Plug
-- Plugin for basic
vim.cmd([[Plug 'tomasr/molokai']])        -- colorscheme
vim.cmd([[Plug 'phaazon/hop.nvim']])      -- easymotion like plugin

-- Need to be called
vim.fn['plug#end']()
