set completeopt=menuone,noinsert,noselect
let g:completion_enable_auto_popup = 0

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

let g:completion_confirm_key = ""
imap <expr> pumvisible() ? complete_info()["selected"] != "-1" ?
          \ "\<Plug>(completion_confirm_completion)" : "\<C-e>\<CR>" : "\<CR>"


" Lspsaga mappings
nnoremap <silent> <C-j> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-k> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
nnoremap <silent><C-k> <cmd>Lspsaga signature_help<CR>
nnoremap <silent><leader>lf <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent> <leader>ca <cmd>Lspsaga code_action<CR>
vnoremap <silent> <leader>ca <cmd><C-U>Lspsaga range_code_action<CR>
