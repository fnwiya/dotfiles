let plugins = dein#load_cache_raw(['/Users/fnwiya/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_base_path = '/Users/fnwiya/.vim/dein'
let g:dein#_runtime_path = '/Users/fnwiya/.vim/dein/.dein'
let &runtimepath = '/Users/fnwiya/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/fnwiya/.vim,/Users/fnwiya/.vim/dein/.dein,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,/Users/fnwiya/.vim/after,/Users/fnwiya/.vim/,/Users/fnwiya/.vim/dein/.dein/after'
