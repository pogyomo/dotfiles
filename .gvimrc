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
" 標準の設定
"-----------------------------
" -----表示-----
" いらないものを消す
" メニューバーを消す
set guioptions-=m

" ツールバーを消す
set guioptions-=T

" 左右のスクロースバーを消す
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" 水平スクロールバーを消す
set guioptions-=b


" 文字化けを何とかする
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim


" フォントを変更する
set guifont=Ricty_Diminished:h13
