local opt_settings = {
	termguicolors = true,
	number = true,
	relativenumber = true,
	scrolloff = 15,
	hlsearch = true,
	incsearch = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	smartindent = true,
	wrap = false,
	swapfile = false,
	backup = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
	signcolumn = "auto",
	backspace = "indent,eol,start",
	clipboard = "unnamedplus",
	guicursor = "n-v-c-i:block",
}

local global_settings = {
	autoformat = false,
	mapleader = " ",
	maplocalleader = ",",
	loaded_netrwPlugin = 1,
	loaded_netrw = 1,
}

local utils = require("utils")
utils.update_table(vim.opt, opt_settings)
utils.update_table(vim.g, global_settings)
