
"
" if !exists('g:bundle_group')
"     " let g:bundle_group = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
"     " let g:bundle_group = ['basic', 'filetypes', 'textobj']
"     " let g:bundle_group += ['airline', 'nerdtree', 'ale', 'echodoc']
"     " let g:bundle_group += ['leaderf']
"     " let g:bundle_group += ['grammer']
"     " let g:bundle_group += ['language']
"     let g:bundle_group += ['basic']
" endif


" vim-plug https://github.com/junegunn/vim-plug
"----------------------------------------------------------------------
" 在 ~/.vim/plugged 下安装插件
"----------------------------------------------------------------------
" Plugins here
call plug#begin('~/.config/nvim/plugged')


Plug 'easymotion/vim-easymotion'

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
" if index(g:bundle_group, 'basic') >= 0
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

" " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
" Plug 'skywind3000/vim-preview'

" Git 支持
Plug 'tpope/vim-fugitive'

" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
Plug 'mh21/errormarker.vim'

" 默认不显示 startify
" let g:startify_disable_at_vimenter = 1
if has('nvim')
	let g:startify_session_dir = '~/.vim/session'
else
	let g:startify_session_dir = '~/.config/nvim/session'
endif

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

" endif


"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------

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


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
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

"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xuyuanp/nerdtree-git-plugin'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0
noremap <Leader>nf :NERDTreeFocus<cr>
noremap <Leader>nm :NERDTreeMirror<cr>
noremap <Leader>nt :NERDTreeToggle<cr>

"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
" 如果 vim 支持 python 则启用  Leaderf
if has('python') || has('python3')
	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension:w' }

	" " CTRL+p 打开文件模糊匹配
	" let g:Lf_ShortcutF = '<c-p>'
	"
	" " " ALT+n 打开 buffer 模糊匹配
	" " let g:Lf_ShortcutB = '<m-n>'
	"
	" " " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
	" " noremap <c-n> :LeaderfMru<cr>
	" "
	" " " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
	" " noremap <m-p> :LeaderfFunction!<cr>
	" "
	" " " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
	" " noremap <m-P> :LeaderfBufTag!<cr>
	" "
	" " " ALT+n 打开 buffer 列表进行模糊匹配
	" " noremap <m-n> :LeaderfBuffer<cr>
	" "
	" " " 全局 tags 模糊匹配
	" " noremap <m-m> :LeaderfTag<cr>
	"
	" " 最大历史文件保存 2048 个
	" let g:Lf_MruMaxFiles = 2048
	"
	" " ui 定制
	" let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
	"
	" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
	let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
	let g:Lf_WorkingDirectoryMode = ''
	let g:Lf_WindowHeight = 0.30
	let g:Lf_CacheDirectory = expand('~/.vim/cache')
	"
	" " 显示绝对路径
	" let g:Lf_ShowRelativePath = 0
	"
	" " 隐藏帮助
	" let g:Lf_HideHelp = 1
	"
	" " 模糊匹配忽略扩展名
	" let g:Lf_WildIgnore = {
	"             \ 'dir': ['.svn','.git','.hg'],
	"             \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]', '*.meta', '*.*.meta', '*.unity', '*.unityproj', '*.mat', '*.fbx', '*.FBX', '*.tga', '*.cubemap', '*.prefab', '*.png', '*.jpg','*.gif']
	"             \ }
	"
	" " MRU 文件忽略扩展名
	" let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll', '*.meta']
	" let g:Lf_StlColorscheme = 'powerline'
	"
	" " 禁用 function/buftag 的预览功能，可以手动用 p 预览
	" let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
	"
	" map <Leader>ff :LeaderfFunction<CR>
	" map <Leader>ffa :LeaderfFunctionAll<CR>
	" map <Leader>fb :LeaderfBuffer<CR>
	" map <Leader>fm :LeaderfMru<CR>
	" map <Leader>ft :LeaderfTag<CR>
	" map <Leader>fl :LeaderfLine<CR>
	" map <Leader>fc :LeaderfHistoryCmd<CR>
	" map <Leader>fp :LeaderfFile<CR>
	"
	" map <Leader>s :Leaderf rg -e
	" map <Leader>sr :LeaderfRgRecall<CR>
	" " search word under cursor, the pattern is treated as regex, and enter normal mode directly
	" noremap <Leader>sw :<C-U><C-R>=printf("Leaderf rg -e %s .", expand("<cword>"))<CR><CR>


	" don't show the help in normal mode
	let g:Lf_HideHelp = 1
	let g:Lf_UseCache = 0
	let g:Lf_UseVersionControlTool = 0
	let g:Lf_IgnoreCurrentBufferName = 1
	" popup mode
	let g:Lf_WindowPosition = 'popup'
	let g:Lf_PreviewInPopup = 1
	let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
	let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

	let g:Lf_ShortcutF = "<leader>ff"
	noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
	noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
	noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
	noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

	" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
	noremap <leader>fs :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
	" search visually selected text literally
	xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
	noremap go :<C-U>Leaderf! rg --recall<CR>

	" should use `Leaderf gtags --update` first
	let g:Lf_GtagsAutoGenerate = 0
	let g:Lf_Gtagslabel = 'native-pygments'
	noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
	noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
	noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
	noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
	noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
endif

Plug 'scrooloose/nerdcommenter'

" Yet simple tool to paste images into markdown files
Plug 'ferrine/md-img-paste.vim'

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'

" kotlin plugin
Plug 'udalov/kotlin-vim'

" markdown plugin
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" 指定浏览器路径
let g:mkdp_path_to_chrome = "/Applications/Safari.app/Contents/MacOS/Safari"
" 指定预览主题，默认Github
let g:mkdp_markdown_css=''

" snippets
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call plug#end()



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

colorscheme LightYellow
