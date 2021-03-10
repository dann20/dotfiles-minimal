" Plugs several plugins

call plug#begin()
Plug 'itchyny/lightline.vim'
" Plug 'dikiaap/minimalist'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot' "language packs
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' "nerdtree icons
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-bufferline'
Plug 'junegunn/goyo.vim' "z-mode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'vifm/vifm.vim'
Plug 'vimwiki/vimwiki'
call plug#end()
