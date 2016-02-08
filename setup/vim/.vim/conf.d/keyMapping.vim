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
"インサートモードでもhjkl移動
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-d> <delete>

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <Esc><Esc> :noh<CR>   "unHilight

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

"space
nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Space>Q  :<C-u>q!<CR>
nnoremap <Space>h  ^
nnoremap <Space>l  $

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
