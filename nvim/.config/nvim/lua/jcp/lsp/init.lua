local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jcp.lsp.configs"
require("jcp.lsp.handlers").setup()
require "jcp.lsp.null-ls"
