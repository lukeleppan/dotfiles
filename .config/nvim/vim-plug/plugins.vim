call plug#begin('~/.config/plugged')

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'preservim/nerdtree'

  Plug 'sheerun/vim-polyglot'
  Plug 'joshdick/onedark.vim'

  Plug 'mattn/emmet-vim'

  Plug 'dense-analysis/ale'

  Plug 'airblade/vim-rooter'

  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'dracula/vim'

  Plug 'mhinz/vim-startify'
  
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

  Plug 'justinmk/vim-sneak'

  Plug 'liuchengxu/vim-which-key'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()
