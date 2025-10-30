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
		local merge = require("xac.utils.functions").merge

    local function lsp_keymaps_setup(bufnr)
      local opts = { noremap = true, silent = true }

      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>io", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>i[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>i]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>it", "<cmd>Telescope diagnostics<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>id", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

      vim.cmd([[ command! Fmt execute 'lua vim.lsp.buf.format()' ]])
    end

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
