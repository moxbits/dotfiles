function Setup(lspconfig, on_attach, lsp_flags, capabilities)
  local langs_list = {
    "sumneko_lua",
    "pyright",
    "tsserver",
    "jsonls",

    -- web servers
    "html",
    "cssls",
    "emmet_ls",
    "intelephense",
  }

  for _, lsp in ipairs(langs_list) do

    if lsp == "tsserver" then
      lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "*.ts", "*.js")
      }
    elseif lsp == "intelephense" then
      lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("composer.json", ".git", "*.php")
      }
    else
      lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
      }
    end

  end

end

return Setup

