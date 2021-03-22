" KEYMAPPING

let mapleader = ","
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>
map <C-n> :NERDTreeToggle<CR>
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
nnoremap <M-d> <C-d>
nnoremap <M-u> <C-u>
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
	" Completion
nnoremap <M-n> <C-n>
	" Replace all
nnoremap S :%s//g<Left><Left>

	" Keymaps for buffers
		" \l       : list buffers
		" Ctrl-w \g : forward/last-used
		" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>k :Buffers<CR>
nnoremap <C-w> :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>L :blast<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>J :bfirst<CR>
nnoremap <Leader>d :bdelete<CR>

	" Return to previous/last cursor location
nnoremap <M-o> <C-o>
nnoremap <M-i> <C-i>

	" Open Commands fzf
map <Leader>c :Commands<CR>

	" Open help in vertical split
cnoremap help vertical help

	" Map double ESC to escape in terminal mode
tnoremap <silent> <C-[><C-[> <C-\><C-n>

	" Run selection in python
map <Leader>R :CocCommand python.execSelectionInTerminal<CR>

	" Disable/Enable bufferline
nnoremap <Leader><Leader>b :au! CursorHold<CR>
nnoremap <Leader>b :call bufferline#init_echo()<CR>

	" Restart coc.nvim
nnoremap <Leader><Leader>r :CocRestart<CR>

	" Outline mode based on indentation (python mostly)
nnoremap <Leader><Leader>f :set foldmethod=indent<CR>
