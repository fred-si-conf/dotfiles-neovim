set nocompatible " Annule la compatibilité avec Vi : totalement indispensable

let g:config_path = resolve(expand('<sfile>:p:h'))
let g:init_script = resolve(expand('<sfile>:p'))

exe 'source '.g:config_path.'/bepo.vim'
exe 'source '.g:config_path.'/plugins.vim'

" -- Paramètres
    if has('mouse')
        set mouse=a    " Active la souris
    endif
    " -- Affichage
        set title           " Met a jour le titre de fenêtre ou du terminal
        set number          " Affiche le numéro des lignes
        set relativenumber  " Numérote les lignes en fonction de la ligne courante
        set ruler           " Affiche la position actuelle du curseur
        set cursorline      " Marque la ligne sous le curseur
        set cursorcolumn    " Marque la ligne sous le curseur
        set colorcolumn=+1  " highlight first column after textwidth
        set wrap            " Affiche les lignes trop longues sur plusieurs lignes
        set showmode        " Affiche le mode dans lequel on se trouve
        set linebreak       " Coupe les lignes trop longues au niveau d’un caractère
                            " 'breakat' plutot qu’au dernier caracère de la ligne

        set scrolloff=5     " Affiche un minimum de 5 lignes autour du curseur

        syntax enable       " Active la coloration syntaxique
        set background=dark " Active la coloration syntaxique pour fond sombre
        set t_Co=256        " Nombre de couleurs à utiliser
        colorscheme minimalist
        
        if !exists('colors_name')    " Si badwolf ne réussi pas à se charger
            colorscheme desert        " colors_name n'existe pas
        endif

    " -- Recherche
        set ignorecase        " Ignore la casse lors d’une recherche
        set smartcase        " Si une recherche contient une majuscule, réactive la sensibilité a la casse
        set hlsearch        " Surligne les résultats de recherche
        set incsearch        " Surligne les résultats de recherche pendant la saisie

    " -- Généraux
        set fileformat=unix
        set backspace=indent,eol,start    " Active le comportement 'habituel' de la touche retour en arriere

        set history=500        " garde 500 lignes dans l'historique de commandes
        set showcmd        " Affiche les commandes incomplètes

        set autoindent        " Active l'indentation automatique
        set expandtab        " Remplacement automatique des tabulation par des espaces
        set tabstop=4        " Règle la longueur affiché d'une tabulation à 4 espaces.
        set shiftwidth=4    " Nombre d'espaces  pour chaque pas d'(auto-)indentation.
        set textwidth=79    " Coupe automatiquement les lignes de plus de 78 caractères

        set wildmenu    " Affiche un menu avec la liste des complétions possible un menu dans la ligne de commande
        set hidden " Cache un tampon abandonné plutôt que de le décharger

" -- Commandes custom
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

" -- Fonctions
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
            call search('Insert_here_the_page_description', 'w')
            set nofoldenable

        endif
    endfunction

    function GoToLastPosition()
        " jump to the last known cursor position if position is valid.
        if line("'\"") > 1 && line("'\"") <= line("$") 
            exe "normal! g`\"" 
        endif
    endfunction

" -- Autocommands (Only when compiled with support for autocommands.)
if has("autocmd")
    autocmd BufReadPost * call GoToLastPosition()

    " Met en surbrillance les caractères blanc en fin de ligne
    autocmd BufRead,BufNewFile * match BadWhitespace /\s\+$/
    highlight BadWhitespace ctermbg=red guibg=red

    " Met en surbrillance les espaces insécables
    autocmd BufRead,BufNewFile * match NonBreakableSpace / \+/
    highlight NonBreakableSpace ctermbg=238 guibg=lightgrey

    autocmd BufNewFile *.ino,*.h,*.c,*.cpp,*.py,*.html,*.php
        \ call CreateFromSkel('%')

    " Enable file type detection.
    filetype plugin indent on
    autocmd FileType lua setlocal textwidth=0
    autocmd FileType sh,bash,zsh setlocal foldmethod=indent

    autocmd FileType c,cpp,h,arduino
        \ setlocal foldmethod=syntax|
        \ setlocal tw=78

    autocmd FileType arduino
        \ nnoremap <leader>av :wa<CR>:ArduinoVerify<CR> |
        \ nnoremap <leader>au :wa<CR>:! screen -X kill<CR>:ArduinoUpload<CR> |
        \ nnoremap <leader>ad :wa<CR>:! screen -X kill<CR>:ArduinoUploadAndSerial<CR> |
        \ nnoremap <leader>as :! screen -X kill<CR>:ArduinoSerial<CR> |
        \ nnoremap <leader>ab :ArduinoChooseBoard<CR> |
        \ nnoremap <leader>ap :ArduinoChooseProgrammer<CR>

    " Recommendation de PEP8
    autocmd FileType python
        \ setlocal foldmethod=indent |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ let g:python_highlight_all = 1 |
        \ syntax match pythonFunction /\v\w[[:alpha:]_.]+\ze(\s?\()/

    autocmd FileType html
        \ setlocal foldmethod=indent |
        \ setlocal tabstop=2 |
        \ setlocal shiftwidth=2 |
        \ setlocal colorcolumn=79 |

    autocmd FileType css
        \ setlocal foldmethod=syntax |
        \ setlocal tabstop=2 |
        \ setlocal shiftwidth=2 |
        \ setlocal textwidth=50 |

    autocmd FileType javascript
        \ setlocal foldmethod=syntax |
        \ let g:javascript_plugin_jsdoc = 1 |


    autocmd FileType tex
        \ setlocal grepprg=grep\ -nH\ $*|
        \ setlocal tabstop=2|
        \ setlocal shiftwidth=2|
        \ setlocal textwidth=76|
        \ let l:tex_flavor = "latex"

    autocmd FileType po set textwidth=0
    autocmd BufWritePost *.po !powrap %

    autocmd insertLeave * set cursorline
    autocmd insertEnter * set nocursorline
    autocmd insertLeave * set cursorcolumn
    autocmd insertEnter * set nocursorcolumn

    highlight CursorLine  cterm=none ctermbg=Blue

endif

" -- Configuration du clavier
    let mapleader = ","        " Configure la touche <Leader>

    " Don't use Ex mode, use Q for formatting
    noremap Q gq

    " CTRL-A va au début de la ligne en mode commande
    cnoremap <C-A> <C-B>

    noremap <Space> za

    " Se passer de la touche Echap
    imap ,, <Esc>
    map ,, <Esc>

    " Delete from cursor do begin-of-line
    inoremap <C-U> <C-G>u<C-U>

    noremap <C-p> :<C-p>

    " Navigation dans les tags
    noremap <leader>s <C-]>
    " Parce que sur mon terminal CTRL-T donne <CR>
    noremap <leader>t :pop<CR>


" -- Configuration des plugins
    " -- Syntastic, analyseur de syntaxe
    if !exists(":Stm")
        command! Stm :SyntasticToggleMode
    endif

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " Configure syntastic for gettext files
    let g:syntastic_po_checkers = ["padpo"]
    let g:syntastic_po_padpo_args = "-i"
    let g:syntastic_po_padpo_exec = "~/.local/bin/padpo"

    " Configure syntastic for javascript files
    let g:syntastic_javascript_checkers=['eslint']
    let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

    "  Désactive Syntastic pour zsh_history, /usr/* et les backups sms
    let g:syntastic_ignore_files = [ '.*/\.zsh_history\(\.bak\)\=',
                                   \ '/usr/.*',
                                   \ '.*/\(calls\|sms\)-\d\{14}\.xml' ]


    " Divers
    let g:grammalecte_cli_py='$HOME/.local/bin/grammalecte-cli.py'
    let g:grammalecte_disable_rules=''

    let g:LustyExplorerSuppressRubyWarning = 1
    let g:LustyJugglerKeyboardLayout = "bépo"

    let g:ctrlp_map = '<leader>f'    " -- Configuration de Ctrlp

    let g:indentLine_char = '┊'

    let g:deoplete#enable_at_startup = 1
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
" vim: foldmethod=indent
