set nocompatible " Annule la compatibilité avec Vi : totalement indispensable

let g:config_path = resolve(expand('<sfile>:p:h'))
let g:init_script = resolve(expand('<sfile>:p'))

exe 'source '.g:config_path.'/plugins.vim'

for f in split(glob(g:config_path.'/rc.d/*.vim'), '\n')
    exe 'source' f
endfor

" vim: foldmethod=indent
