let g:floaterm_height = 1.0
let g:floaterm_width = 1.0
let g:floaterm_wintype = 'float'
let g:floaterm_keymap_toggle = 't'

augroup floaterm_bindings
    autocmd! floaterm_bindings
    autocmd FileType floaterm tnoremap <buffer> <Esc> <C-\><C-N>
augroup END
