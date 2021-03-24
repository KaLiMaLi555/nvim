" Bindings for FZF
nnoremap <C-T> :FZF<CR>
nnoremap <C-B> :Buffers<CR>

" This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
