let g:floaterm_height = 0.8
let g:floaterm_width = 0.8
let g:floaterm_wintype = 'float'
let g:floaterm_keymap_toggle = '<S-F>'

augroup floaterm_bindings
    autocmd! floaterm_bindings
    autocmd FileType floaterm tnoremap <buffer> <Esc> <C-\><C-N>
augroup END
