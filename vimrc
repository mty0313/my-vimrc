set encoding=utf-8
colorscheme default
set number
set nocompatible
syntax on
set showmode
set showcmd
set t_Co=256
"filetype indent on
"安装vundle插件必须设置下面这一行
filetype off
filetype plugin on
filetype plugin indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
" 粘贴保持格式
"set paste
"光标在的当前行高亮
set cursorline
"设置每一行最多显示的字符数
set textwidth=200
"自动折行
set wrap "set nowrap
"只在指定符号处折行,不在单词内部折行
set linebreak
"垂直滚动时光标距离上下的位置
set scrolloff=5
"折行处与右边缘空出的字符数
set wrapmargin=2
"显示状态栏
set laststatus=2 "0 1 2
"光标遇到括号时自动高亮对应
set showmatch
"高亮显示匹配结果
set hlsearch
"搜索时忽略大小写
set ignorecase
"smartcase
set smartcase
"打开英语单词拼写检查
"set spell spelllang=en_us
"不创建备份文件
set nobackup
"不创建交换文件
set noswapfile
"保留撤销历史
set undofile
"设置备份文件,交换文件,操作历史文件保存的位置
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
"set undodir=~/.vim/.undo//
"自动切换工作目录
set autochdir
"出错时不要发出声响
set noerrorbells
"需要记住的历史操作条数
set history=1000
"打开文件监视, 当文件在编辑过程中被外部改变发出提示.
set autoread
"命令模式下,底部操作指令按下tab自动补全
set wildmenu
set wildmode=longest:list,full

"vundle插件
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here
Plugin 'croaky/vim-colors-github'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'neocomplcache'
Plugin 'tacahiroy/ctrlp-funky'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" 设置leader键为分号
let mapleader=";"

"配置nerdtree
nmap <F2> :NERDTreeToggle<cr>
"让nerdtree不要显示隐藏文件
let g:NERDTreeHidden=0
"设置nerdtree宽度
let NERDTreeWinSize=30
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"配置neocomplete
let g:neocomplete#enable_at_startup = 1 

"配置Tagbar
"设置宽度 位置
let g:tagbar_width=30
let g:tagbar_autofocus=1
let g:tagbar_right = 1
nmap <F3> :TagbarToggle<CR>

"配置ctrlp搜索
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" 用ag代替grep
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" 配置vimpowerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8 
set laststatus=2

" 配置ctrlp funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

" 让vim打开时光标停留在上一次打开的地方
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" force quit所有tab快捷键
nmap <leader>q : qall!<cr>

" 配置切换tab快捷键
nmap <F6> : tabp<cr>
nmap <F7> : tabn<cr>















