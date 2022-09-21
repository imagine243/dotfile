local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"sainnhe/edge",
		opt = false,
		config = function()
			vim.cmd([[set background=dark]])
			vim.g.edge_style = "aura"
			vim.g.edge_enable_italic = 1
			vim.g.edge_disable_italic_comment = 1
			vim.g.edge_show_eob = 1
			vim.g.edge_better_performance = 1
		end,
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				respect_buf_cwd = true,
				update_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
			})
		end,
	})

	use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
	-- nvim-cmp
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/nvim-cmp")

	-- For luasnip users.
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("ray-x/lsp_signature.nvim")

	-- lspkind
	use("onsails/lspkind-nvim")
	-- use 'github/copilot.vim'

	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- comment
	use("terrortylor/nvim-comment")

	use("windwp/nvim-autopairs")

	use({ "nvim-treesitter/nvim-treesitter" })

	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use("MunifTanjim/prettier.nvim")
	use("ahmedkhalf/project.nvim")
	use({
		"Mofiqul/trld.nvim",
		config = function()
			require("trld").setup()
		end,
	})

	use("github/copilot.vim") -- github copilot
end)
