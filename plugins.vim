" Fichier de gestion des modules
"
" Si le dossier bundle/Vundle.vim n’existe pas, lancer
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

filetype off     " required

call plug#begin(resolve(expand('<sfile>:p:h')).'/pluged')

Plug 'junegunn/vim-plug' " let Vundle manage Vundle, required

" Explorateurs de fichiers {{{
Plug 'https://github.com/sjbach/lusty.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
" }}}

" Analyseurs de syntaxe {{{
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'dense-analysis/ale', { 'for': 'python' }
Plug 'sheerun/vim-polyglot' " Gestion de la syntaxe pour plein de language
" }}}


Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Autre {{{
Plug 'vim-scripts/indentpython.vim' " indente correctement le code python
Plug 'Yggdroot/indentLine' " met en surbrillance les niveau d’indentation
Plug 'tpope/vim-commentary' " Commenter facilement du code

Plug 'hail2u/vim-css3-syntax' " Meilleure coloration syntaxique pour CSS3
Plug 'pangloss/vim-javascript'

"Plugin 'stevearc/vim-arduino'
Plug 'https://tpope.io/vim/surround.git'
Plug 'tpope/vim-fugitive' " Controler git depuis vim

Plug 'vim-airline/vim-airline'

Plug 'vifm/vifm.vim'
Plug 'jakykong/vim-zim'

Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'vim-scripts/po.vim'
" }}}

" ColorSheme {{{
Plug 'dikiaap/minimalist'
Plug 'sjl/badwolf'
" }}}

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" vim: foldmethod=marker
