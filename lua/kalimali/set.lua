vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.hidden = true

vim.opt.sessionoptions = "buffers,curdir,globals,folds,tabpages,winsize"
vim.opt.listchars = { tab = "󱞩 ", eol = " " }
vim.opt.list = true

vim.opt.completeopt = "menuone,noinsert,noselect"

-- Removing the annoying and ugly ~ at the end of the buffer
vim.opt.fillchars = { eob = " " }
