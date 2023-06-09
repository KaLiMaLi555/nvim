vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", '\"+y')
vim.keymap.set("v", "<leader>y", '\"+y')
vim.keymap.set("n", "<leader>Y", '\"+Y')

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader><leader>", vim.cmd.nohlsearch)

vim.keymap.set("n", "<C-s>", vim.cmd.w)

vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev)

vim.keymap.set("n", "<S-W>", vim.cmd.bd)

vim.keymap.set("n", "ZZ", CLOSE_ALL)

vim.keymap.set("n", "<leader>sm", ":lua require('kalimali.sessions').save_session()<CR>")
vim.keymap.set("n", "<leader>sd", ":lua require('kalimali.sessions').delete_session()<CR>")

vim.keymap.set("n", "<leader>fw", "/<C-R>=escape(expand('<cword>'), '/')<CR><CR>")

vim.keymap.set("n", "<leader>b", ":bufdo e<CR>")
