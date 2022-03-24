local present, _ = pcall(require, "lspconfig")
if not present then
  return
end

require "miniature.lsp.lsp-installer"
require("miniature.lsp.handlers").setup()
require "miniature.lsp.null-ls"
