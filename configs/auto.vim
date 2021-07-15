" Required Functions
function! Toggle_transparent_background()
    hi Normal guibg=NONE ctermbg=NONE
endfunction


" Autogrps and Cmds
" augroup maintain_indents
"     autocmd!
"     autocmd FileType python :normal gg=G``
"     autocmd FileType cpp :normal gg=G``
"     autocmd FileType html :normal gg=G``
"     autocmd FileType css :normal gg=G``
"     autocmd FileType js :normal gg=G``
"     autocmd BufWritePre *.vim :normal gg=G``
" augroup END

augroup transparent_background
    autocmd!
    autocmd FileType * call Toggle_transparent_background()
augroup END

augroup dwm
    autocmd!
    autocmd BufWritePost ~/repos/Dwm-packages/dwmblocks/blocks.def.h !$HOME/repos/Dwm-packages/dwmblocks/buildscript.sh
augroup END
