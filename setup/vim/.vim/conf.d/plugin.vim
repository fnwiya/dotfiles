if &compatible
  set nocompatible
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
endif
set runtimepath^=s:dein_repo_dir

" 設定開始
call dein#begin(s:dein_dir)
  if dein#load_state(s:dein_dir)
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc', {
          \ 'build': {
          \     'windows': 'tools\\update-dll-mingw',
          \     'cygwin': 'make -f make_cygwin.mak',
          \     'mac': 'make -f make_mac.mak',
          \     'linux': 'make',
          \     'unix': 'gmake'}})
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/unite.vim', {
          \ 'depends': ['vimproc'],
          \ 'on_cmd': ['Unite'],
          \ 'lazy': 1})

  " " プラグインリストを収めた TOML ファイル
  " let s:toml      = s:dein_dir . '/plugins.toml'
  " let s:lazy_toml = s:dein_dir . '/plugins_lazy.toml'

  " " TOML を読み込み、キャッシュしておく
  " call dein#load_toml(s:toml,      {'lazy': 0})
  " call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#save_state()
  endif
call dein#end()

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
