local is_lsp_ok, lspconfig = pcall(require, "lspconfig")

if not is_lsp_ok then
	print("lsp plugin is not initialized. maybe it is not installed")
	return
end

local handlers = require("xac.ide.handlers")
handlers.setup()

local servers = require("xac.ide.lsp_servers").lsp_servers

local opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
}

for _, server in ipairs(servers) do
	lspconfig[server].setup(opts)
end

-- with settings

local customized_servers = {
	"intelephense",
}

for _, server in ipairs(customized_servers) do
	local custom_opts = require("xac.ide.settings." .. server).setup(opts)
	lspconfig[server].setup(custom_opts)
end
