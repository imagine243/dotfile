
if !exists('g:bundle_group')
	let g:bundle_group = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
	let g:bundle_group += ['tags', 'airline', 'nerdtree', 'ale', 'echodoc']
	let g:bundle_group += ['leaderf']
endif

" vim-plug https://github.com/junegunn/vim-plug
"----------------------------------------------------------------------
" 在 ~/.vim/plugged 下安装插件
"----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------
Plug 'easymotion/vim-easymotion'

" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0
	" 展示开始画面，显示最近编辑过的文件
	Plug 'mhinz/vim-startify'

	" molokai color scheme
	Plug 'fatih/molokai'

	" 一次性安装一大堆 colorscheme
	Plug 'flazz/vim-colorschemes'
	
	" 支持库，给其他插件用的函数库
	Plug 'xolox/vim-misc'

	" 用于在侧边符号栏显示 git/svn 的 diff
	Plug 'mhinz/vim-signify'
	
	" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
	Plug 'kshenoy/vim-signature'

	" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
	Plug 'skywind3000/vim-preview'

	" Git 支持
	Plug 'tpope/vim-fugitive'

	" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
	" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
	Plug 'mh21/errormarker.vim'	

	" 默认不显示 startify
	" let g:startify_disable_at_vimenter = 1
	let g:startify_session_dir = '~/.vim/session'

	" 使用 <space>ha 清除 errormarker 标注的错误
	noremap <silent><space>ha :RemoveErrorMarkers<cr>

	" signify 调优
	let g:signify_vcs_list = ['git', 'svn']
	let g:signify_sign_add               = '+'
	let g:signify_sign_delete            = '_'
	let g:signify_sign_delete_first_line = '‾'
	let g:signify_sign_change            = '~'
	let g:signify_sign_changedelete      = g:signify_sign_change

	" git 仓库使用 histogram 算法进行 diff
	let g:signify_vcs_cmds = {
			\ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
			\}
endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

	" " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
	" Plug 'terryma/vim-expand-region'

	" 快速文件搜索
	Plug 'junegunn/fzf'

	" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
	Plug 'asins/vim-dict'

	" 使用 :FlyGrep 命令进行实时 grep
	Plug 'wsdjeg/FlyGrep.vim'

	" 使用 :CtrlSF 命令进行模仿 sublime 的 grep
	Plug 'dyng/ctrlsf.vim'

	" 配对括号和引号自动补全
	Plug 'Raimondi/delimitMate'

	" 提供 gist 接口
	Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
	
	" " ALT_+/- 用于按分隔符扩大缩小 v 选区
	" map <m-=> <Plug>(expand_region_expand)
	" map <m--> <Plug>(expand_region_shrink)
endif
	
"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

	" 提供 ctags/gtags 后台数据库自动更新功能
	Plug 'ludovicchabant/vim-gutentags'

	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
	Plug 'skywind3000/gutentags_plus'

	" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
	" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
	let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
	let g:gutentags_ctags_tagfile = '.tags'

	" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
	let s:vim_tags = expand('~/.cache/tags')
	let g:gutentags_cache_dir = s:vim_tags

	" 默认禁用自动生成
	let g:gutentags_modules = [] 

	" 如果有 ctags 可执行就允许动态生成 ctags 文件
	if executable('ctags')
		let g:gutentags_modules += ['ctags']
	endif

	" 如果有 gtags 可执行就允许动态生成 gtags 数据库
	if executable('gtags') && executable('gtags-cscope')
		let g:gutentags_modules += ['gtags_cscope']
	endif

	" 设置 ctags 的参数
	let g:gutentags_ctags_extra_args = []
	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

	" 使用 universal-ctags 的话需要下面这行，请反注释
	" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

	" 禁止 gutentags 自动链接 gtags 数据库
	let g:gutentags_auto_add_gtags_cscope = 0
	
	" 如果使用 universal ctags 需要增加下面一行
	let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

	" 检测 ~/.cache/tags 不存在就新建
	if !isdirectory(s:vim_tags)
		silent! call mkdir(s:vim_tags, 'p')
	endif

endif

"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj')
	
	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'

	" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
	Plug 'kana/vim-textobj-indent'

	" 语法文本对象：iy/ay 基于语法的文本对象
	Plug 'kana/vim-textobj-syntax'

	" 函数文本对象：if/af 支持 c/c++/vim/java
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'sgur/vim-textobj-parameter'

	" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
	Plug 'bps/vim-textobj-python', {'for': 'python'}

	" 提供 uri/url 的文本对象，iu/au 表示
	Plug 'jceb/vim-textobj-uri'
endif

"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

	" powershell 脚本文件的语法高亮
	Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

	" lua 语法高亮增强
	Plug 'tbastos/vim-lua', { 'for': 'lua' }

	" C++ 语法高亮增强，支持 11/14/17 标准
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

	" 额外语法文件
	Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

	" python 语法文件增强
	Plug 'vim-python/python-syntax', { 'for': ['python'] }

	" rust 语法增强
	Plug 'rust-lang/rust.vim', { 'for': 'rust' }

	" vim org-mode 
	Plug 'jceb/vim-orgmode', { 'for': 'org' }
endif

"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_powerline_fonts = 0
	let g:airline_exclude_preview = 1
	let g:airline_section_b = '%n'
	let g:airline_theme='deus'
	let g:airline#extensions#branch#enabled = 0
	let g:airline#extensions#syntastic#enabled = 0
	let g:airline#extensions#fugitiveline#enabled = 0
	let g:airline#extensions#csv#enabled = 0
	let g:airline#extensions#vimagit#enabled = 0
endif


Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe' , {'do':'./install.py --all'}
Plug 'fatih/vim-go' , {'do':':GoInstallBinaries'}
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mileszs/ack.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/LeaderF' , { 'do': './install.sh' }
Plug 'w0rp/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/echodoc.vim'

call plug#end()

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

" FlyGrep
nnoremap <Space>fw :FlyGrep<cr>
" g:FlyGrep_search_tools = ['rg']

colorscheme molokai
