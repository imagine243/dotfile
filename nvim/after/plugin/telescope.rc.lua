local status, telescope = pcall(require, "telescope")
if not status then
	return
end
print("telescope load")

local actions = require("telescope.actions")
local buildin = require("telescope.builtin")

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
		},
	},
})

telescope.load_extension("file_browser")
