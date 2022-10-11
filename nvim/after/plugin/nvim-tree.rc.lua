local status, nvimtree = pcall(require, "nvim-tree")
if not status then
	return
end

nvimtree.setup({
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})
