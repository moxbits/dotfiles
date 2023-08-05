local ok_lsp, lspconfig = pcall(require, "lspconfig")
local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")

if not ok_lsp then
	print("lsp plugin is not initialized. maybe it is not installed")
	return
end

if not ok_mason_lsp then
  print("could not init mason lspconfig. maybe it is not installed")
  return
end

local handlers = require("xac.mason.handlers") 

handlers.setup {}

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

local customized_servers = {
  "intelephense"
}

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup(opts)
    for _, server in ipairs(customized_servers) do
      if server_name == server then
        local settings = require("xac.mason.settings." .. server_name).generate(lspconfig)
        settings["on_attach"] = opts.on_attach
        settings["capabilities"] = opts.capabilities
        lspconfig[server_name].setup(settings)
      end
    end
  end,
})

