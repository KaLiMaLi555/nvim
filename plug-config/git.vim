""""""""""""""""""""""""
" Git changes          "
""""""""""""""""""""""""
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
set updatetime=100


""""""""""""""""""""""""
" Toggle for numbers   "
""""""""""""""""""""""""
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


"""""""""""""""""""""""""""
" Jumping through hunks   "
"""""""""""""""""""""""""""
nmap <leader>gn <plug>(signify-next-hunk)
nmap <leader>gp <plug>(signify-prev-hunk)


""""""""""""""""""""""""
" Mappings for git     "
""""""""""""""""""""""""
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gr :Git restore %<CR>


" If you like colors instead
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
