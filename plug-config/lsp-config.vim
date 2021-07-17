set completeopt=menuone,noinsert,noselect
let g:completion_enable_auto_popup = 0

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = ""
imap <expr> pumvisible() ? complete_info()["selected"] != "-1" ?
          \ "\<Plug>(completion_confirm_completion)" : "\<C-e>\<CR>" : "\<CR>"

" lsp config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

" Lspsaga mappings
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs <cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> gr :Lspsaga rename<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

" Lspsaga codeactions
nnoremap <silent> <leader>ca <cmd>Lspsaga code_action<CR>
vnoremap <silent> <leader>ca <cmd><C-U>Lspsaga range_code_action<CR>
