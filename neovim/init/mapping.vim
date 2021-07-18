" --------------------------------------
" 一覧
" --------------------------------------
" -----normal-----
" ---leaderキーの設定
" mapleader="\<Space>" =>標準の操作用
" [Window]             <- <Leader>w
" [Tab]                <- <Leader>t
" [File]               <- <Leader>f
" [Split]              <- <Leader>s
" mapleader="s"        =>プラグイン用
" [NERDTree]           <- <Leader>n
" [preview-markdown]   <- <Leader>m
" ---leaderキーから始まるやつ
" [Window]h            =>ウィンドウ間を左に移動
" [Window]j            =>ウィンドウ間を下に移動
" [Window]k            =>ウィンドウ間を上に移動
" [Window]l            =>ウィンドウ間を右に移動
" [Window]H            =>ウィンドウを左に動かす
" [Window]J            =>ウィンドウを下に動かす
" [Window]K            =>ウィンドウを上に動かす
" [Window]L            =>ウィンドウを右に動かす
" [Window]<            =>ウィンドウの幅を一文字分狭くする
" [Window]>            =>ウィンドウの幅を一文字分広くする
" [Window]+            =>ウィンドウの高さを一文字分広くする
" [Window]-            =>ウィンドウの高さを一文字分狭くする
" [Tab]o               =>:tabnew と入力する
" [Tab]co              =>現在のタブを閉じる
" [Tab]ca              =>現在のタブ以外をすべて閉じる
" [Tab]h               =>タブ間を左に移動する
" [Tab]l               =>タブ間を右に移動する
" [Tab]H               =>タブ自体を左に移動する
" [Tab]L               =>タブ自体を右に移動する
" [File]t              =>:set filetype=と入力する
" [File]e              =>:set fileencodingと入力する
" [File]f              =>:set fileformatと入力する
" [Split]j             =>画面を上下に分割して下に行く
" [Split]k             =>画面を上下に分割して下に行く
" [Split]h             =>画面を左右に分割して左に行く
" [Split]l             =>画面を左右に分割して右に行く
" [NERDTree]o          =>現在のタブでNERDTreeを開く
" [NERDTree]c          =>現在のタブのNERDTreeを閉じる
" [preview-markdown]t  =>新しいタブでmarkdownのプレビューを行う
" [preview-markdown]l  =>ウィンドウの右側でmarkdownのプレビューを行う
" [preview-markdown]h  =>ウィンドウの左側でmarkdownのプレビューを行う
" [preview-markdown]k  =>ウィンドウの上側でmarkdownのプレビューを行う
" [preview-markdown]j  =>ウィンドウの下側でmarkdownのプレビューを行う
" ---その他
" j                    =>表示されている行単位で下に移動
" k                    =>表示されている行単位で上に移動
"
" -----insert-----
" ---モードの変更
" jj                   =>normalモードにjjで入る
" ---括弧の補完
" {                    =>{}と入力し括弧の中にカーソルを移す
" [                    =>[]と入力し括弧の中にカーソルを移す
" (                    =>()と入力し括弧の中にカーソルを移す
" '                    =>''と入力し括弧の中にカーソルを移す
" "                    =>""と入力し括弧の中にカーソルを移す
"
" -----terminal-insert-----
" ---その他
" ESC                  =>ESCキーでノーマルモードに移行する
" jj                   =>上同


" --------------------------------------
" リーダーキーの設定
" --------------------------------------
" spaceキーをleaderに設定する(標準のキーマップ用)
let mapleader="\<Space>"
nmap <Leader>w [Window]
nmap <Leader>t [Tab]
nmap <Leader>f [File]
nmap <Leader>s [Split]

" sキーをleaderに設定する(プラグインのキーマップ用)
let mapleader="s"
nmap <Leader>n [NERDTree]
nmap <Leader>m [preview-markdown]


" --------------------------------------
" ノーマルモードのキー設定(標準)
" --------------------------------------
" タブ関係のコマンド
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

" ファイル関係のコマンド
nnoremap [File]t :set filetype=
nnoremap [File]e :set fileencoding=
nnoremap [File]f :set fileformat=

" 画面分割関係のコマンド
nnoremap <silent> [Split]j :sp<CR><C-w>j
nnoremap <silent> [Split]k :sp<CR><C-w>k
nnoremap <silent> [Split]h :vsp<CR><C-w>h
nnoremap <silent> [Split]l :vsp<CR><C-w>l

" 表示行単位で移動する
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


" --------------------------------------
" ノーマルモードのキー設定(プラグイン)
" --------------------------------------
" NERDTreeの設定
nnoremap <silent> [NERDTree]o :NERDTree<CR>
nnoremap <silent> [NERDTree]c :NERDTreeClose<CR>

" preview-markdownの設定
nnoremap <silent> [preview-markdown]t :PreviewMarkdown tab<CR>
nnoremap <silent> [preview-markdown]l :PreviewMarkdown right<CR>
nnoremap <silent> [preview-markdown]h :PreviewMarkdown left<CR>
nnoremap <silent> [preview-markdown]k :PreviewMarkdown top<CR>
nnoremap <silent> [preview-markdown]j :PreviewMarkdown bottom<CR>


" --------------------------------------
" インサートモードのキー設定(標準)
" --------------------------------------
" normalモードへの移行をjjキーで代用する
inoremap <silent> jj <ESC>

" 括弧とクォーテーションを自動で補完する
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>


" --------------------------------------
" ターミナルインサートモードのキー設定(標準)
" --------------------------------------
" ESCとjjでターミナルノーマルモードへ移行する
tnoremap <ESC> <C-\><C-n>
tnoremap jj <C-\><C-n>
