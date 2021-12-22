" ------------------
" Settings for input
" ------------------
" Tab chareacter and indent
" Normal settings
 set softtabstop=4
 set shiftwidth=4
 set tabstop=4
 set expandtab
 set autoindent

" Share clipboard
set clipboard=unnamedplus

" For backspace
set backspace=indent,eol,start


" -------------------
" Settings for screen
" -------------------
" Enable syntax
syntax on

" Don't display command
set noshowcmd

" Display row number
set number
set relativenumber

" Disable beep and flashing screen
set belloff=all

" Show current file name above window
set title

" Jump to corresponding backets when entered it
" and back to current position
set showmatch
set matchtime=2 " Time to jump (0.1 * x sec)

" Change internal encoding of vim as utf-8
set encoding=utf-8

" Measure for character corruption
set fileencodings=utf-8,cp932,enc-jp,sjis

" When scrolling, have some space
" between sursor and edge of screen
set scrolloff=5

" Highlight current cursor position
set cursorline


" -------------------
" Settings for search
" -------------------
" Enable increment search
set incsearch

" Don't distinguish upper and lower character 
set ignorecase

" If upper character is contained,
" disenable ignorecase
set smartcase


" ------------------
" Settings for files
" ------------------
" Detect file type and load indent, plugin
filetype plugin indent on

" Change filetype depend on extension
augroup change_ft
    autocmd!
    autocmd BufNewFile,BufRead *.tex set ft=tex
augroup END

" Enable modeline
set modeline

" If a file was updated other place, reload the file
set autoread

" Don't make undo file
set noundofile

" Don't make backup file
set nobackup

" Don't make swap file
set noswapfile


" --------------------
" Config of leader key
" --------------------
" Use space key as basic leader
let mapleader="\<Space>"
" Leader for basic key mapping
nmap <Leader>w [Window]
nmap <Leader>t [Tab]
nmap <Leader>s [Split]


" ---------------------------------
" Basic key mapping for normal mode
" ---------------------------------
" Tab page
" Open or close file in tab page
nnoremap [Tab]n :tabnew<Space>
nnoremap <Silent> [Tab]c :tabclose<CR>
nnoremap <Silent> [Tab]c :tabonly<CR>
" Move between tabes
nnoremap [Tab]l gt
nnoremap [Tab]h gT
" Move tabe page
nnoremap <silent> [Tab]L :+tabmove<CR>
nnoremap <silent> [Tab]H :-tabmove<CR>

" Window
" Move between windows
nnoremap [Window]j <C-w>j
nnoremap [Window]k <C-w>k
nnoremap [Window]h <C-w>h
nnoremap [Window]l <C-w>l
nnoremap [Window]J <C-w>J
nnoremap [Window]K <C-w>K
nnoremap [Window]H <C-w>H
nnoremap [Window]L <C-w>L
" Change window width and height
nnoremap [Window]< 10<C-w><
nnoremap [Window]> 10<C-w>>
nnoremap [Window]+ 10<C-w>+
nnoremap [Window]- 10<C-w>-

" Split window
nnoremap <silent> [Split]j :sp<CR><C-w>j
nnoremap <silent> [Split]k :sp<CR><C-w>k
nnoremap <silent> [Split]h :vsp<CR><C-w>h
nnoremap <silent> [Split]l :vsp<CR><C-w>l

" Move as displayed row
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


" ---------------------------------
" Basic key mapping for insert mode
" ---------------------------------
" Use jj to go to normal mode
inoremap jj <ESC>

" Automatically complete brackets and quotation
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" Make brackets feel good
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


" -----------------------------------
" Basic key mapping for terminal mode
" -----------------------------------
" Use Alt-(jj) and Alt-ESC to go to normal mode
tnoremap <A-j><A-j> <C-\><C-n>
tnoremap <A-ESC> <C-\><C-n>


" ----------------------
" Statusline and tabline
" ----------------------
set laststatus=2
set showtabline=2
