" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup



"-------------------------------------------------------------------------------
" 基本設定
"-------------------------------------------------------------------------------
set encoding=utf8                 "エンコーディング設定
set fileencoding=utf-8            "カレントバッファ内のファイルの文字エンコーディングを設定する
set scrolloff=5                   "カーソルの上または下に表示する最小限の行数
set nobackup                      "(no)ファイルを上書きする前にバックアップファイルを作る
set backupskip=/tmp/*,/private/tmp/*
set autoread                      "他で書き換えられた場合、自動で読みなおす
set noswapfile                    "swapをつくらない
set hidden                        "編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start    "backspaceで消せるようにする
set vb t_vb=                      "ビープ音を鳴らさない
set clipboard=unnamed             "OSのクリップボードを使用する
set nostartofline
set virtualedit=block             "矩形選択でカーソル位置の制限を解除
set textwidth=80
set whichwrap=h,l
set history=2000
"-------------------------------------------------------------------------------
" Look&Feel
"-------------------------------------------------------------------------------
syntax on
set t_Co=256
colorscheme lucius
set background=dark
set nowrap                        "(no)ウィンドウの幅を超える行の折り返し設定
set display=lastline              "一行が長くても表示
set number                        "行番号表示
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する
set cursorline
set title
set matchtime=1
set showmatch
set ambiwidth=double              "全角文字の幅を2に固定
set pumheight=10                  "補完メニューの高さ
set list                          "タブ文字、行末など不可視文字を表示する
set listchars=tab:>-              "listで表示される文字のフォーマットを指定する 
                                  "※デフォルト eol=$ を打ち消す意味で設定
set laststatus=2                  "ステータスラインを表示するウィンドウを設定する 
                                  "2:常にステータスラインを表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P 
                                  "ステータス行の表示内容を設定する
set showcmd                       "入力中のステータスに表示する
 
"全角スペース表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
" 挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


" カーソル下の単語をハイライト
highlight CurrentWord term=NONE ctermbg=DarkMagenta ctermfg=NONE

function! s:EscapeText( text )
  return substitute( escape(a:text, '\' . '^$.*[~'), "\n", '\\n', 'ge' )
endfunction

function! s:GetCurrentWord()
  let l:cword = expand('<cword>')
  if !empty(l:cword)
    let l:regexp = s:EscapeText(l:cword)
    if l:cword =~# '^\k\+$'
      let l:regexp = '\<' . l:regexp . '\>'
    endif
    return l:regexp
  else
    return ''
  endif
endfunction

function! s:HighlightCurrentWord()
  let l:word = s:GetCurrentWord()
  if !empty(l:word)
    if exists("w:current_match")
      call matchdelete(w:current_match)
    endif
    let w:current_match = matchadd('CurrentWord', l:word, 0)
  endif
endfunction

augroup cwh
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:HighlightCurrentWord()
augroup END


"-------------------------------------------------------------------------------
" KeyMapping
"-------------------------------------------------------------------------------
" コマンド        | ノーマル | 挿入 | コマンドライン | ビジュアル | 選択 | 演算待ち |
" map  / noremap  |    @     |  -   |       -        |     @      |  @   |    @     |
" nmap / nnoremap |    @     |  -   |       -        |     -      |  -   |    -     |
" vmap / vnoremap |    -     |  -   |       -        |     @      |  @   |    -     |
" omap / onoremap |    -     |  -   |       -        |     -      |  -   |    @     |
" xmap / xnoremap |    -     |  -   |       -        |     @      |  -   |    -     |
" smap / snoremap |    -     |  -   |       -        |     -      |  @   |    -     |
" map! / noremap! |    -     |  @   |       @        |     -      |  -   |    -     |
" imap / inoremap |    -     |  @   |       -        |     -      |  -   |    -     |
" cmap / cnoremap |    -     |  -   |       @        |     -      |  -   |    -     |
"-----------------------------------------------------------------------------------"
"evil-mode時にvimを起動しても大丈夫にする。
imap <C-[> <esc>
noremap ;  :

"インサートモードでもhjkl移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

" notHilight
nnoremap <Esc><Esc> :noh<CR>
" Yで行末までコピー
nnoremap Y y$

"-------------------------------------------------------------------------------
" seach
"-------------------------------------------------------------------------------
set ignorecase                     "小文字の検索でも大文字も見つかるようにする
set smartcase                      "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch                      "インクリメンタルサーチを行う
set nowrapscan                     "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set history=1000                   "コマンド、検索パターンを100個まで履歴に残す
set hlsearch                       "highlight matches with last search pattern
set wrapscan                       "最後まで検索したら先頭に戻る

"-------------------------------------------------------------------------------
" indent/tab
"-------------------------------------------------------------------------------
set expandtab                      "Insertモードで<tab>を挿入するのに、適切な数の空白を使う
set tabstop=4                      "ファイル内の <tab> が対応する空白の数
set smarttab                       "行頭の余白内で Tabを打ち込むと、'shiftwidth' の数だけインデントする
set autoindent                     "新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set smartindent
set shiftwidth=4                   "自動インデントの各段階に使われる空白の数

"-------------------------------------------------------------------------------
" その他設定
"-------------------------------------------------------------------------------

