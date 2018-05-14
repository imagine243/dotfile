
" vim-plug https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'fatih/molokai'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe' , {'do':'./install.py --all'}
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go' , {'do':':GoInstallBinaries'}
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mileszs/ack.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/LeaderF' , { 'do': './install.sh' }
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/echodoc.vim'
Plug 'skywind3000/vim-preview'

call plug#end()


set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on	  " enable filetype detection
""""""""""""""""""""""
"      Setting        "
"""""""""""""""""""""""
" color
syntax enable					" syntax enable
set t_Co=256
" color slate					" colorscheme
let g:rehash256 = 1
" let g:molokai_original = 1
colorscheme molokai

set ttyfast                     " Indicate fast terminal conn for faster redraw
if !has('nvim')
    set ttymouse=xterm2             " Indicate terminal type for mouse codes
    set ttyscroll=3                 " Speedup scrolling
endif
set laststatus=2                " Show status line always
set encoding=utf-8				" set default encoding to UTF-8
set autoread                    " Automatically read changed files
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw

" tab & space
set tabstop=4					" number of visual spaces per TAB
set softtabstop=4				" 点击tab 输入的 space数量 点击删除 删除的space数量
set autoindent					" 自动换行
" set expandtab					" 使用space 替代 tab 禁用 会影响space当作leader key


" visual autocomplete for command menu
set wildmenu

set guioptions-=m				"remove menu bar
set guioptions-=T				"remove toolbar
set guioptions-=r				"remove right-hand scroll bar
set guioptions-=L				"remove left-hand scroll bar

" foldlevel
set foldlevel=99

" MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

set tags=./.tags;,.tags
""""""""""""""""""""""
"      mapping        "
"""""""""""""""""""""""
" leader key space
let mapleader="\<space>"
" 一行过长 会自动换行 , j k 会移动到 自动换行出来的第二行
noremap <Up> gk
noremap <Down> gj
nnoremap j gj
nnoremap k gk
" esc jk
inoremap jk <esc>

inoremap <C-p> <up>
inoremap <C-n> <down>
inoremap <C-b> <left>
inoremap <C-f> <right>

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

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
nnoremap <leader>n :cnext<CR>
nnoremap <leader>m :cprevious<CR>
nnoremap <leader>c :cclose<CR>

"""""""""""""""""""""""""""""
"    plugin setting			"					
"""""""""""""""""""""""""""""

" " Plugin 'ctrlpvim/ctrlp.vim'
" """ ctrlp setting https://github.com/ctrlpvim/ctrlp.vim
" if executable('ag')													" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'			" Use ag in CtrlP for listing files. Lightning fast, respects .gitignore and .agignore. Ignores hidden files by default.
" else																"ctrl+p ignore files in .gitignore
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" endif
" let g:ctrlp_working_path_mode = ''									" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
" let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']					" If none of the default markers (.git .hg .svn .bzr _darcs) are present in a project, you can define additional ones with g:ctrlp_root_markers:
" " Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore. If a custom listing command is being used, exclusions are ignored
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" nerdtree
" Plugin 'scrooloose/nerdtree'
" map <F9> :NERDTreeToggle<CR>
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFocus<CR>

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
let g:go_fmt_command = "goimports"
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
  autocmd FileType go nmap <Leader>tc <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoImplements
  autocmd FileType go nmap <Leader>im <Plug>(go-implements)
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

" ack.vim
" Run your favorite search tool from Vim, with an enhanced results list.
" Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
vnoremap <Leader>a y:Ack!<Space> <C-r>=fnameescape(@")<CR><CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go','gofmt','govet']

"ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"

"leaderf
map <Leader>ff :LeaderfFunction<CR>
map <Leader>ffa :LeaderfFunctionAll<CR>
map <Leader>fb :LeaderfBuffer<CR>
map <Leader>fm :LeaderfMru<CR>
map <Leader>ft :LeaderfTag<CR>
map <Leader>fl :LeaderfLine<CR>
map <Leader>fc :LeaderfHistoryCmd<CR>
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0

" vim-gutentags
" 作者：韦易笑
" 链接：https://www.zhihu.com/question/47691414/answer/37370071
" 来源：知乎
" 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" w0rp/ale
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" Enable all of the linters you want for Go.
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}

" vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


" gtags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
