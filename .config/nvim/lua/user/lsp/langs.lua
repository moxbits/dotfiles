function setup(lspconfig, on_attach, lsp_flags, capabilities)
  local langs_list = {
    "sumneko_lua",
    "pyright",
    "tsserver",
  }

  for _, lsp in ipairs(langs_list) do

    lspconfig[lsp].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }

  end

end

return setup

