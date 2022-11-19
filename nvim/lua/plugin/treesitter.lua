local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"lua",
		"typescript",
		"javascript",
		"css",
		"html",
		"yaml",
		"json",
		"go",
		"gomod",
		"gowork",
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
	},
	indent = { enable = true, disable = { "yaml" } },
	-- context_commentstring = {
	-- 	enable = true,
	-- 	enable_autocmd = false,
	-- },
})
