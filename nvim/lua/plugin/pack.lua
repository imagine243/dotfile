vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {'sainnhe/edge', opt = false, config = function()
        vim.cmd [[set background=dark]]
        vim.g.edge_style = "aura"
        vim.g.edge_enable_italic = 1
        vim.g.edge_disable_italic_comment = 1
        vim.g.edge_show_eob = 1
        vim.g.edge_better_performance = 1
    end}

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }

    use {'neovim/nvim-lspconfig','williamboman/nvim-lsp-installer'}
    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/nvim-cmp'

    -- For luasnip users.
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- lspkind
    use 'onsails/lspkind-nvim'
    -- use 'github/copilot.vim'

    -- comment  
    use "terrortylor/nvim-comment"

    use 'windwp/nvim-autopairs'

    use {'nvim-treesitter/nvim-treesitter'}

    use {'jose-elias-alvarez/null-ls.nvim'}
end)
