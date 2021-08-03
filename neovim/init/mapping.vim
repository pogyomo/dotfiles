" --------------------------------------
" 一覧
" --------------------------------------
" -----normal-----
" ---leaderキーの設定
" mapleader="\<Space>" =>標準の操作用1
" mapleader="s"        =>標準の操作用2
" [Window]             <- <Leader>w
" [Tab]                <- <Leader>t
" [Split]              <- <Leader>s
" [preview-markdown]   <- <Leader>m
" [easymotion]         <- <Leader>e
" [coc]                <- <Leader>o
" ---leaderキーから始まるやつ
" [Window]h            =>ウィンドウ間を左に移動
" [Window]j            =>ウィンドウ間を下に移動
" [Window]k            =>ウィンドウ間を上に移動
" [Window]l            =>ウィンドウ間を右に移動
" [Window]H            =>ウィンドウを左に動かす
" [Window]J            =>ウィンドウを下に動かす
" [Window]K            =>ウィンドウを上に動かす
" [Window]L            =>ウィンドウを右に動かす
" [Window]<            =>ウィンドウの幅を10文字分狭くする
" [Window]>            =>ウィンドウの幅を10文字分広くする
" [Window]+            =>ウィンドウの高さを10文字分広くする
" [Window]-            =>ウィンドウの高さを10文字分狭くする
" [Tab]o               =>:tabnew と入力する
" [Tab]co              =>現在のタブを閉じる
" [Tab]ca              =>現在のタブ以外をすべて閉じる
" [Tab]h               =>タブ間を左に移動する
" [Tab]l               =>タブ間を右に移動する
" [Tab]H               =>タブ自体を左に移動する
" [Tab]L               =>タブ自体を右に移動する
" [Split]j             =>画面を上下に分割して下に行く
" [Split]k             =>画面を上下に分割して下に行く
" [Split]h             =>画面を左右に分割して左に行く
" [Split]l             =>画面を左右に分割して右に行く
" [preview-markdown]t  =>新しいタブでmarkdownのプレビューを行う
" [preview-markdown]l  =>ウィンドウの右側でmarkdownのプレビューを行う
" [preview-markdown]h  =>ウィンドウの左側でmarkdownのプレビューを行う
" [preview-markdown]k  =>ウィンドウの上側でmarkdownのプレビューを行う
" [preview-markdown]j  =>ウィンドウの下側でmarkdownのプレビューを行う
" [coc]dj              =>次のエラー箇所へ移動する
" [coc]dk              =>前のエラー箇所へ移動する
" [coc]df              =>定義へジャンプする
" [coc]dt              =>型の定義へジャンプする
" [coc]f               =>ファイルを整形する
" [coc]rn              =>変数をリネームする
" [coc]rf              =>リファレンスを見る
" [coc]h               =>ヒントを見る
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
" {<Enter>             =>{}と入力し括弧をいい感じに整形する
" [<Enter>             =>[]と入力し括弧をいい感じに整形する
" (<Enter>             =>()と入力し括弧をいい感じに整形する
" '<Enter>             =>''と入力し括弧をいい感じに整形する
" "<Enter>             =>""と入力し括弧をいい感じに整形する
"
" -----terminal-insert-----
" ---その他
" ESC                  =>ESCキーでノーマルモードに移行する
" jj                   =>jjキーでノーマルモードに移行する


" --------------------------------------
" リーダーキーの設定
" --------------------------------------
" spaceキーをleaderに設定する
let mapleader="\<Space>"
" 標準のleader
nmap <Leader>w [Window]
nmap <Leader>t [Tab]
nmap <Leader>s [Split]
" プラグインのleader
nmap <Leader>m [preview-markdown]
nmap <Leader>e [easymotion]
nmap <Leader>o [coc]

" sキーをleaderにする
let mapleader="s"
" 標準のleader
nmap <Leader>w [Window]
nmap <Leader>t [Tab]
nmap <Leader>s [Split]
" プラグインのleader
nmap <Leader>m [preview-markdown]
nmap <Leader>e [easymotion]
nmap <Leader>o [coc]


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
nnoremap [Window]< 10<C-w><
nnoremap [Window]> 10<C-w>>
nnoremap [Window]+ 10<C-w>+
nnoremap [Window]- 10<C-w>-

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
" preview-markdownの設定
nnoremap <silent> [preview-markdown]t :PreviewMarkdown tab<CR>
nnoremap <silent> [preview-markdown]l :PreviewMarkdown right<CR>
nnoremap <silent> [preview-markdown]h :PreviewMarkdown left<CR>
nnoremap <silent> [preview-markdown]k :PreviewMarkdown top<CR>
nnoremap <silent> [preview-markdown]j :PreviewMarkdown bottom<CR>

" cocの設定
" 診断について
nmap [coc]dj <Plug>(coc-diagnostic-next)
nmap [coc]dk <Plug>(coc-diagnostic-prev)
" 定義ジャンプについて
nmap [coc]df <Plug>(coc-definition)
nmap [coc]dt <Plug>(coc-type-definition)
" ファイルの整形
nmap [coc]f  <Plug>(coc-format)
" リネーム
nmap [coc]rn <Plug>(coc-rename)
" リファレンスを見る
nmap [coc]rf <Plug>(coc-references)
" ヒントを見る
nmap <silent> [coc]h :<C-u>:call CocAction('doHover')<CR>


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

" いい感じに括弧を作る
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


" --------------------------------------
" ターミナルインサートモードのキー設定(標準)
" --------------------------------------
" ESCとjjでターミナルノーマルモードへ移行する
tnoremap <ESC> <C-\><C-n>
tnoremap jj <C-\><C-n>
