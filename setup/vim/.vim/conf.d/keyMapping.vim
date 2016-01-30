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

nnoremap <Esc><Esc> :noh<CR>   "unHilight

"移動
inoremap jk  <Esc>
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
