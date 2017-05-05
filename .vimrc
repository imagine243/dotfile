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
" 使用space 替代 tab
set expandtab
 
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

" esc jk
inoremap jk <esc>


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
Plugin 'kien/ctrlp.vim'
" nerdtree
Plugin 'scrooloose/nerdtree'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
