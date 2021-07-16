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
"
"
" -----タブキー関連-----
" smarttab: 行頭でtabが押されたら、インデントの処理をする->shiftwidth分のスペースを挿入する
" expandtab: スペースの数がtabstopの数と同じになったときにタブ文字へ変換しない
" softtabstop: tabが押されたときに挿入するスペースの数。0で無効
" shiftwidth: インデント時に挿入するスペースの数。0でtabstopの値を使う
" tabstop: tab文字の見た目をスペース何文字分にするか



"-----------------------------
" 標準の設定
"-----------------------------
source ~/dotfiles/neovim/init/mapping.vim
source ~/dotfiles/neovim/init/editor.vim

"-----------------------------
" プラグインの設定
"-----------------------------
source ~/dotfiles/neovim/plugin/vim-plug.vim
source ~/dotfiles/neovim/plugin/molokai.vim
source ~/dotfiles/neovim/plugin/preview-markdown.vim
source ~/dotfiles/neovim/plugin/lightline.vim
