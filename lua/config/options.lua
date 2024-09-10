-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g

opt.termguicolors = true

opt.scrolloff = 15
opt.hlsearch = true
opt.incsearch = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.colorcolumn = "79"

opt.backspace = "indent,eol,start"

g.autoformat = false
g.maplocalleader = ","

g.codeium_disable_bindings = 1
