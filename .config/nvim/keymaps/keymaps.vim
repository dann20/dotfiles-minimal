" KEYMAPPING

let mapleader = ","
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>
map <M-t> :Goyo \| set linebreak<CR>
	" Copy/Paste keys
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+p
map <C-P> "+P
	" Change focus keys
nnoremap <M-l> <C-w>l
nnoremap <M-k> <C-w>k
nnoremap <M-j> <C-w>j
nnoremap <M-h> <C-w>h
nnoremap <M-w> <C-w>w
	" Surf keys
nnoremap <S-l> 10l
nnoremap <S-h> 10h
	" Resize keys
nnoremap <M-,> <C-w><
nnoremap <M-.> <C-w>>
nnoremap <M-=> <C-w>=
nnoremap <M-[> <C-w>-
nnoremap <M-]> <C-w>+
	" Move windows
	"" Swap current window with the next one
nnoremap <M-r> <C-w>x
	"" Rotate windows
nnoremap <M-R> <C-w>r
	" Replace all
nnoremap S :%s//g<Left><Left>

	" Keymaps for buffers
		" \l       : list buffers
		" Ctrl-w \g : forward/last-used
		" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap ;l 		:Buffers<CR>
nnoremap ;<space>   :e#<CR>
nnoremap ;1 		:1b<CR>
nnoremap ;2 		:2b<CR>
nnoremap ;3 		:3b<CR>
nnoremap ;4 		:4b<CR>
nnoremap ;5 		:5b<CR>
nnoremap ;6 		:6b<CR>
nnoremap ;7 		:7b<CR>
nnoremap ;8 		:8b<CR>
nnoremap ;9 		:9b<CR>
nnoremap ;0 		:10b<CR>
nnoremap ;J 		:bfirst<CR>
nnoremap ;j 		:bp<CR>
nnoremap ;K 		:blast<CR>
nnoremap ;k 		:bn<CR>
nnoremap ;d 		:bdelete<CR>

	" Open Commands fzf
map <Leader>c :Commands<CR>

	" Map double ESC to escape in terminal mode
tnoremap <silent> <C-[><C-[> <C-\><C-n>

	" Run selection in python. Only when installed coc-python (deprecated)
" map <Leader>R :CocCommand python.execSelectionInTerminal<CR>

	" Disable/Enable bufferline
nnoremap <Leader>B :au! CursorHold<CR>
nnoremap <Leader>b :call bufferline#init_echo()<CR>

	" Restart coc.nvim
nnoremap <Leader><Leader>r :CocRestart<CR>

	" Outline mode based on indentation (python mostly)
nnoremap <Leader><Leader>F :set foldmethod=indent<CR>

	" Format csv to column-aligned
nnoremap <Leader>F :%!column -t -s ','<CR>
