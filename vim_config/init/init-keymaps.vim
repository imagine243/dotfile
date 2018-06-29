"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
"   ctrl + * 原生命令  插件默认设置等
"   alt  + * 快速移动  窗口切换 标签切换
"   <leader> + * 自定义命令
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <m-a> <home>
inoremap <m-e> <end>
inoremap <m-d> <del>
" inoremap <m-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <m-h> <left>
noremap <m-j> <down>
noremap <m-k> <up>
noremap <m-l> <right>
inoremap <m-h> <left>
inoremap <m-j> <down>
inoremap <m-k> <up>
inoremap <m-l> <right>

"----------------------------------------------------------------------
" 命令模式的快速移动
" alt key 在命令模式下不支持
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>

"----------------------------------------------------------------------
" ALT+N 切换 tab
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>


" MacVim 允许 CMD+数字键快速切换标签
if has("gui_macvim")
	set macmeta
	noremap <silent><d-1> :tabn 1<cr>
	noremap <silent><d-2> :tabn 2<cr>
	noremap <silent><d-3> :tabn 3<cr>
	noremap <silent><d-4> :tabn 4<cr>
	noremap <silent><d-5> :tabn 5<cr>
	noremap <silent><d-6> :tabn 6<cr>
	noremap <silent><d-7> :tabn 7<cr>
	noremap <silent><d-8> :tabn 8<cr>
	noremap <silent><d-9> :tabn 9<cr>
	noremap <silent><d-0> :tabn 10<cr>
	inoremap <silent><d-1> <ESC>:tabn 1<cr>
	inoremap <silent><d-2> <ESC>:tabn 2<cr>
	inoremap <silent><d-3> <ESC>:tabn 3<cr>
	inoremap <silent><d-4> <ESC>:tabn 4<cr>
	inoremap <silent><d-5> <ESC>:tabn 5<cr>
	inoremap <silent><d-6> <ESC>:tabn 6<cr>
	inoremap <silent><d-7> <ESC>:tabn 7<cr>
	inoremap <silent><d-8> <ESC>:tabn 8<cr>
	inoremap <silent><d-9> <ESC>:tabn 9<cr>
	inoremap <silent><d-0> <ESC>:tabn 10<cr>
endif

"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2
	" vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
	" 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
	" 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
	set termwinkey=<c-_>
	tnoremap <m-H> <c-_>h
	tnoremap <m-L> <c-_>l
	tnoremap <m-J> <c-_>j
	tnoremap <m-K> <c-_>k
	tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
	" neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
	tnoremap <m-H> <c-\><c-n><c-w>h
	tnoremap <m-L> <c-\><c-n><c-w>l
	tnoremap <m-J> <c-\><c-n><c-w>j
	tnoremap <m-K> <c-\><c-n><c-w>k
	tnoremap <m-q> <c-\><c-n>
endif


" 一行过长 会自动换行 , j k 会移动到 自动换行出来的第二行
noremap <Up> gk
noremap <Down> gj
nnoremap j gj
nnoremap k gk




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

