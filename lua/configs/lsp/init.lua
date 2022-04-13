local present, _ = pcall(require, 'lspconfig')
if not present then
  return
end

require 'configs.lsp.lsp-installer'
require('configs.lsp.handlers').setup()
