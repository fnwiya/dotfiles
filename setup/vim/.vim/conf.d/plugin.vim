" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.vim/dein/plugins.toml'
  let s:lazy_toml = '~/.vim/dein/plugins_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  if dein#load_state([expand('<sfile>', s:toml, s:lazy_toml)])
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#save_cache()
  endif

call dein#end()

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" }}}


""""""""""""""""""""""""""""""""""""""""""
" on_i 1を指定すると、インサートモードに入った時に読み込まれます
" on_ft 指定したファイルタイプの時に読み込まれます
" on_path バッファ名が一致した時に読み込まれます。.*を指定すると何かのファイルを開いた時に読み込まれるので、filerなどのプラグインで使うと便利です
" on_source 記載されたプラグインが読み込まれた後に読み込まれます
" on_cmd コマンドが実行された時に読み込まれます。['Unite', 'UniteResume']のようなプラグインのコマンドを指定するかと思います
" on_map on_cmdのマッピング版で['<Plug>(neosnippet_expand_or_jump)']のように指定します
" depends プラグイン間で依存性がある場合に使います。ここに記述しても自動的にインストールされるわけじゃない点はneobundle.vimとは少し挙動が違うので要注意の人もいるかもしれません
" if 'has("nvim") などのように書いて条件に一致した場合のみ読み込まれます
