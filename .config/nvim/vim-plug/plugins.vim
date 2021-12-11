" Plugs several plugins

call plug#begin()
Plug 'itchyny/lightline.vim'
" Plug 'kyazdani42/nvim-web-devicons' " If you want devicons
" Plug 'noib3/cokeline.nvim'
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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'vifm/vifm.vim'
Plug 'vimwiki/vimwiki'
Plug 'edkolev/tmuxline.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/vim-gitbranch'
Plug 'phaazon/hop.nvim'
" LSP related
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Gitsigns
" Plug 'nvim-lua/plenary.nvim'
" Plug 'lewis6991/gitsigns.nvim'
call plug#end()
