" Required Functions
" function! Toggle_transparent_background()
"     hi Normal guibg=NONE ctermbg=NONE
" endfunction


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

" augroup transparent_background
"     autocmd!
"     autocmd FileType * call Toggle_transparent_background()
" augroup END

augroup floaterm_bindings
    autocmd! floaterm_bindings
    autocmd FileType floaterm tnoremap <buffer> <Esc> <C-\><C-N>
augroup END

augroup Term_config
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" augroup highlight_yank
"     autocmd!
"     autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
" augroup END

augroup dwm
    autocmd!
    autocmd BufWritePost ~/repos/Dwm-packages/dwmblocks/blocks.def.h !$HOME/repos/Dwm-packages/dwmblocks/buildscript.sh
    autocmd BufWritePost ~/repos/Dwm-packages/dwm/config.def.h !$HOME/repos/Dwm-packages/dwm/buildscript.sh
augroup END

augroup cursorcolumn
	autocmd! FileType yaml set cursorcolumn
	autocmd! FileType yml set cursorcolumn
	autocmd! FileType python set cursorcolumn
augroup END
