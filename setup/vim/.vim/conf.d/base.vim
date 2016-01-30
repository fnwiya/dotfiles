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
