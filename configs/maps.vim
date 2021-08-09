" Navigations mappings
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

" Switch between tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

nnoremap j <cmd>call <SID>jump_direction('j')<CR>
nnoremap k <cmd>call <SID>jump_direction('k')<CR>

nnoremap <silent> gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap <silent> gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

nnoremap <leader><leader>c :<up>

" Map execute this line
nnoremap <leader>x :call <SID>executor()<CR>
" Execute this file
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Undotree toggle
nnoremap <leader>u :UndotreeToggle<CR>

" Navigating across vim buffers
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprevious<CR>

nnoremap <S-W> :bd<CR>

nmap <S-P> viwp<CR>

" Some useful maps
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

let delimiters = [ ',', '.', '[', ']', '(', ')' ]
for delim in delimiters
    execute 'inoremap '.delim.' '.delim.'<c-g>u'
endfor

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Something new
nnoremap : ;
nnoremap ; :

nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>

""""""""""""""""""""""""
" Fix white space      "
""""""""""""""""""""""""
nnoremap <leader>sws :%s/\s\+$//<CR>




""""""""""""""""""""""""
" Functions
function! s:jump_direction(letter)
    let jump_count = v:count
    if jump_count == 0
        call execute(printf('normal! g%s', a:letter))
        return
    endif
    if jump_count > 5
        call execute("normal! m'")
    endif
    call execute(printf('normal! %d%s', jump_count, a:letter))
endfunction

function! s:executor() abort
    if &ft == 'lua'
        call execute(printf(":lua %s", getline(".")))
    elseif &ft == 'vim'
        execute getline(">")
    endif
endfunction

function! s:save_and_exec() abort
    if &filetype == 'vim'
        :silent! write
        :source %
    elseif &filetype == 'lua'
        :silent! write
        :luafile %
    endif
    return
endfunction
