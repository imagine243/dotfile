require 'plugin.pack'
require 'plugin.lsp.setup'
require 'plugin.lsp.nvim_cmp'
require 'plugin.nvim_comment'
require 'plugin.nvim_autopairs'
require 'plugin.lua_snip'
require 'plugin.telescope'

local load_plugin = function()
    vim.cmd [[colorscheme edge]]
end

load_plugin()
