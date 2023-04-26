-- Nvim-Tree
vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>tg', function()
        builtin.grep_string({search = vim.fn.input("Grep > ") });

end)

-- UndoTree
vim.keymap.set("n", "<leader>u",  vim.cmd.UndotreeToggle)

--Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>ha", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hs", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hd", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hf", function() ui.nav_file(4) end)

-- Nvterm
vim.keymap.set("n", "<C-h>", ":lua require('nvterm.terminal').toggle 'horizontal'<CR>")
vim.keymap.set("n", "<C-l>", ":lua require('nvterm.terminal').toggle 'float'<CR>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><CR><CR> :lua require('nvterm.terminal').toggle 'horizontal'<CR>")
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><CR><CR> :lua require('nvterm.terminal').toggle 'float'<CR>")

-- Neogit
vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit)

-- For Finecmdline
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
