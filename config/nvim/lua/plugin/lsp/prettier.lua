local prettier = require("prettier")

prettier.setup({
	["null-ls"] = {
		runtime_condition = function(params)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	},
	bin = "prettier",
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	end_of_line = "lf",
	tab_width = 4,
	print_width = 120,
	use_tabs = true,
	single_quote = false,
	trailing_comma = "none",
	arrow_parens = "avoid",
})
