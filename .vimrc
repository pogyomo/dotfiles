"-----------------------------
" メモ書き
"-----------------------------
" -----オプション等の規則-----
" ・別々の内容の設定間では空白2つ
" ・一つの内容の中の複数の内容は空白１つ
" ・上の内容内の設定は空白なし
" ・文字は" hogehogeと書く
"
"
" -----関数の命名規則-----
" ・プラグインに使う関数は
" ・Plug_plugname_funcnameの形にする
"
"
" -----プラグインに書くものの順番-----
" ・基本的にはvim標準の設定 -> プラグイン固有の設定
" ・キー設定を一番上に置く


"-----------------------------
" 置き換えたキー各種
"-----------------------------
" -----normal-----
" leaderキーの設定
" mapleader="\<Space>" =>標準の操作用
" [Window] <- <Leader>w
" [Tab] <- <Leader>t
" [FileType] <- <Leader>f
" mapleader="s" =>プラグイン用
" [NERDTree] <- <Leader>n
"
" leaderキーから始まるやつ
" [Window]h <- <C-w>h =>ウィンドウ間を左に移動
" [Window]j <- <C-w>j =>ウィンドウ間を下に移動
" [Window]k <- <C-w>k =>ウィンドウ間を上に移動
" [Window]l <- <C-w>l =>ウィンドウ間を右に移動
" [Window]H <- <C-w>H =>ウィンドウを左に動かす
" [Window]J <- <C-w>J =>ウィンドウを下に動かす
" [Window]K <- <C-w>K =>ウィンドウを上に動かす
" [Window]L <- <C-w>L =>ウィンドウを右に動かす
" [Window]< <- <C-w>< =>ウィンドウの幅を一文字分狭くする
" [Window]> <- <C-w>> =>ウィンドウの幅を一文字分広くする
" [Window]+ <- <C-w>+ =>ウィンドウの高さを一文字分広くする
" [Window]- <- <C-w>- =>ウィンドウの高さを一文字分狭くする
" [Tab]o <- :tabnew<Space> =>:tabnew と入力する
" [Tab]co <- <silent> :tabclose<CR> =>現在のタブを閉じる
" [Tab]ca <- <silent> :tabonly<CR> =>現在のタブ以外をすべて閉じる
" [Tab]h <- gT =>タブ間を左に移動する
" [Tab]l <- gt =>タブ間を右に移動する
" [Tab]H <- <silent> :-tabmove =>タブ自体を左に移動する
" [Tab]L <- <silent> :+tabmove =>タブ自体を右に移動する
" [FileType]s <- :set filetype= =>:set filetype=と入力する
" [NERDTree]o <- <silent> :NERDTree<CR> =>現在のタブでNERDTreeを開く
" [NERDTree]c <- <silent> :NERDTreeClose<CR> =>現在のタブのNERDTreeを閉じる
"
" gキーが先頭
" j <-> gj =>表示されている行単位で下に移動
" k <-> gk =>表示されている行単位で上に移動
"
"
" -----insert-----
" その他
" jj <- <ESC> =>normalモードにjjで入る


"-----------------------------
" 標準とプラグインで使う設定
"-----------------------------
" -----入力-----
" ノーマルモードのキー設定
" spaceキーをleaderに設定する(標準のキーマップ用)
let mapleader="\<Space>"

" ラベルを設定する
nmap <Leader>w [Window]
nmap <Leader>t [Tab]
nmap <Leader>f [FileType]

" sキーをleaderに設定する(プラグインのキーマップ用)
let mapleader="s"

" ラベルを設定する
nmap <Leader>n [NERDTree]
nmap <Leader>g [fugitive]


"-----------------------------
" 標準の設定
"-----------------------------
" -----入力-----
" タブ文字関係
" タブをスペースで扱う
set expandtab     "入力されたタブ文字をスペースで扱う(既存のタブ文字には影響しない)
set tabstop=4     "tabキーが押されたときに、挿入されたスペースがこの値を超えたらタブ文字にする。
                  "また、タブ文字を設定された数の半角スペースで表示する
set softtabstop=4 "tabキーやbsキーが押された際、タブの幅をを
                  "設定された数の半角スペースとして挿入、削除する
set shiftwidth=4  "インデントを増やすときに設定された数の半角スペースを挿入する


" 自動インデントを有効にする
set smartindent


" windowsでバックスペースが効かないことへの対策
set backspace=indent,eol,start


" 入力補完の表示を変える
set completeopt=menuone,noinsert


" キーの設定
" タブでファイルの開閉
nnoremap [Tab]o :tabnew<Space>
nnoremap <silent> [Tab]co :tabclose<CR>
nnoremap <silent> [Tab]ca :tabonly<CR>
" タブ間の移動キーを変更
nnoremap [Tab]l gt
nnoremap [Tab]h gT
" タブを動かす
nnoremap [Tab]L :+tabmove<CR>
nnoremap [Tab]H :-tabmove<CR>

" ウィンドウに関するキーの置き換え
" ウィンドウ間の移動
nnoremap [Window]j <C-w>j
nnoremap [Window]k <C-w>k
nnoremap [Window]h <C-w>h
nnoremap [Window]l <C-w>l
nnoremap [Window]J <C-w>J
nnoremap [Window]K <C-w>K
nnoremap [Window]H <C-w>H
nnoremap [Window]L <C-w>L
" ウィンドウの幅と高さをを変える
nnoremap [Window]< <C-w><
nnoremap [Window]> <C-w>>
nnoremap [Window]+ <C-w>+
nnoremap [Window]- <C-w>-

" 入力補完時にEnterで補完内容を決定する
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"

" 表示行単位で移動する
"そのための設定
nnoremap j gj
nnoremap k gk

"逆の場合も設定
nnoremap gj j
nnoremap gk k

" normalモードへの移行をjjキーで代用する
im <silent> jj <ESC>

" :set Filetype=と入力する
nnoremap [FileType]s :set filetype=


" -----表示-----
" 入力中のコマンドを表示しない
set noshowcmd


" 行番号を表示
set number


" ビープ音と画面の点滅を無効化
set belloff=all


" シンタックスを有効にする
syntax on


" 現在のファイル名を上に表示する
set title


" 256色に対応させる設定
" colorschemeの色がおかしくなるのを防止するため
set t_Co=256


" カギ括弧入力時に対応するものに一瞬飛ぶ
set showmatch "有効にする
set matchtime=2 "飛ぶ時間(0.1秒の何倍かを指定)


"vimの内部エンコードをutf-8にする
set encoding=utf-8


" 文字化け対策
set fileencodings=utf-8,cp932,euc-jp,sjis


" スクロース時のカーソルと画面の端とに余裕を持たせる
set scrolloff=5


" -----検索-----
" インクリメントサーチを有効にする
set incsearch


" 大文字と小文字を区別せず検索
set ignorecase


" 大文字が含まれていたらignorecaseを無効化
set smartcase


" -----ファイル-----
" modelineを有効にする
set modeline


" ファイルタイプの検出とプラグイン、インデントの読み込み
filetype plugin indent on


" 他でファイルが更新されたら自動で再読み込み
set autoread


" アンドゥファイルを作らない
set noundofile


" バックアップファイルを作らない
set nobackup


" スワップファイルを作成しない
set noswapfile


"-----------------------------
" プラグインの設定
"-----------------------------
" -----vim-plug-----
" プラグインの登録
call plug#begin('~/.vim/plugged')
" ここに導入したいプラグインを書く
" Plugin '[Github Auther]/[Github repo]'の形式で書く
" 全体に関わるやつ
Plug 'vim-jp/vimdoc-ja' "docを日本語化する
Plug 'tomasr/molokai' "molokaiを入れる
Plug 'preservim/nerdtree' "NERDTreeを入れる
Plug 'itchyny/lightline.vim' "lightlineを入れる
Plug 'tpope/vim-fugitive' "gitの操作
" nesasmに関係するやつ
Plug 'thentenaar/vim-syntax-obscure' "nesasmやca65のシンタックスハイライト
" 呼び出し必須
call plug#end()


" -----vimdoc-jp-----
set helplang=ja "有効にする


" -----molokai-----
" カラースキームの設定
colorscheme molokai 

" イタリック体を無効にする
hi DiffText                      guibg=#4C4745 gui=bold
hi Macro           guifg=#C4BE89               gui=none
hi SpecialKey      guifg=#66D9EF               gui=none
hi Special         guifg=#66D9EF guibg=bg      gui=none
hi StorageClass    guifg=#FD971F               gui=none
hi Tag             guifg=#F92672               gui=none


" -----NERDTree-----
" キーの設定
" 現在のタブでNERDTreeを開閉する
nnoremap <silent> [NERDTree]o :NERDTree<CR>
nnoremap <silent> [NERDTree]c :NERDTreeClose<CR>


" -----fugitive-----
" キーの設定
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit<CR>
nnoremap <silent> [fugitive]p :Gpush<CR>


" -----lightline-----
" 表示の設定
set laststatus=2 "ステータスラインを常に表示する
set showtabline=2 "タブページを常に表示する

" ステータスラインで使用する関数(標準)
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

" タブページで使用する関数(標準)
" タブのバッファの数を返す
function! Plug_lightline_GetNumberOfBuffer(n)
    return tabpagewinnr(a:n, '$')
endfunction

" ステータスラインの設定
" カラースキームを設定
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }
" アクティブ時に左右に表示するものの設定
let g:lightline.active = {
    \  'left': [ [ 'mode', 'paste' ],
    \            [ 'fugitive', 'filename', 'readonly', 'help', 'preview', 'ale' ] ],
    \ 'right': [ [ 'lineinfo'],
    \            [ 'percent' ],
    \            [ 'filetype', 'fileformat', 'fileencoding' ] ]
    \ }
" インアクティブ時に左右に表示するものの設定
let g:lightline.inactive = {
    \  'left': [ [ 'filename', 'readonly', 'help', 'preview' ] ],
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
    \ 'fugitive': 'FugitiveStatusLine',
    \ 'filename': 'Plug_lightline_GetFileName',
    \     'help': 'Plug_lightline_IsHelpBuffer',
    \  'preview': 'Plug_lightline_IsPreviewWindow',
    \ }
" 区切り文字の設定
let g:lightline.separator = {
    \  'left': '',
    \ 'right': ''
    \ }
let g:lightline.subseparator = {
    \  'left': '>',
    \ 'right': '<'
    \ }

" タブページの設定
" 左右に表示するものの設定
let g:lightline.tabline = {
    \  'left': [ [ 'tabs' ] ],
    \ 'right': [ ]
    \ } 
" タブに表示するものを設定
let g:lightline.tab = {
    \   'active': [ 'bufnum', 'filename', 'modified' ],
    \ 'inactive': [ 'bufnum', 'filename', 'modified' ]
    \ }
" 使用する関数を登録
let g:lightline.tab_component_function = {
    \ 'bufnum': 'Plug_lightline_GetNumberOfBuffer'
    \ }
" 区切り文字の設定
let g:lightline.tabline_separator = {
    \  'left': '',
    \ 'right': ''
    \ }
let g:lightline.tabline_subseparator = {
    \  'left': '|',
    \ 'right': '|'
    \ }
