local ok_mason, mason = pcall(require, "mason")
local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
local ok_mason_tools, mason_tool_installer = pcall(require, "mason-tool-installer")

if not ok_mason then
	print("could not init mason. maybe it is not installed")
	return
end

if not ok_mason_lsp then
	print("could not init mason-lspconfig. maybe it is not installed")
	return
end

if not ok_mason_tools then
  print("could not init mason-tool-installer. maybe it is not installed")
  return
end

mason.setup()

mason_lsp.setup({
	ensure_installed = require("xac.ide.lsp_servers").lsp_servers,
})

mason_tool_installer.setup({
	ensure_installed = {
		-- formatters
		"stylua", -- lua
		"black", -- python
		"shfmt", -- sh
		"prettier", -- html, css, js, ts, json
		"php-cs-fixer", -- php

		-- linters
		"eslint", -- js, ts
    "flake8", -- python
    "luacheck", -- lua
	},
})
