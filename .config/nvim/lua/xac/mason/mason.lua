local servers = {
	"sumneko_lua",
	"pyright",
	"jsonls",
    'tsserver',
    'eslint',
    'html',
    'cssls'
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	automatic_installation = true,
    ensure_installed = servers
})


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

require('mason-lspconfig').setup_handlers({
  function(server)
	opts = {
		on_attach = require("xac.mason.handlers").on_attach,
		capabilities = require("xac.mason.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "xac.mason.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
  end,
})
