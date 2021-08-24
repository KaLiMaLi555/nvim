nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>ha :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hs :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>hd :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>hf :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <leader>hq :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>hw :lua require("harpoon.term").gotoTerminal(2)<CR>
