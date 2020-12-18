" --------------------- General Settings -----------------------
set noshowmode
syntax on
colorscheme onehalfdark 

set autoindent
set ruler
set relativenumber
set number


" ------------------------- Plugins ----------------------------
" Specify a directory for plugins
call plug#begin('~/.config/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

Plug 'mattn/emmet-vim'

Plug 'dense-analysis/ale'

Plug 'airblade/vim-rooter'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'mhinz/vim-startify'

" Init Plugin System
call plug#end()

" ------------------- Lightline Settings -----------------------
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ }


" ------------------- NERDTree Settings ------------------------

map <C-n> :NERDTreeToggle<CR>
