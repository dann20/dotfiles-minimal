" GENERAL SETTINGS

set encoding=UTF-8
set number relativenumber
set ic
set nohls is
set numberwidth=5
syntax on
filetype plugin on " For vimwiki
	" Tab settings
set tabstop=4 shiftwidth=4 expandtab
	" Disable show mode for lightline
set noshowmode
set autoindent
set cursorline
set splitright
set splitbelow
	" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Correct comment highlight for coc-settings.json
autocmd FileType json syntax match Comment +\/\/.\+$+
	" Automatically deletes all trailing whitespace on save
fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'ruby\|markdown\|perl'
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
	" Set buffer can be hidden when switch to another buffer (not written)
set hidden
set confirm
set termguicolors
set exrc
