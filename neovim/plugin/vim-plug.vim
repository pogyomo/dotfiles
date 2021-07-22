" --------------------------------------
" プラグインの登録
" --------------------------------------
" 呼び出し必須
call plug#begin('~/.config/nvim/plugged')

" ここに導入したいプラグインを書く
" Plugin '[Github Auther]/[Github repo]'の形式で書く
" 全体に関わるやつ
Plug 'tomasr/molokai' "molokaiを入れる
Plug 'itchyny/lightline.vim' "lightlineを入れる
Plug 'skanehira/preview-markdown.vim' "マークダウンのプレビュー
Plug 'tpope/vim-fugitive' "gitの操作とか
Plug 'dense-analysis/ale' "シンタックスチェッカー
" nesasmに関係するやつ
Plug 'thentenaar/vim-syntax-obscure' "nesasmのシンタックスハイライト
" c/c++に関係するやつ
Plug 'bfrg/vim-cpp-modern' "c/c++のシンタックスハイライト
" latexに関係するやつ
Plug 'lervag/vimtex' "latexのシンタックスハイライト関係

" 呼び出し必須
call plug#end()
