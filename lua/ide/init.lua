local M = {}

function M.setup()
  require("ide.treesitter").setup()
  require("ide.lsp").setup()
  require("ide.cmp").setup()
end

return M
