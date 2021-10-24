let g:startify_custom_header = [
    \ '                                                                                ',
    \ '             __ __      __    _ __  ___      __    _ __________________         ',
    \ '            / //_/___ _/ /   (_)  |/  /___ _/ /   (_) ____/ ____/ ____/         ',
    \ '           / ,< / __ `/ /   / / /|_/ / __ `/ /   / /___ \/___ \/___ \           ',
    \ '          / /| / /_/ / /___/ / /  / / /_/ / /___/ /___/ /___/ /___/ /           ',
    \ '         /_/ |_\__,_/_____/_/_/  /_/\__,_/_____/_/_____/_____/_____/            ',
    \ '                                                                                ',
    \ ]

let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 't': '~/.tmux.conf' },
            \ ]

let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_session_savevars = [
	\ 'g:WinBufManager'
	\ ]
