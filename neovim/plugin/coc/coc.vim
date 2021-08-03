" --------------------------------------
" 動作設定
" --------------------------------------
" 入れるextensionを設定
" texlabとclangdが必須
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-clangd',
    \ 'coc-texlab'
    \ ]

" 設定ファイルの場所を変更
let g:coc_config_home = '~/dotfiles/neovim/plugin/coc'

" データフォルダの場所を変更
let g:coc_data_home = '~/.config/nvim/coc'

" エラーや警告を表示する欄を常に表示
set signcolumn=yes
