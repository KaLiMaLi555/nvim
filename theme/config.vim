""""""""""""""""""""""""
" Colors               "
""""""""""""""""""""""""
colorscheme gruvbox
set background=dark
set t_Co=255
set laststatus=2


""""""""""""""""""""""""
" Tabs and Spaces      "
""""""""""""""""""""""""
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab


""""""""""""""""""""""""
" UI Config            "
""""""""""""""""""""""""
set number relativenumber cursorline wildmenu showmatch showcmd nowrap
set statusline^=%{coc#status()}
set scrolloff=8
set modifiable
let g:AutoPairsFlyMode = 1


""""""""""""""""""""""""
" Searching            "
""""""""""""""""""""""""
set incsearch hlsearch


""""""""""""""""""""""""
" Undo Dir             "
""""""""""""""""""""""""
set undodir="~/.config/nvim/.undodir"
set undofile


""""""""""""""""""""""""
" File Settings        "
""""""""""""""""""""""""
syntax on
filetype plugin indent on
