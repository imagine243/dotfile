"""""""""""""""""""""""""""""""
""" vundle
"""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/molokai'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mileszs/ack.vim'

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

"""""""""""""""""""""""""""""
"    plugin setting			"					
"""""""""""""""""""""""""""""

" Plugin 'ctrlpvim/ctrlp.vim'
""" ctrlp setting https://github.com/ctrlpvim/ctrlp.vim
if executable('ag')													" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'			" Use ag in CtrlP for listing files. Lightning fast, respects .gitignore and .agignore. Ignores hidden files by default.
else																"ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif
let g:ctrlp_working_path_mode = ''									" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']					" If none of the default markers (.git .hg .svn .bzr _darcs) are present in a project, you can define additional ones with g:ctrlp_root_markers:
" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore. If a custom listing command is being used, exclusions are ignored
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" nerdtree
" Plugin 'scrooloose/nerdtree'
map <F9> :NERDTreeToggle<CR>


" Valloric/YouCompleteMe
" Plugin 'Valloric/YouCompleteMe'
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

" Plugin 'fatih/vim-go'
" au FileType go nmap <leader>d <Plug>(go-def)
" au FileType go nmap <leader>ds <Plug>(go-def-split)
" au FileType go nmap <leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <leader>dt <Plug>(go-def-tab)
" au FileType go nmap <leader>re <Plug>(go-referrers)
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_sameids = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>vv <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>vs <Plug>(go-def-split)
  " :GoReferrers
  autocmd FileType go nmap <Leader>re <Plug>(go-referrers)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" NERD Commenter Comment functions so powerful—no comment necessary.
" Plugin 'scrooloose/nerdcommenter'
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
" Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" ack.vim
" Run your favorite search tool from Vim, with an enhanced results list.
" Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>
vnoremap <Leader>a y:Ack!<Space> <C-r>=fnameescape(@")<CR><CR>

""""""""""""""""""""""
"      mapping        "
"""""""""""""""""""""""
" 一行过长 会自动换行 , j k 会移动到 自动换行出来的第二行
noremap <Up> gk
noremap <Down> gj
nnoremap j gj
nnoremap k gk
" esc jk
inoremap jk <esc>
" leader key space
let mapleader="\<space>"

nnoremap <leader>q :q<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" Search for visually selected text use key //
vnoremap // y/<C-R>"<CR>
" Act like D and C
nnoremap Y y$
" Enter automatically into the files directory
" autocmd BufEnter * silent! lcd %:p:h


""""""""""""""""""""""
"      Setting        "
"""""""""""""""""""""""
" color
syntax enable				" syntax enable
set t_Co=256
" color slate					" colorscheme
let g:rehash256 = 1
" let g:molokai_original = 1
colorscheme molokai

" tab & space
set tabstop=4				" number of visual spaces per TAB
set softtabstop=4			" 点击tab 输入的 space数量 点击删除 删除的space数量
set autoindent				" 自动换行
" set expandtab				" 使用space 替代 tab 禁用 会影响space当作leader key

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

" 去掉Scrollbar
set guioptions-=r
set guioptions-=L

" foldlevel
set foldlevel=99

" search
" search as characters are entered
set incsearch
" highlight matchs
set hlsearch

"movement 

" no swap file
set noswapfile

" MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 


