autocmd!

autocmd BufNewFile *.{ino,h,c,cpp,py,html,php}
    \ call CreateFromSkel('%')

autocmd BufReadPost * call GoToLastPosition()

" Met en surbrillance les caractères blanc en fin de ligne
autocmd BufRead,BufNewFile * match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red

" Met en surbrillance les espaces insécables
autocmd BufRead,BufNewFile * match NonBreakableSpace / \+/
highlight NonBreakableSpace ctermbg=238 guibg=lightgrey

augroup HighlightLineColumn
    autocmd insertLeave * set cursorline
    autocmd insertEnter * set nocursorline
    autocmd insertLeave * set cursorcolumn
    autocmd insertEnter * set nocursorcolumn
augroup END

highlight CursorLine  cterm=none ctermbg=Blue

