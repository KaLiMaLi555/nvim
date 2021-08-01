" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Undotree toggle
nnoremap <leader>u :UndotreeToggle<CR>

" Mapping for saving and sourcing vim-init
nnoremap <leader>s :w <bar> :source %<CR>

" Navigating across vim buffers
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprevious<CR>

nnoremap <S-W> :bd<CR>

nmap <S-P> viwp<CR>

" Some useful maps
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

let delimiters = [ ',', '.', '[', ']', '(', ')' ]
for delim in delimiters
    execute 'inoremap '.delim.' '.delim.'<c-g>u'
endfo

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
