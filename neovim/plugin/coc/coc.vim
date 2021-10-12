" --------------------------------------
" メモ書き
" --------------------------------------
" coc-java     -> * OpenJDKを入れる
" coc-json     -> * 特になし
" coc-tsserver -> * 特になし
" coc-vimlsp   -> * 特になし
" coc-clangd   -> * clangdをインストールしてパスを通す
" coc-texlab   -> * texlabをインストールしてパスを通す
" coc-pyright  -> * 特になし
" coc-rls      -> * 特になし


" --------------------------------------
" 動作設定
" --------------------------------------
" 入れるextensionを設定
" texlabとclangdが必須
let g:coc_global_extensions = [
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-clangd',
    \ 'coc-texlab',
    \ 'coc-pyright',
    \ 'coc-rls'
    \ ]

" 設定ファイルの場所を変更
let g:coc_config_home = '~/dotfiles/neovim/plugin/coc'

" データフォルダの場所を変更
let g:coc_data_home = '~/.config/nvim/coc'

" エラーや警告を表示する欄を常に表示
set signcolumn=yes


" --------------------------------------
" 補完機能の設定
" --------------------------------------
" 補完機能の動き
set completeopt=menu,preview,noinsert
