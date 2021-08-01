""""""""""""""""""""""""
" Colors               "
""""""""""""""""""""""""
let g:gruvbox_contrast_dark = 'hard'
set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme ghdark
set background=dark
set t_Co=255
set laststatus=2


""""""""""""""""""""""""
" Autocompletions      "
""""""""""""""""""""""""
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


""""""""""""""""""""""""
" Tabs and Spaces      "
""""""""""""""""""""""""
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab
set smartindent
let g:extra_whitespace_ignored_filetypes = ['TelescopePrompt']


""""""""""""""""""""""""
" UI Config            "
""""""""""""""""""""""""
set number relativenumber cursorline wildmenu showmatch showcmd nowrap
set statusline^=%{coc#status()}
set scrolloff=8
set modifiable
set hidden
set noerrorbells
set noswapfile nobackup
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
