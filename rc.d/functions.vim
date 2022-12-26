function CreateFromSkel(file_path)
    let l:path = expand(a:file_path)
    let l:file_extension = matchstr(path, '\w\+$')
    let l:base_file_name = matchstr(path, '^[^\.]\+')

    let l:skel_dir = g:config_path.'/skel/'
    let l:skel_path = skel_dir . 'skel.' . file_extension

    execute '0read ' . skel_path
    execute expand('$') . 'delete'

    if file_extension == 'h'
        " Définie la variable de non inclusion multiple (#define _FICHIER_H)
        while search('_filename_H')
            call setline('.', substitute(getline('.'),
                                       \ 'filename',
                                       \ toupper(base_file_name),
                                       \ ''))
        endwhile

        call cursor(search('#endif') - 2, 1)
        
    elseif file_extension == 'c' || file_extension == 'cpp'
        " Définie fichier.h et foldlevel=1, ajoute le filename en commentaire
        call setline(1, substitute(getline(1), 'filename', path, ''))

        if search('"main.h"')
            call setline('.', substitute(getline('.'),
                                     \   'main',
                                     \    base_file_name,
                                     \    ''))
        endif
        
        set foldlevel=1
        call search('Une_description_ici')

    elseif file_extension == 'ino'
        " Ajoute le filename en commentaire et définie foldlevel=1
        call setline(1, substitute(getline(1), 'filename', path, ''))
        call search('Une_description_ici')
        set foldlevel=1

    elseif file_extension == 'py'
        call search('Une_courte_description.', 'w')

    elseif file_extension == 'html'
        call search('body', 'w')
        set nofoldenable

    endif
endfunction

function GoToLastPosition()
    " jump to the last known cursor position if position is valid.
    if line("'\"") > 1 && line("'\"") <= line("$") 
        exe "normal! g`\"" 
    endif
endfunction

