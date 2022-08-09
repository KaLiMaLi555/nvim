nnoremap <silent> ;l :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>tfw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>
nnoremap <silent> ;m <Cmd>Telescope marks<CR>
nnoremap <silent> ;/ <Cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <leader>km <Cmd>Telescope keymaps<CR>
nnoremap <C-G> :lua require("kalimali.telescope").find_files()<CR>
nnoremap <C-F> <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>

nnoremap <leader>te :lua require('kalimali.telescope').search_envs()<CR>
nnoremap <leader>tg :lua require('kalimali.telescope').git_status()<CR>

nnoremap <leader>vrc :lua require('kalimali.telescope').search_dotfiles()<CR>
noremap <leader>ccc :lua require('kalimali.telescope').git_branches()<CR>
