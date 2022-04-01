-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

local map_cu = function(mode, keymap, cmd, opt)
    local real_cmd = (":<C-u>%s<CR>"):format(cmd)
    map(mode, keymap, real_cmd, opt)
end



map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- // 搜索选中的文本
map("v", "//", "y/<C-R>\"<CR>", opt)

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map("n", "n", "nzzzv", opt)
map("n", "N", "Nzzzv", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close o

-- 比例控制
map("n", "s.", ":vertical resize +20<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)


-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("i", "<A-h>", "<C-\\><C-N><C-w>h", opt)
map("i", "<A-j>", "<C-\\><C-N><C-w>j", opt)
map("i", "<A-k>", "<C-\\><C-N><C-w>k", opt)
map("i", "<A-l>", "<C-\\><C-N><C-w>l", opt)

map("t", "<A-h>", "<C-\\><C-N><C-w>h", opt)
map("t", "<A-j>", "<C-\\><C-N><C-w>j", opt)
map("t", "<A-k>", "<C-\\><C-N><C-w>k", opt)
map("t", "<A-l>", "<C-\\><C-N><C-w>l", opt)

-- 退出当前
map_cu("n", "<leader>q", "quit!", opt)
map_cu("n", "<leader>w", ":w <CR>", opt)

-- 临时使用插件的快捷键
-- nvimtree
map_cu("n", "<leader>fe", "NvimTreeToggle", opt)

-- telescope 
map_cu("n", "<leader>ff", "Telescope find_files", opt)
map_cu("n", "<leader>ss", "Telescope grep_string", opt)
map_cu("n", "<leader>s", "Telescope live_grep", opt)
map_cu("n", "<leader>sj", "Telescope jumplist", opt)
map_cu("n", "<leader>sb", "Telescope buffers", opt)
map_cu("n", "<leader>sk", "Telescope keymaps", opt)

