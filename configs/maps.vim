" Navigations mappings
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

" Switch between tabs
nnoremap <Right> gt
nnoremap <Left> gT
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <leader>tq :tabclose <cr>
nnoremap <leader>tn :tabnew <cr>

" Sizing window horizontally
nnoremap <C-,> <C-W><
nnoremap <C-.> <C-W>>
" nnoremap <A-,> <C-W>5<
" nnoremap <A-.> <C-W>5>

nnoremap j <cmd>call <SID>jump_direction('j')<CR>
nnoremap k <cmd>call <SID>jump_direction('k')<CR>

nnoremap <silent> gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap <silent> gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

" Map execute this line
nnoremap <leader>x :call <SID>executor()<CR>
" Execute this file
nnoremap <leader>sx :call <SID>save_and_exec()<CR>

" turn off search highlight
nnoremap <leader><leader> :nohlsearch<CR>

" Undotree toggle
nnoremap <leader>u :UndotreeToggle<CR>

" Move between Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-W> :bd<CR>
nmap <C-q> <C-w>q

nnoremap <leader>m :MaximizerToggle<CR>

nmap <S-P> viwp<CR>
nnoremap <leader>p pg`[1v

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
" nnoremap : ;
" nnoremap ; :

nnoremap <leader>fw /<C-R>=escape(expand("<cword>"), "/")<CR><CR>

" Fix white space
nnoremap <leader>sws :%s/\s\+$//<CR>

" Tagbar
nnoremap <silent>// :TagbarToggle<CR>

" Esc and save
inoremap jk <Esc>:w<Cr>
inoremap kj <Esc>:w<Cr>
inoremap jj <Esc>:w<Cr>
inoremap kk <Esc>:w<Cr>


" Mappings for exiting from tabs
nnoremap <silent>ZZ :wqa<CR>
nnoremap <silent>ZL :qa!<CR>

" If you forgot putting the line under curly braces
nnoremap <leader>cu :norm ySS{kJ<cr>

" Helpful delete/change into blackhole buffer
nmap <leader>d "_d
nmap <leader>c "_c
nmap <space>d "_d
nmap <space>c "_c


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
