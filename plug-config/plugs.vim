""""""""""""""""""""""""
" Vim-pluggins         "
""""""""""""""""""""""""
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'

Plug 'mbbill/undotree'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'bronson/vim-trailing-whitespace'

Plug 'jiangmiao/auto-pairs'

Plug 'tomtom/tcomment_vim'

Plug '907th/vim-auto-save'

Plug 'preservim/nerdtree'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'mhinz/vim-startify'

Plug 'petRUShka/vim-sage'

Plug 'dbeniamine/cheat.sh-vim'

Plug 'sillybun/vim-repl'

Plug 'szw/vim-maximizer'

Plug 'voldikss/vim-floaterm'

call plug#end()
