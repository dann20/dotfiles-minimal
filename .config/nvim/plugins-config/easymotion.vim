let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
	map  <Leader>f <Plug>(easymotion-bd-f)
	nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
	nmap s <Plug>(easymotion-overwin-f2)

" Move to line
	map <Leader>L <Plug>(easymotion-bd-jk)
	nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
	map  <Leader>W <Plug>(easymotion-bd-w)
	nmap <Leader>W <Plug>(easymotion-overwin-w)

" ORIGINAL SEARCH REPLACEMENT
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)

	" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
	" Without these mappings, `n` & `N` works fine. (These mappings just provide
	" different highlight method and have some other features )
	map  n <Plug>(easymotion-next)
	map  N <Plug>(easymotion-prev)

" LINE MOVEMENT
	map <Leader>l <Plug>(easymotion-lineforward)
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
	map <Leader>h <Plug>(easymotion-linebackward)

	let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Fix conflicts with coc.nvim
	autocmd User EasyMotionPromptBegin silent! CocDisable
	autocmd User EasyMotionPromptEnd silent! CocEnable
