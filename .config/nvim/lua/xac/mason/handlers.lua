local M = {}

local vim = vim or {}

M.setup = function()
  local config = {
    -- enable/disable virtual text
    virtual_text = false,
    -- show signs
    signs = true,
    underline = true,
  }

  vim.diagnostic.config(config)
end


local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

-- diagnostics keybindings
vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>io", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>i[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>i]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>it", "<cmd>Telescope diagnostics<CR>", opts)

vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>id", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

  vim.cmd [[ command! Fmt execute 'lua vim.lsp.buf.format()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
end

return M
