let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': [ 'tabnine', 'lsp', 'snippet' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}

let g:completion_tabnine_priority = 1
let g:completion_tabnine_max_num_results=6
let g:completion_tabnine_sort_by_details=1
let g:completion_tabnine_max_lines=1000
