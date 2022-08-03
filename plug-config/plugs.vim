""""""""""""""""""""""""
" Vim-pluggins         "
""""""""""""""""""""""""
" Check if vim-plug is installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync
endif


call plug#begin()

" Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
" Plug 'connorholyday/vim-snazzy'
" Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
" Plug 'rebelot/kanagawa.nvim'
" Plug 'wojciechkepka/vim-github-dark'
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'

Plug 'machakann/vim-highlightedyank'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'hoob3rt/lualine.nvim'
" Plug 'zefei/vim-wintabs'
" Plug 'zefei/vim-wintabs-powerline'
Plug 'romgrk/barbar.nvim'

Plug 'mbbill/undotree'

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'numToStr/Comment.nvim'

Plug 'tpope/vim-repeat'

Plug 'preservim/tagbar'

" Plug '907th/vim-auto-save'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'mhinz/vim-startify'

Plug 'petRUShka/vim-sage'

Plug 'dbeniamine/cheat.sh-vim'

Plug 'szw/vim-maximizer'

" Plug 'voldikss/vim-floaterm'

" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'ThePrimeagen/harpoon'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'tjdevries/nlua.nvim'
" Plug 'simrat39/symbols-outline.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'tjdevries/complextras.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-git'
Plug 'tamago324/cmp-zsh'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Plug 'codota/tabnine-vim'
" Plug 'aca/completion-tabnine', { 'do': './install.sh' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'dstein64/vim-startuptime'
Plug 'ThePrimeagen/vim-be-good'

Plug 'sbdchd/neoformat'

Plug 'karb94/neoscroll.nvim'

call plug#end()
