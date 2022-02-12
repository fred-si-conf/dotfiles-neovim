let mapleader = ","        " Configure la touche <Leader>

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-A va au début de la ligne en mode commande
cnoremap <C-A> <C-B>

noremap <Space> za

" Se passer de la touche Echap
imap ,, <Esc>
map ,, <Esc>
tnoremap ,, <C-\><C-N>

" Delete from cursor do begin-of-line
inoremap <C-U> <C-G>u<C-U>

noremap <C-p> :<C-p>

" Navigation dans les tags
noremap <leader>s <C-]>
" Parce que sur mon terminal CTRL-T donne <CR>
noremap <leader>t :pop<CR>


autocmd FileType arduino
    \ nnoremap <leader>av :wa<CR>:ArduinoVerify<CR> |
    \ nnoremap <leader>au :wa<CR>:! screen -X kill<CR>:ArduinoUpload<CR> |
    \ nnoremap <leader>ad :wa<CR>:! screen -X kill<CR>:ArduinoUploadAndSerial<CR> |
    \ nnoremap <leader>as :! screen -X kill<CR>:ArduinoSerial<CR> |
    \ nnoremap <leader>ab :ArduinoChooseBoard<CR> |
    \ nnoremap <leader>ap :ArduinoChooseProgrammer<CR>

