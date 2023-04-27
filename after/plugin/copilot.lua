vim.api.nvim_set_keymap('i', '<C-a>', 'copilot#Accept("<CR>")', {expr=true, silent=true})
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.cmd[[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]]
