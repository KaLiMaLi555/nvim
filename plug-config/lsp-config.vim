set completeopt=menuone,noinsert,noselect
let g:completion_enable_auto_popup = 0

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)


" Lspsaga mappings
nnoremap <silent> <leader>ln <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <leader>lp <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
nnoremap <silent><S-k> <cmd>Lspsaga signature_help<CR>
nnoremap <silent><leader>lf <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent> <leader>ca <cmd>Lspsaga code_action<CR>
vnoremap <silent> <leader>ca <cmd><C-U>Lspsaga range_code_action<CR>
