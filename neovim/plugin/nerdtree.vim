" --------------------------------------
" 動作関係
" --------------------------------------
" nerdtreeを開く設定
augroup nerdtree_open
    autocmd!
    autocmd vimenter * NERDTree | wincmd p
    autocmd TabNew * NERDTree | wincmd p
augroup END
