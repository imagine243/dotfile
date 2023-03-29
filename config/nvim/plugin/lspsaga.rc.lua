local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	server_filetype_map = {
		typescript = "typescript",
	},
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("n", "gn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "gp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "gc", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
keymap("n", "gh", "<Cmd>Lspsaga hover_doc<CR>", opts)
-- keymap("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
-- keymap("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
