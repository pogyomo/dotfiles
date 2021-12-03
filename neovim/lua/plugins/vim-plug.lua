-- ---------------
-- Register plugin
-- ---------------
-- Need to be called
vim.fn['plug#begin']([[~/.config/nvim/plugged]])

-- Write like Plug
-- Plugin for basic
vim.cmd([[Plug 'tomasr/molokai']])                -- Colorscheme
vim.cmd([[Plug 'phaazon/hop.nvim']])              -- Easymotion like plugin
-- Plugin for syntax highlighting
vim.cmd([[Plug 'thentenaar/vim-syntax-obscure']]) -- Highlight for nesasm and cc65
vim.cmd([[Plug 'bfrg/vim-cpp-modern']])           -- Highlight for c/c++

-- Need to be called
vim.fn['plug#end']()
