"-------------------------------------------------------------------------------
" 基本設定
"-------------------------------------------------------------------------------
set nocompatible                  "Use Vim defaults instead of 100% vi compatibility
set encoding=utf8                 "エンコーディング設定
set fileencoding=utf-8            "カレントバッファ内のファイルの文字エンコーディングを設定する
set scrolloff=4                   "カーソルの上または下に表示する最小限の行数
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
set textwidth=80                  "一行の文字数
set whichwrap=h,l                 "行の端までいったら前/次の行へ
set history=1000                  "コマンド、検索パターンを1000個まで履歴に残す
"-------------------------------------------------------------------------------
" seach
"-------------------------------------------------------------------------------
set ignorecase                     "小文字の検索でも大文字も見つかるようにする
set smartcase                      "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch                      "インクリメンタルサーチを行う
set nowrapscan                     "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
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
