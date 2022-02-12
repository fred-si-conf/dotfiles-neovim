" Configuration du BÉPO

" {W} -> [É]
" ——————————
	" On remappe W sur É :
	noremap é w
	noremap É W

	" Corollaire: on remplace les text objects aw, aW, iw et iW
	" pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
	onoremap aé aw
	onoremap aÉ aW
	onoremap ié iw
	onoremap iÉ iW

" [HJKL] -> {CTSR}
" ————————————————
	" {cr} = « gauche / droite »
	noremap c h
	noremap r l

	" {ts} = « haut / bas »
	noremap t j
	noremap s k

	" {CR} = « haut / bas de l'écran »
	noremap C H
	noremap R L

	" {TS} = « joindre / aide »
	noremap T J
	noremap S K

	" Corollaire : repli suivant / précédent
	noremap zs zj
	noremap zt zk
 
" {HJKL} <- [CTSR]
" ————————————————
	" {J} = « Jusqu'à »            (j = suivant, J = précédant)
	noremap j t
	noremap J T

	" {L} = « Change »             (l = attend un mot, L = jusqu'à la fin de ligne)
	noremap l c
	noremap L C

	" {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
	noremap h r
	noremap H R

	" {K} = « Substitue »          (k = caractère, K = ligne)
	noremap k s
	noremap K S

	" Corollaire : correction orthographique
	noremap ]k ]s
	noremap [k [s
 
" Désambiguation de {g}
" —————————————————————
	" ligne écran précédente / suivante (à l'intérieur d'une phrase)
	" Je n’arrive pas à comprendre l’utilité de ces commandes
	" :h gj pour plus d’infos
	"noremap gs gk
	"noremap gt gj

	" onglet précédant / suivant
	"noremap gb gT
	"noremap gé gt

	" optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
	noremap gB :exe "silent! tabfirst"<CR>
	noremap gÉ :exe "silent! tablast"<CR>

	" optionnel : {g"} pour aller au début de la ligne écran
	noremap g" g0
 
" <> en direct
" ————————————
	noremap « <
	noremap » >

	noremap! « <
	noremap! » >
	noremap! < «
	noremap! > »
 
" Remaper la gestion des fenêtres
" ———————————————————————————————
	noremap w <C-w>
	noremap ww <C-w><C-w>
	noremap W <C-w><C-w>
 
	" Ouverture / fermeture
		" Ferme la fenêtre active
		noremap wd :close<CR>

		" Ouvre une nouvelle fenêtre
		noremap wo :split<CR>
		noremap w<SPACE> :split<CR>

		noremap wv :vsplit<CR>
		noremap w<CR> <C-w>v

		noremap w» <C-w>>
		noremap w« <C-w><


	" Déplacement
		" Va à la N-ième fenêtre en dessous
		noremap wt <C-w>j
		" Va à la N-ième fenêtre au dessus
		noremap ws <C-w>k
		" Va à la N-ième fenêtre à gauche
		noremap wc <C-w>h
		noremap we <C-w>h
		" Va à la N-ième fenêtre à droite
		noremap wr <C-w>l

" Ajoute un peu du comportement de zsh au mode insertion
" ———————————————————————————————
	inoremap <C-f> <Right>
	inoremap <C-b> <Left>

	" Début/fin de ligne
	inoremap <C-a> <Esc>I
	inoremap <C-e> <Esc>A

	" Déplace le curseur d’une ligne vers le haut/bas en colonne de début
	" d’édition
	inoremap <C-g>s <C-g>k
	inoremap <C-g>t <C-g>j

" Parce que tapper ZZ c’est chiant
nnoremap JJ ZZ
nnoremap JQ ZQ

" Parce CTRL-S pour sauvegarder c’est pratique
nnoremap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

nnoremap <C-n> <C-d>
nnoremap <C-d> <<
