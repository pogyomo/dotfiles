" --------------------------------------
" 表示の設定
" --------------------------------------
set laststatus=2 "ステータスラインを常に表示する
set showtabline=2 "タブページを常に表示する


" --------------------------------------
" ステータスラインで使用する関数(標準)
" --------------------------------------
" ファイルパスと修正フラグを表示する
function! Plug_lightline_GetFileName()
    let filename = expand('%:p')
    if &modifiable == 0
        return filename.' -'
    elseif &modified == 1
        return filename.' +'
    else
        return filename
    endif
endfunction

" ヘルプバッファならHelpと返す
function! Plug_lightline_IsHelpBuffer()
    if &buftype == 'help'
        return 'Help'
    else
        return ''
    endif
endfunction

" プレビューバッファならPrevと返す
function! Plug_lightline_IsPreviewWindow()
    if &previewwindow == 1
        return 'Prev'
    else
        return ''
    endif
endfunction


" --------------------------------------
" ステータスラインで使用する関数(プラグイン)
" --------------------------------------
" 現在のブランチを取得
function! Plug_lightline_GetBranch()
    if FugitiveHead() == ''
        return ''
    else
        return ' '.FugitiveHead()
    endif
endfunction


" --------------------------------------
" タブページで使用する関数(標準)
" --------------------------------------
" タブのバッファの数を返す
function! Plug_lightline_GetNumberOfBuffer(n)
    return tabpagewinnr(a:n, '$')
endfunction

" 現在のカレントディレクトリを取得
function! Plug_lightline_GetCurrentDir()
    return expand('%:p')
endfunction


" --------------------------------------
" ステータスラインの設定
" --------------------------------------
" カラースキームを設定
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

" アクティブ時に左右に表示するものの設定
let g:lightline.active = {
    \  'left': [ [ 'mode', 'paste' ],
    \            [ 'branch' ],
    \            [ 'filename', 'readonly', 'help', 'preview', 'ale' ] ],
    \ 'right': [ [ 'lineinfo'],
    \            [ 'percent' ],
    \            [ 'filetype', 'fileformat', 'fileencoding' ] ]
    \ }

" インアクティブ時に左右に表示するものの設定
let g:lightline.inactive = {
    \  'left': [ [ 'branch' ],
    \            [ 'filename', 'readonly', 'help', 'preview' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'filetype', 'fileformat', 'fileencoding' ] ]
    \ }

" 使用するコンポーネントを登録
let g:lightline.component = {
    \ 'lineinfo': '%v:%l/%L'
    \ }

" 使用する関数を登録
let g:lightline.component_function = {
    \   'branch': 'Plug_lightline_GetBranch',
    \ 'filename': 'Plug_lightline_GetFileName',
    \     'help': 'Plug_lightline_IsHelpBuffer',
    \  'preview': 'Plug_lightline_IsPreviewWindow'
    \ }

" 区切り文字の設定
let g:lightline.separator = {
    \  'left': "",
    \ 'right': ""
    \ }
let g:lightline.subseparator = {
    \  'left': "",
    \ 'right': ""
    \ }


" --------------------------------------
" タブページの設定
" --------------------------------------
" 左右に表示するものの設定
let g:lightline.tabline = {
    \  'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'curdir' ] ]
    \ } 

" タブに表示するものを設定
let g:lightline.tab = {
    \   'active': [ 'bufnum', 'filename', 'modified' ],
    \ 'inactive': [ 'bufnum', 'filename', 'modified' ]
    \ }

" 使用する関数を登録
let g:lightline.tab_component_function = {
    \ 'bufnum': 'Plug_lightline_GetNumberOfBuffer',
    \ 'curdir': 'Plug_lightline_GetCurrentDir'
    \ }

" 区切り文字の設定
let g:lightline.tabline_separator = {
    \  'left': "",
    \ 'right': ""
    \ }
let g:lightline.tabline_subseparator = {
    \  'left': "",
    \ 'right': ""
    \ }
