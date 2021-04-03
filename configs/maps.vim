" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Undotree toggle
nnoremap <leader>u :UndotreeToggle<CR>

" Mapping for saving and sourcing vim-init
nnoremap <leader>s :w <bar> :source % <bar> :PlugInstall <CR>

" Navigating across vim buffers
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprevious<CR>

" nmap <C-W> :bd<CR>

nmap <leader>p viwp<CR>
