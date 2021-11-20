" Lightline colorscheme settings

let g:lightline = {
	\ 'colorscheme': 'gruvbox_material',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
		\ },
	\ 'component_function': {
	\	'gitbranch': 'gitbranch#name',
	\   'cocstatus': 'coc#status'
		\ },
	\ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
