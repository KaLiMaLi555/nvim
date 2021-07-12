" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Draw border with both
let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

nnoremap <silent> <leader>r :RnvimrToggle<CR>
tnoremap <silent> <leader>r <C-\><C-n>:RnvimrToggle<CR>
