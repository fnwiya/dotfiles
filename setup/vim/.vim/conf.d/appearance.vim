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
set cursorline                    "カーソル行の強調
set title                         "タイトルの表示
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
