set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set showmatch

let python_highlight_all = 1  " python-syntax package
nmap <buffer> <F5> <Esc>:w<CR>:!clear; python3 %<CR>
nmap <buffer> <F6> <Esc>:w<CR>:!clear; python3 -m ipdb %<CR>
