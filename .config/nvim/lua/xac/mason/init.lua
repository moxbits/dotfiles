local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "xac.mason.mason"
require("xac.mason.handlers").setup()
require "xac.mason.null-ls"

