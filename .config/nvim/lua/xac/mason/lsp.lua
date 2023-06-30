local vim = vim or {}

-- lsp configs
local ok_lsp, lspconfig = pcall(require, "lspconfig")

if not ok_lsp then
	print("lsp plugin is not initialized. maybe it is not installed")
	return
end

-- getting the autocompletion binder to lsp
local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

if not ok_cmp_lsp then
	print("could not init cmp nvim lsp. maybe it is not installed")
	return
end

local capabilities = cmp_lsp.default_capabilities()

-- list all of the servers that we want
local servers = {
	"lua_ls",
	"tsserver",
	"cssls",
	"html",
	"emmet_ls",
	"intelephense",
}

for _, server in ipairs(servers) do
	if server == "intelephense" then
		lspconfig.intelephense.setup({
			root_dir = function(pattern)
				local cwd = vim.loop.cwd()
				local root = lspconfig.util.root_pattern("composer.json", ".git", ".")(pattern)
				-- prefer cwd if root is a descendant
				return lspconfig.util.path.is_descendant(cwd, root) and cwd or root
			end,
			capabilities = capabilities,
		})
	else
		lspconfig[server].setup({
			capabilities = capabilities,
		})
	end
end

-- Hide inline LSP diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false, -- Disable virtual text (inline messages)
	signs = true, -- Disable signs
	underline = true, -- Disable underline
})

-- set lsp keybindings
local key_binding_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", key_binding_opts)

-- diagnostics keybindings
vim.api.nvim_set_keymap("n", "<leader>io", "<cmd>lua vim.diagnostic.open_float()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "<leader>i[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "<leader>i]", "<cmd>lua vim.diagnostic.goto_next()<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "<leader>it", "<cmd>Telescope diagnostics<CR>", key_binding_opts)

vim.api.nvim_set_keymap("n", "<leader>id", "<cmd>lua vim.diagnostic.setloclist()<CR>", key_binding_opts)
