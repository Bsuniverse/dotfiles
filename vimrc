"开启相关插件"
""侦测文件类型"
filetype on
"载入文件类型插件"
"filetype plugin on
""为特定文件类型载入相关缩进文件"

"保存全局变量"
"set viminfo+=!
"
""带有如下符号的单词不要被换行分割"
set iskeyword+=_,$,@,%,#,-

"通过使用: commands命令，告诉我们文件的哪一行被改变过"
"set report=0
"
""被分割的窗口间显示空白，便于阅读"
set fillchars=vert:\ ,stl:\ ,stlnc:\

"""""""""""""""""""""""""""""""""
"""=>字体和颜色<="""
"""""""""""""""""""""""""""""""""
"自动开启语法高亮"
syntax enable
"
""设置字体"
"set guifont=dejaVu\ Sans\ MONO\ 10
"set guifont=Courier_New:h10:cANSI
"
""设置颜色"
colorscheme desert
"
""高亮显示当前行"
set cursorline
hi cursorline guibg=#00ff00
hi CursorColumn guibg=#00ff00

"高亮显示普通txt文件（需要txt.vim脚本）"
"au BufRead,BufNewFile *  setfiletype txt
"
""""""""""""""""""""""""""""""""
"""=>代码折叠功能<="""
"""""""""""""""""""""""""""""""
"激活折叠功能"
"set foldenable
""set nofen（这个是关闭折叠功能）"

"设置按照语法方式折叠（可简写set fdm=XX）"
""有6种折叠方法：
"manual   手工定义折叠"
""indent   更多的缩进表示更高级别的折叠"
"expr     用表达式来定义折叠"
""syntax   用语法高亮来定义折叠"
"diff     对没有更改的文本进行折叠"
""marker   对文中的标志进行折叠"
set foldmethod=manual
"set fdl=0（这个是不选用任何折叠方法）"
"
""设置折叠区域的宽度"
"如果不为0，则在屏幕左侧显示一个折叠标识列
""分别用“-”和“+”来表示打开和关闭的折叠
set foldcolumn=0

"设置折叠层数为3"
"setlocal foldlevel=3
"
""设置为自动关闭折叠"
set foldclose=all

"用空格键来代替zo和zc快捷键实现开关折叠"
""zo O-pen a fold (打开折叠)
"zc C-lose a fold (关闭折叠)
""zf F-old creation (创建折叠)
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"
""""""""""""""""""""""""""""""""""""
"""=>文字处理<="""
"""""""""""""""""""""""""""""""""""
"使用空格来替换Tab"
"set expandtab
"
""设置所有的Tab和缩进为4个空格"
set tabstop=4

"缩进，自动缩进（继承前一行的缩进）"
""set autoindent 命令打开自动缩进，是下面配置的缩写
"可使用autoindent命令的简写，即“:set ai”和“:set noai”
""还可以使用“:set ai sw=4”在一个命令中打开缩进并设置缩进级别
set ai
set cindent

"智能缩进"
"set si
"
""自动换行”
set wrap

"设置软宽度"
"set sw=4
"
""行内替换"
set gdefault

""""""""""""""""""""""""""""""""""
"""=>Vim 界面<="""
""""""""""""""""""""""""""""""""""
"增强模式中的命令行自动完成操作"
"set wildmenu
"
""显示标尺"
set ruler

"设置命令行的高度"
"set cmdheight=1
"
""显示行数"
set nu
""显示相对行数，方便计数跳跃
set relativenumber

"不要图形按钮"
"set go=
"
""在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能"
set lz

"使backspace正常处理indent, eol, start等"
set backspace=eol,start,indent
"
""允许空格键和光标键跨越行边界"
set whichwrap+=<,>,h,l

"设置魔术"
"set magic
"
""关闭遇到错误时的声音提示"
"关闭错误信息响铃"
"set noerrorbells
"
""关闭使用可视响铃代替呼叫"
set novisualbell

"高亮显示匹配的括号([{和}])"
"set showmatch
"
""匹配括号高亮的时间（单位是十分之一秒）"
set mat=2

"光标移动到buffer的顶部和底部时保持3行距离"
"set scrolloff=3
"
""搜索逐字符高亮"
set hlsearch
set incsearch

"搜索时不区分大小写"
""还可以使用简写（“:set ic”和“:set noic”）"
set ignorecase
"If there contains andy capital letters, the search becomes case sensitive"
set smartcase
"Enable mouse support"
set mouse+=a

"用浅色高亮显示当前行"
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul
"
""输入的命令显示出来，看的清楚"
set showcmd

""""""""""""""""""""""""""""""""""""
"""=>编码设置<="""
""""""""""""""""""""""""""""""""""""
"设置编码"
"set encoding=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"
""设置文件编码"
set fileencodings=utf-8

"设置终端编码"
"set termencoding=utf-8
"
""设置语言编码"
set langmenu=zh_CN.UTF-8
set helplang=cn

"""""""""""""""""""""""""""""
"""=>其他设置<="""
"""""""""""""""""""""""""""""
"开启新行时使用智能自动缩进"
"set smartindent
"set cin
"set showmatch
"
""在处理未保存或只读文件的时候，弹出确认"
set confirm

"隐藏工具栏"
"set guioptions-=T
"
""隐藏菜单栏"
set guioptions-=m

"置空错误铃声的终端代码"
"set vb t_vb=
"
""显示状态栏（默认值为1，表示无法显示状态栏）"
set laststatus=2

"状态行显示的内容"
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\
"%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"
""粘贴不换行问题的解决方法"
set pastetoggle=<F9>

"
""文件类型自动检测，代码智能补全"
set completeopt=longest,preview,menu

"共享剪切板"
"set clipboard+=unnamed
"
""从不备份"
set nobackup
set noswapfile

set runtimepath+=~/.fzf
set runtimepath^=~/.vim/bundle/nerdcommenter
packloadall
silen! helptags ALL
"设置历史记录步数"
set history=1000
" 设置fzf.vim快捷键
nnoremap <silent> <C-p> :Files<CR>
nnoremap <leader>g :Rg<Cr>

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

