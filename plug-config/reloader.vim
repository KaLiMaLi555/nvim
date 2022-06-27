" Run the current line in lua or vimscript
function! reloader#executor() abort
	if &ft == 'lua'
		call execute(printf(":lua %s", getline(".")))
	elseif &ft == 'vim'
		execute getline(">")
	endif
endfunction

" Run the current file in lua or vimscript
function! reloader#save_and_exec() abort
	if &filetype == 'vim'
		:silent! write
		:source %
	elseif &filetype == 'lua'
		:silent! write
		:luafile %
		:luafile ~/.config/nvim/lua/kalimali/snippets/init.lua
	endif
	return
endfunction
