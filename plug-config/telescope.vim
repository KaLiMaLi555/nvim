lua require("kalimali")

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pm :lua require('telescope.builtin').marks()<CR>
nnoremap <C-F> :lua require("telescope.builtin").git_files()<CR>
nnoremap <C-B> :lua require("telescope.builtin").file_browser()<CR>

nnoremap <leader>vrc :lua require('kalimali.telescope').search_dotfiles()<CR>
nnoremap <leader>ccc :lua require('kalimali.telescope').git_branches()<CR>
