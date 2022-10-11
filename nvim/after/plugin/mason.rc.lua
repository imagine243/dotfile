local status, mason = pcall(require, "mason")
if not status then
	return
end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")

mason.setup({})

mason_lspconfig.setup({
	ensure_installed = { "sumneko_lua" },
})
