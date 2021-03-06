set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
Plugin 'tell-k/vim-autopep8'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
call vundle#end()            " required
filetype plugin indent on    " required

"Enble folding
set foldmethod=indent
set foldlevel=99
set nocompatible "关闭与vi的兼容模式
set number "显示行号
set nowrap    "不自动折行
set showmatch    "显示匹配的括号
set scrolloff=3        "距离顶部和底部3行"
set encoding=utf-8  "编码
set fenc=utf-8      "编码
"set mouse=a        "启用鼠标
set hlsearch        "搜索高亮
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
syntax on    "语法高亮
syntax enable
set background=dark
"colorscheme solarized
set t_Co=256
let g:solarized_termcolors=256
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue set fileformat=unix
autocmd FileType vue syntax sync fromstart
au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css

let g:jedi#auto_initialization = 0
let g:ycm_auto_trigger = 1

let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数
let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径
let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗

let g:syntastic_always_populate_loc_list = 1 "修复错误之后自动更新它的底部描述
let g:syntastic_check_on_open = 1 "打开文件时 Syntastic 插件自动高亮显示错误
let g:syntastic_auto_jump = 1 "保存或打开文件时让光标跳转到检测到的第一个问题处
let g:syntastic_javascript_checkers = ['eslint']

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "W"
    if &filetype == 'python'
        exec "!time python2.7 %"
    endif
endfunc
