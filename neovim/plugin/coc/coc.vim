" --------------------------------------
" メモ書き
" --------------------------------------
" clangd -> * llvmをインストールしてパスを通す
"           * 'mingw-w64-x86_64-clang'と'mingw-w64-x86_64-clang-tools-extra'を入れる
" texlab -> * texlabをインストールしてパスを通す


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
    \ 'coc-omnisharp',
    \ 'coc-texlab',
    \ 'coc-pyright'
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
