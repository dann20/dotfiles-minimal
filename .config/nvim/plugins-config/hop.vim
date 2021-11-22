" Setup

lua << EOF
require('hop').setup({})
EOF

" LINE MOVEMENT
	nmap <Leader>L :HopLine<CR>
	nmap <Leader>j :HopLineAC<CR>
	nmap <Leader>k :HopLineBC<CR>

"CURRENT LINE MOVEMENT
	nmap <Leader>h :HopWordCurrentLineBC<CR>
	nmap <Leader>l :HopWordCurrentLineAC<CR>

" <Leader>f{char} to move to {char}
	nmap <Leader>f :HopChar1<CR>

" s{char}{char} to move to {char}{char}
	nmap s 		   :HopChar2<CR>

" Move to word
	nmap <Leader>W :HopWord<CR>

" Move to pattern
	nmap <Leader>/ 		   :HopPatternAC<CR>
	nmap <Leader>?         :HopPatternBC<CR>
	nmap <Leader><Leader>/ :HopPattern<CR>
