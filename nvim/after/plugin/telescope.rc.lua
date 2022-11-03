local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local buildin = require("telescope.builtin")

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

local project = require("project_nvim")
project.setup({
	---@usage set to true to disable setting the current-woriking directory
	--- Manual mode doesn't automatically change your root directory, so you have
	--- the option to manually do so using `:ProjectRoot` command.
	manual_mode = true,

	---@usage Methods of detecting the root directory
	--- Allowed values: **"lsp"** uses the native neovim lsp
	--- **"pattern"** uses vim-rooter like glob pattern matching. Here
	--- order matters: if one is not detected, the other is used as fallback. You
	--- can also delete or rearangne the detection methods.
	-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	detection_methods = { "lsp", "pattern" },

	---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

	---@ Show hidden files in telescope when searching for files in a project
	show_hidden = false,

	---@usage When set to false, you will get a message when project.nvim changes your directory.
	-- When set to false, you will get a message when project.nvim changes your directory.
	silent_chdir = false,

	---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
	ignore_lsp = {},

	---@type string
	---@usage path to store the project history for use in telescope
	datapath = vim.fn.stdpath("data"),
})

telescope.load_extension("projects")

--- theme
local telescope_themes = require("telescope.themes")
local dropdown = telescope_themes.get_dropdown({
	winblend = 20,
	-- previewer = false,
	layout_config = {
		width = function(_, max_columns, _)
			return math.min(max_columns, 120)
		end,

		height = function(_, _, max_lines)
			return math.min(max_lines, 40)
		end,
	},
})

local dropdown_nopreview = vim.tbl_deep_extend("force", dropdown, { previewer = false })

local ivy_theme = telescope_themes.get_ivy({
	winblend = 20,
})

local ivy_nopreview = vim.tbl_deep_extend("force", ivy_theme, { previewer = false })

local cursor_theme = telescope_themes.get_cursor({
	winblend = 20,
	layout_config = {
		width = 100,
		height = 15,
	},
})

local cursor_nopreview = vim.tbl_deep_extend("force", cursor_theme, { previewer = false })

local function setNormalKeymap(key, func, theme)
	vim.keymap.set("n", key, function()
		func(theme)
	end)
end

setNormalKeymap(";;", buildin.resume)
setNormalKeymap("<leader>ff", buildin.find_files, dropdown_nopreview)
setNormalKeymap("<leader>fp", telescope.extensions.projects.projects, ivy_nopreview)
setNormalKeymap("<leader>fl", buildin.current_buffer_fuzzy_find, ivy_nopreview)
setNormalKeymap("<leader>fb", buildin.buffers, dropdown_nopreview)

setNormalKeymap("<leader>s", buildin.live_grep, ivy_theme)
setNormalKeymap("<leader>ss", buildin.grep_string, ivy_theme)
setNormalKeymap("<leader>sj", buildin.jumplist, ivy_theme)
setNormalKeymap("<leader>sk", buildin.keymaps, ivy_theme)
setNormalKeymap("<leader>sb", telescope.extensions.file_browser.file_browser, ivy_nopreview)

-- telescope and lsp
setNormalKeymap("gr", buildin.lsp_references, cursor_theme)
setNormalKeymap("<leader>fs", buildin.lsp_document_symbols, ivy_theme)
