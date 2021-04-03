augroup maintain_indents
    autocmd!
    autocmd FileType python :normal gg=G``
    autocmd FileType cpp :normal gg=G``
    autocmd FileType html :normal gg=G``
    autocmd FileType css :normal gg=G``
    autocmd FileType js :normal gg=G``
    autocmd BufWritePre *.vim :normal gg=G``
augroup END
