set nocompatible " no vi compatible
filetype on
filetype plugin indent on " enable file type detection

""带有如下符号的单词不要被换行分割"
set iskeyword+=_,$,@,%,#,-
""被分割的窗口间显示空白，便于阅读"
set fillchars=vert:\ ,stl:\ ,stlnc:\

"--------------------
" Font and color
"--------------------
"set guifont=dejaVu\ Sans\ MONO\ 10
"set guifont=Courier_New:h10:cANSI

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
colorscheme solarized
let g:lightline = {'colorscheme': 'solarized'}
"if has('gui_running')
    "colorscheme solarized
    "let g:lightline = {'colorscheme': 'solarized'}
"elseif &t_Co < 256
    "colorscheme default
    "set nocursorline " looks bad in this mode
"else
    "set background=dark
    "let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
    "colorscheme solarized
    "" customized colors
    "highlight SignColumn ctermbg=234
    "highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
    "highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
    "let g:lightline = {'colorscheme': 'default'}
    "highlight SpellBad cterm=underline
    "" patches
    "highlight CursorLineNr cterm=NONE
"endif

"--------------------
" Indent and editing
"--------------------

syntax on " turn on syntax highlighting
set shortmess+=I " disable startup message
set nu " number lines
set rnu " relative line numbering
set hlsearch " highlight search
set incsearch " incremental search (as sting is being typed)
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" 
set ai " set auto indent
set wrap " change line with
" tab completion for files/buferss
set wildmode=longest,list
set wildmenu

set ruler " open ruler

set showmatch " show matching braces when text indicator is over them
set ignorecase
"If there contains andy capital letters, the search becomes case sensitive"
set smartcase
set mouse+=a " enable mouse mode
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set nofoldenable " disable folding by default
set showcmd " show command line
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set noshowmode " hide mode
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
set pastetoggle=<F9>

set completeopt=longest,preview,menu

set clipboard+=unnamed


"--------------------
" Encoding config
"--------------------
"set encoding=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8 " set file encoding
set langmenu=zh_CN.UTF-8 " set language encoding
set helplang=cn
set confirm

"--------------------
" Misc configurations
"--------------------

" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop>

" disable audible bell
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" movement relative to display lines
nnoremap <silent> <Leader>d :call ToggleMovementByDisplayLines()<CR>
function SetMovementByDisplayLines()
    noremap <buffer> <silent> <expr> k v:count ? 'k' : 'gk'
    noremap <buffer> <silent> <expr> j v:count ? 'j' : 'gj'
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction
function ToggleMovementByDisplayLines()
    if !exists('b:movement_by_display_lines')
        let b:movement_by_display_lines = 0
    endif
    if b:movement_by_display_lines
        let b:movement_by_display_lines = 0
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
    else
        let b:movement_by_display_lines = 1
        call SetMovementByDisplayLines()
    endif
endfunction

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" save read-only files
command -nargs=0 Sudow w !sudo tee % >/dev/null

set nobackup
set noswapfile

"---------------------
" Plugin configuration
"---------------------
"
packloadall
silent! helptags ALL
" 设置fzf.vim快捷键
nnoremap <silent> <C-p> :Files<CR>
nnoremap <Leader>g :Rg<CR>

" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" Ale linters settings
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\}

" 当地vimrc设置，位置位于~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
	source $LOCALFILE
endif
