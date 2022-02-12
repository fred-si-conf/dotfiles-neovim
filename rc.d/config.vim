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

if !exists('colors_name')    " Si minimalist ne réussi pas à se charger
    colorscheme desert        " colors_name n'existe pas
endif

" -- Recherche
set ignorecase      " Ignore la casse lors d’une recherche
set smartcase       " Si une recherche contient une majuscule, réactive la sensibilité a la casse
set hlsearch        " Surligne les résultats de recherche
set incsearch       " Surligne les résultats de recherche pendant la saisie

" -- Généraux
set fileformat=unix
set backspace=indent,eol,start    " Active le comportement 'habituel' de la touche retour en arriere

set history=500     " garde 500 lignes dans l'historique de commandes
set showcmd         " Affiche les commandes incomplètes

set autoindent      " Active l'indentation automatique
set expandtab       " Remplacement automatique des tabulation par des espaces
set tabstop=4       " Règle la longueur affiché d'une tabulation à 4 espaces.
set shiftwidth=4    " Nombre d'espaces  pour chaque pas d'(auto-)indentation.
set textwidth=79    " Coupe automatiquement les lignes de plus de 78 caractères

set wildmenu        " Menu d’autocomplétion de la ligne de commande
set hidden          " Cache un tampon abandonné plutôt que de le décharger
