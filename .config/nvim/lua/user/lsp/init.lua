local lsp_ins_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not lsp_ins_ok then
  return
end

lsp_installer.setup {
  automatic_installation = true
}


local lsp_ok, lspconfig = pcall(require, "lspconfig")

if not lsp_ok then
  return
end

on_attach, lsp_flags, capabilities = require("user.lsp.config")

require("user.lsp.servers")(lspconfig, on_attach, lsp_flags, capabilities )

require("user.lsp.null-ls")
