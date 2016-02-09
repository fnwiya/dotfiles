"-------------------------------------------------------------------------------
" KeyMapping
"-------------------------------------------------------------------------------
"                 |  nomal  | insert |  command  | visual | 選択 |  演算待ち |
" map  / noremap  |    @    |   -    |     -     |   @    |  @   |    @     |
" nmap / nnoremap |    @    |   -    |     -     |   -    |  -   |    -     |
" vmap / vnoremap |    -    |   -    |     -     |   @    |  @   |    -     |
" omap / onoremap |    -    |   -    |     -     |   -    |  -   |    @     |
" xmap / xnoremap |    -    |   -    |     -     |   @    |  -   |    -     |
" smap / snoremap |    -    |   -    |     -     |   -    |  @   |    -     |
" map! / noremap! |    -    |   @    |     @     |   -    |  -   |    -     |
" imap / inoremap |    -    |   @    |     -     |   -    |  -   |    -     |
" cmap / cnoremap |    -    |   -    |     @     |   -    |  -   |    -     |
"-----------------------------------------------------------------------------------"
"移動
inoremap jj  <Esc>
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j
"インサートモードでもhjkl移動
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
" カーソル前の文字削除
"inoremap <silent> <C-> <C-g>u<C-h>
" カーソル後の文字削除
inoremap <silent> <C-d> <Del>
" カーソルから行頭まで削除
inoremap <silent> <C-d>0 <Esc>lc^
" カーソルから行末まで削除
inoremap <silent> <C-d>$ <Esc>lc$
" カーソルから行頭までヤンク
inoremap <silent> <C-y>0 <Esc>ly0<Insert>
" カーソルから行末までヤンク
inoremap <silent> <C-y>$ <Esc>ly$<Insert>
" インサートモードでもundo
inoremap <M-u> <Esc>:undo<CR> i

"space
nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Space>Q  :<C-u>q!<CR>
nnoremap <Space>h  ^
nnoremap <Space>l  $

" 引用符, 括弧の設定
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <> <><Left>

" 矢印キーで入力するとA B C Dが入力される問題を解決
set nocompatible
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>
set t_ku=OA
set t_kd=OB
set t_kr=OC
set t_kl=OD
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

" others
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <Esc><Esc> :noh<CR>   "unHilight
