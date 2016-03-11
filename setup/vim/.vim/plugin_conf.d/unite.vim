""" unite.vim
" 参照 http://d.hatena.ne.jp/osyo-manga/20130307/1362621589
"" base settings
" 入力モードで開始する
" let g:unite_enable_start_insert=1
"ヒストリー/ヤンク機能を有効化
let g:unite_source_history_yank_enable =1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"" keymapping
nnoremap [unite] <Nop>
nmap <Space>u [unite]
" バッファ
nnoremap <silent> [unite]b :<C-u>Unite buffer file_mru<CR>
" カレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイル
nnoremap <silent> [unite]r :<C-u>Unite file_mru<CR>
"ヒストリ/ヤンク
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
