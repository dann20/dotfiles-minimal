" NERDTree plugin settings

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
nnoremap <leader>n :NERDTreeToggle<CR>
	" Close vim when there is only nerdtree window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
