lua require("kalimali")

nnoremap <silent> ;l :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>
nnoremap <silent> ;m <Cmd>Telescope marks<CR>
nnoremap <silent> ;/ <Cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-F> :lua require("telescope.builtin").git_files()<CR>
nnoremap <C-B> :lua require("telescope.builtin").file_browser()<CR>

nnoremap <leader>vrc :lua require('kalimali.telescope').search_dotfiles()<CR>
nnoremap <leader>ccc :lua require('kalimali.telescope').git_branches()<CR>
