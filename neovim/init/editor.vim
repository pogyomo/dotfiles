" --------------------------------------
" 入力関係
" --------------------------------------
" タブ文字関係
set softtabstop=4 shiftwidth=4 tabstop=4 expandtab                                      "通常の設定
augroup tab_setting
    autocmd!
    autocmd Filetype c        setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab   " cの設定
    autocmd Filetype cpp      setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab   " cppの設定
    autocmd Filetype make     setlocal softtabstop=0 shiftwidth=4 tabstop=4 noexpandtab " makefileの設定
    autocmd Filetype markdown setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab   " markdownの設定
    autocmd Filetype python   setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab   " pythonの設定
    autocmd Filetype tex      setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab   " texの設定
    autocmd Filetype pde      setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab   " processingの設定
augroup END

" 自動インデントを有効にする
set autoindent

" windowsでバックスペースが効かないことへの対策
set backspace=indent,eol,start

" 入力補完の表示を変える
set completeopt=menuone,noinsert

" クリップボードを共有する
set clipboard=unnamed


" --------------------------------------
" 表示関係
" --------------------------------------
" 入力中のコマンドを表示しない
set noshowcmd

" 行番号を表示
set number
set relativenumber

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
set showmatch   "有効にする
set matchtime=2 "飛ぶ時間(0.1秒の何倍かを指定)

"vimの内部エンコードをutf-8にする
set encoding=utf-8

" 文字化け対策
set fileencodings=utf-8,cp932,euc-jp,sjis

" スクロース時のカーソルと画面の端とに余裕を持たせる
set scrolloff=5


" --------------------------------------
" 検索関係
" --------------------------------------
" インクリメントサーチを有効にする
set incsearch

" 大文字と小文字を区別せず検索
set ignorecase

" 大文字が含まれていたらignorecaseを無効化
set smartcase


" --------------------------------------
" ファイル関係
" --------------------------------------
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
