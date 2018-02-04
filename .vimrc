" color
" colorscheme 
color slate
" syntax enable
syntax enable

" tab & space
" number of visual spaces per TAB
set tabstop=4
" 点击tab 输入的 space数量 点击删除 删除的space数量
set softtabstop=4
" 自动换行
set autoindent
" 使用space 替代 tab 禁用 会影响space当作leader key
" set expandtab

" encoding
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
" set showmatch

" foldlevel
set foldlevel=99

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

" switch buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

" Search for visually selected text use key //
vnoremap // y/<C-R>"<CR>


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
let g:ctrlp_working_path_mode = ''

" If none of the default markers (.git .hg .svn .bzr _darcs) are present in a project, you can define additional ones with g:ctrlp_root_markers:
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore. If a custom listing command is being used, exclusions are ignored
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" nerdtree
Plugin 'scrooloose/nerdtree'
map <F9> :NERDTreeToggle<CR>

" Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
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

Plugin 'fatih/vim-go'

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>i <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tf <Plug>(go-test)
au FileType go nmap <leader>im <Plug>(go-imports)
au FileType go nmap <leader>l <Plug>(go-lint)
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>re <Plug>(go-referrers)


" NERD Commenter Comment functions so powerful—no comment necessary.
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Tagbar: a class outline viewer for Vim
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
Plugin 'majutsushi/tagbar'

nmap <F8> :TagbarToggle<CR>

" Auto Pairs
" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

" vim-airline Build Status
" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'

" vim-gitgutter
" A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows whether each line has been added, modified, and where lines have been removed. You can also stage and undo individual hunks.
Plugin 'airblade/vim-gitgutter'

" Vim Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" ack.vim
" Run your favorite search tool from Vim, with an enhanced results list.
Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>
vnoremap <Leader>a y:Ack!<Space> <C-r>=fnameescape(@")<CR><CR>

" vim-startify This
" plugin provides a start screen for Vim and Neovim.
Plugin 'mhinz/vim-startify'

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


