" Syntastic
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
