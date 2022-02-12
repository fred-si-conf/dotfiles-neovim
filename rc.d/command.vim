if !exists(":S")
    command S :source ~/.config/nvim/init.vim
endif

if !exists(":Bepo") " Source le fichier ~/.vim/bepo.vimrc
    command Bepo :source ~/.vim/bepo.vimrc
endif

" fait un vimdiff {buffer_actif} {fichier_sur_le_disque}
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
            \ | wincmd p | diffthis
endif
