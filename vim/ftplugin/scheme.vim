set lisp
set autoindent
nmap <buffer> <F5> <Esc>:w<CR>:!clear; racket --repl --eval '(enter\! (file "./%"))'<CR>
