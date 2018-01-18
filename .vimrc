" color
" colorscheme 
color slate
"syntax enable
syntax enable

" tab & space
" number of visual spaces per TAB
set tabstop=4
" 点击tab 输入的 space数量 点击删除 删除的space数量
set softtabstop=4
" 使用space 替代 tab 禁用 会影响space当作leader key
"set expandtab

"encoding
set encoding=utf-8
 
" ui config
" show line number
set number
" show command in bottom bar
set showcmd
" highlight current line
" set cursorline
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to 
set lazyredraw
" highlight matching [{()}]
set showmatch

" search
" search as characters are entered
set incsearch
" highlight matchs
set hlsearch

"movement 

" 一行过长 会自动换行 , j k 会移动到 自动换行出来的第二行
nnoremap j gj
nnoremap k gk

" 去掉Scrollbar
set guioptions-=r
set guioptions-=L

" esc jk
inoremap jk <esc>

" leader key space
let mapleader="\<space>"

" MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

""" ctrlp setting https://github.com/ctrlpvim/ctrlp.vim
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" If none of the default markers (.git .hg .svn .bzr _darcs) are present in a project, you can define additional ones with g:ctrlp_root_markers:
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore. If a custom listing command is being used, exclusions are ignored
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" YouCompleteMe config 参考了知乎韦易笑
"作者：韦易笑
"链接：https://zhuanlan.zhihu.com/p/33046090
"来源：知乎
"著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

" 屏蔽ycm自动弹出的函数原型预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 屏蔽ycm的诊断信息
"jlet g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
" 基于符号的补全，  输入两个字符后就提示补全
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
" 使用ctrl-z 显示语义的补全提示
let g:ycm_key_invoke_completion = '<c-z>'

noremap <c-z> <NOP>
"  输入两个字符就开始语义的自动补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

""" vundle  
""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" my plugin
" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
" nerdtree
Plugin 'scrooloose/nerdtree'
" Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" vim-easymotion  move plugin
Plugin 'easymotion/vim-easymotion'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub


"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'fatih/vim-go'

Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


