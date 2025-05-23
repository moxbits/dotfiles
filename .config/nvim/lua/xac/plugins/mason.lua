return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- formatters
				"stylua", -- lua
				"black", -- python
				"shfmt", -- sh
				"prettier", -- html, css, js, ts, json
				"php-cs-fixer", -- php

				-- linters
				"eslint_d", -- js, ts
				"flake8", -- python
			},
		})

		local lsp_servers = {
			"lua_ls",
			"jedi_language_server",
			"ts_ls",
			"bashls",
			"html",
			"cssls",
			"jsonls",
			"yamlls",
			"emmet_ls",
			"intelephense",
		}

		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers,
		})

		local lspconfig = require("lspconfig")
		local lsp_keymaps_setup = require("xac.keymaps.lsp").lsp_keymaps_setup
		local merge = require("xac.utils.functions").merge

		local function on_attach(client, bufnr)
			if client.name == "tsserver" then
				client.server_capabilities.document_formatting = false
			end

			lsp_keymaps_setup(bufnr)
		end

		vim.diagnostic.config({
			virtual_text = false, -- enable/disable virtual text
			signs = true, -- show signs
			underline = true,
		})

		for _, server in ipairs(lsp_servers) do
			local opts = { on_attach = on_attach }

			if server == "emmet_ls" then
				local default_filetypes = lspconfig.emmet_ls.document_config.default_config.filetypes
				opts = merge(opts, { filetypes = merge(default_filetypes, { "php" }) })
			elseif server == "intelephense" then
				opts = merge(opts, { single_file_support = true })
			end

			lspconfig[server].setup(opts)
		end
	end,
}
